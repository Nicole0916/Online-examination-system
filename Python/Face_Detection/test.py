# coding=utf-8
import sys
import os
from PIL import Image
import numpy as np
import torch
import datetime
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(BASE_DIR)
from .utils.utils import *

def xywh2xyxy(x):
    # Convert nx4 boxes from [x, y, w, h] to [x1, y1, x2, y2] where xy1=top-left, xy2=bottom-right
    y = torch.zeros_like(x) if isinstance(x, torch.Tensor) else np.zeros_like(x)
    y[:, 0] = x[:, 0] - x[:, 2] / 2  # top left x
    y[:, 1] = x[:, 1] - x[:, 3] / 2  # top left y
    y[:, 2] = x[:, 0] + x[:, 2] / 2  # bottom right x
    y[:, 3] = x[:, 1] + x[:, 3] / 2  # bottom right y
    return y

def non_max_suppression(prediction, conf_thres=0.1, iou_thres=0.6, merge=False, classes=None, agnostic=False):
    """Performs Non-Maximum Suppression (NMS) on inference results

    Returns:
         detections with shape: nx6 (x1, y1, x2, y2, conf, cls)
    """
    if prediction.dtype is torch.float16:
        prediction = prediction.float()  # to FP32

    nc = prediction[0].shape[1] - 5  # number of classes
    xc = prediction[..., 4] > conf_thres  # candidates

    # Settings
    min_wh, max_wh = 2, 4096  # (pixels) minimum and maximum box width and height
    max_det = 300  # maximum number of detections per image
    time_limit = 10.0  # seconds to quit after
    redundant = True  # require redundant detections
    multi_label = nc > 1  # multiple labels per box (adds 0.5ms/img)

    t = time.time()
    output = [None] * prediction.shape[0]
    for xi, x in enumerate(prediction):  # image index, image inference
        # Apply constraints
        # x[((x[..., 2:4] < min_wh) | (x[..., 2:4] > max_wh)).any(1), 4] = 0  # width-height
        x = x[xc[xi]]  # confidence

        # If none remain process next image
        if not x.shape[0]:
            continue

        # Compute conf
        x[:, 5:] *= x[:, 4:5]  # conf = obj_conf * cls_conf

        # Box (center x, center y, width, height) to (x1, y1, x2, y2)
        box = xywh2xyxy(x[:, :4])

        # Detections matrix nx6 (xyxy, conf, cls)
        if multi_label:
            i, j = (x[:, 5:] > conf_thres).nonzero().t()
            x = torch.cat((box[i], x[i, j + 5, None], j[:, None].float()), 1)
        else:  # best class only
            conf, j = x[:, 5:].max(1, keepdim=True)
            x = torch.cat((box, conf, j.float()), 1)[conf.view(-1) > conf_thres]

        # Filter by class
        if classes:
            x = x[(x[:, 5:6] == torch.tensor(classes, device=x.device)).any(1)]

        # Apply finite constraint
        # if not torch.isfinite(x).all():
        #     x = x[torch.isfinite(x).all(1)]

        # If none remain process next image
        n = x.shape[0]  # number of boxes
        if not n:
            continue

        # Sort by confidence
        # x = x[x[:, 4].argsort(descending=True)]

        # Batched NMS
        c = x[:, 5:6] * (0 if agnostic else max_wh)  # classes
        boxes, scores = x[:, :4] + c, x[:, 4]  # boxes (offset by class), scores
        i = torchvision.ops.boxes.nms(boxes, scores, iou_thres)
        if i.shape[0] > max_det:  # limit detections
            i = i[:max_det]
        if merge and (1 < n < 3E3):  # Merge NMS (boxes merged using weighted mean)
            try:  # update boxes as boxes(i,4) = weights(i,n) * boxes(n,4)
                iou = box_iou(boxes[i], boxes) > iou_thres  # iou matrix
                # iou = bbox_iou(boxes[i], boxes,x1y1x2y2=True,DIoU=True) > iou_thres
                weights = iou * scores[None]  # box weights
                x[i, :4] = torch.mm(weights, x[:, :4]).float() / weights.sum(1, keepdim=True)  # merged boxes
                if redundant:
                    i = i[iou.sum(1) > 1]  # require redundancy
            except:  # possible CUDA error https://github.com/ultralytics/yolov3/issues/1139
                print(x, i, x.shape, i.shape)
                pass

        output[xi] = x[i]
        if (time.time() - t) > time_limit:
            break  # time limit exceeded

    return output

def box_iou(box1, box2):
    # https://github.com/pytorch/vision/blob/master/torchvision/ops/boxes.py
    """
    Return intersection-over-union (Jaccard index) of boxes.
    Both sets of boxes are expected to be in (x1, y1, x2, y2) format.
    Arguments:
        box1 (Tensor[N, 4])
        box2 (Tensor[M, 4])
    Returns:
        iou (Tensor[N, M]): the NxM matrix containing the pairwise
            IoU values for every element in boxes1 and boxes2
    """

    def box_area(box):
        # box = 4xn
        return (box[2] - box[0]) * (box[3] - box[1])

    area1 = box_area(box1.t())
    area2 = box_area(box2.t())

    # inter(N,M) = (rb(N,M,2) - lt(N,M,2)).clamp(0).prod(2)
    inter = (torch.min(box1[:, None, 2:], box2[:, 2:]) - torch.max(box1[:, None, :2], box2[:, :2])).clamp(0).prod(2)
    return inter / (area1[:, None] + area2 - inter)  # iou = inter / (area1 + area2 - inter)

def letterbox(img, new_shape=(416, 416), color=(114, 114, 114), auto=True, scaleFill=False, scaleup=True):
    # Resize image to a 32-pixel-multiple rectangle https://github.com/ultralytics/yolov3/issues/232
    shape = img.shape[:2]  # current shape [height, width]
    if isinstance(new_shape, int):
        new_shape = (new_shape, new_shape)

    # Scale ratio (new / old)
    r = min(new_shape[0] / shape[0], new_shape[1] / shape[1])
    if not scaleup:  # only scale down, do not scale up (for better test mAP)
        r = min(r, 1.0)

    # Compute padding
    ratio = r, r  # width, height ratios
    new_unpad = int(round(shape[1] * r)), int(round(shape[0] * r))
    dw, dh = new_shape[1] - new_unpad[0], new_shape[0] - new_unpad[1]  # wh padding
    if auto:  # minimum rectangle
        dw, dh = np.mod(dw, 64), np.mod(dh, 64)  # wh padding
    elif scaleFill:  # stretch
        dw, dh = 0.0, 0.0
        new_unpad = new_shape
        ratio = new_shape[0] / shape[1], new_shape[1] / shape[0]  # width, height ratios

    dw /= 2  # divide padding into 2 sides
    dh /= 2

    if shape[::-1] != new_unpad:  # resize
        img = cv2.resize(img, new_unpad, interpolation=cv2.INTER_LINEAR)
    top, bottom = int(round(dh - 0.1)), int(round(dh + 0.1))
    left, right = int(round(dw - 0.1)), int(round(dw + 0.1))
    img = cv2.copyMakeBorder(img, top, bottom, left, right, cv2.BORDER_CONSTANT, value=color)  # add border
    return img, ratio, (dw, dh)



class Test_error():
    def __init__(self):

        self.img_size = 288 # YOLO检查的图片尺寸
        self.device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
        weights = os.path.join(sys.path[-1],'weights','last.pt')
        self.model =  torch.load(weights, map_location=self.device)['model'].float().to(self.device)
        self.names = self.model.names if hasattr(self.model, 'names') else self.model.modules.names

class Num_Test(Test_error):
    def __init__(self,user_id,root_path):
        super(Num_Test, self).__init__()
        self.user_id = user_id
        self.interval = 10 # 抓拍时间间隔
        self.catch_time = [None,None,None]
        self.cls = {
            0 : '转头',
            1 : '镜头内多人',
            2 : '镜头内无人',
        }
        self.test_1 = np.zeros(3).astype(int)
        self.THR = [8,5,5] # 抓拍帧数

        # 0 偏头 连续5帧
        # 1 多人 连续3帧
        # 2 无人 连续3帧
        #########################
        self.save_dir = os.path.join(root_path,'unusal_action')


    def save_img(self,img,index,now):
        if self.catch_time[index] is not None and now - self.catch_time[index] < self.interval:
            return 0
        self.catch_time[index] = now
        dateArray = datetime.datetime.utcfromtimestamp(now)
        otherStyleTime = dateArray.strftime("%Y-%m-%d %H-%M-%S")
        name = '{}_{}_{}.png'.format(otherStyleTime,self.user_id,self.cls[index])
        save_file = os.path.join(self.save_dir,name)
        img.save(save_file)
        self.test_1[:] = 0
        return 1

    def test(self,img):

        img_0 = img

        img = letterbox(img, new_shape=self.img_size)[0]
        img = np.transpose(img, (2, 0, 1))
        img = np.ascontiguousarray(img)
        img = torch.from_numpy(img).to(self.device)

        img = img.float()  # uint8 to fp16/32
        img /= 255.0  # 0 - 255 to 0.0 - 1.0
        if img.ndimension() == 3:
            img = img.unsqueeze(0)
        img = img.to(self.device)
        pred = self.model(img)[0].cpu()

        pred = non_max_suppression(pred)
        det = pred[0]
        label = "正常"
        status = 0
        if det is None:
            self.test_1[2] += 1
            self.test_1[:2] = 0
            if self.test_1[2] >= self.THR[2]:
                status = self.save_img(Image.fromarray(img_0), 2, time.time())
                label = '镜头内无人'

                # print("**********无人********")

        elif det.shape[0] == 1:
            label = '转头'
            det[:, :4] = scale_coords(img.shape[2:], det[:, :4], img_0.shape).round()
            *xyxy, conf, cls = det[0]
            result = conf.item()
            if result < 0.8:
                img_0 = plot_one_box(xyxy, img_0, label=label,color=(255, 0, 0), line_thickness=2)
                self.test_1[0] += 1
                self.test_1[1:] = 0
                if self.test_1[0] >= self.THR[0]:
                    status = self.save_img(img_0, 0, time.time())

                    # print("!!!!!!转头!!!!!")
            else:
                label = "正常"
                self.test_1 = np.zeros(3).astype(int)
                img_0 = plot_one_box(xyxy, img_0, label=label,color=(0, 255, 0), line_thickness=1)


        elif det.shape[0] > 1:
            label = '镜头内多人'
            self.test_1[1] += 1
            self.test_1[[0, 2]] = 0
            det[:, :4] = scale_coords(img.shape[2:], det[:, :4], img_0.shape).round()
            for idx in range(len(det)):
                *xyxy, conf, cls = det[idx]
                img_0 = plot_one_box(xyxy, img_0, label=label,color=(255, 177, 53), line_thickness=3)
                img_0 = cv2.cvtColor(np.array(img_0), cv2.COLOR_BGR2RGB)
            img_0 = Image.fromarray(img_0)

            if self.test_1[1] >=self.THR[1]:
               status = self.save_img(img_0, 1, time.time())





                # print("--------多人---------")
        # self.save_img(img_0, 1, time.time())
        return {'image':cv2.cvtColor(np.array(img_0),cv2.COLOR_BGR2RGB),'label':label,'status':status}

