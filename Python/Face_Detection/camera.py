import datetime
import random
import sys
import time
from pathlib import Path
import cv2
import torch
from torch.backends import cudnn

from utils import google_utils, torch_utils
from utils.datasets import LoadStreams
from utils.utils import plot_one_box

FILE = Path(__file__).absolute()
sys.path.append(FILE.parents[0].as_posix())  # add yolov5/ to path

from utils.general import is_ascii, non_max_suppression, scale_coords, set_logging
from utils.plots import Annotator, colors
from utils.torch_utils import select_device


@torch.no_grad()
def run(weights='weights/last.pt',  # model.pt path(s)
        conf_thres=0.25,  # confidence threshold
        iou_thres=0.45,  # NMS IOU threshold
        max_det=1000,  # maximum detections per image
        device='',  # cuda device, i.e. 0 or 0,1,2,3 or cpu
        classes=None,  # filter by class: --class 0, or --class 0 2 3
        agnostic_nms=False,  # class-agnostic NMS
        line_thickness=3,  # bounding box thickness (pixels)
        half=False,  # use FP16 half-precision inference
        ):
    # Initialize
    # Initialize
    device = torch_utils.select_device(device)

    # Load model
    google_utils.attempt_download(weights)
    model = torch.load(weights, map_location=device)['model'].float()  # load to FP32
    # torch.save(torch.load(weights, map_location=device), weights)  # update model if SourceChangeWarning
    # model.fuse()
    model.to(device).eval()
    if half:
        model.half()  # to FP16

    # Second-stage classifier
    classify = False
    if classify:
        modelc = torch_utils.load_classifier(name='resnet101', n=2)  # initialize
        modelc.load_state_dict(torch.load('weights/resnet101.pt', map_location=device)['model'])  # load weights
        modelc.to(device).eval()

    view_img = True
    cudnn.benchmark = True  # set True to speed up constant image size inference
    dataset = LoadStreams('0', img_size=640)

    # Get names and colors
    names = model.names if hasattr(model, 'names') else model.modules.names
    colors = [[random.randint(0, 255) for _ in range(3)] for _ in range(len(names))]

    capture = cv2.VideoCapture(0)

    t0 = time.time()
    img = torch.zeros((1, 3, 640, 640), device=device)  # init img
    _ = model(img.half() if half else img) if device.type != 'cpu' else None  # run once
    for path, img, im0s, vid_cap in dataset:
        img = torch.from_numpy(img).to(device)
        img = img.half() if half else img.float()  # uint8 to fp16/32
        img /= 255.0  # 0 - 255 to 0.0 - 1.0
        if img.ndimension() == 3:
            img = img.unsqueeze(0)

        # Inference
        t1 = torch_utils.time_synchronized()
        pred = model(img, augment=False)[0]

        # Apply NMS
        pred = non_max_suppression(pred, conf_thres, iou_thres, classes=classes, agnostic=agnostic_nms)
        t2 = torch_utils.time_synchronized()


        # Process detections
        for i, det in enumerate(pred):  # detections per image
            p, s, im0 = path[i], '%g: ' % i, im0s[i].copy()

            s += '%gx%g ' % img.shape[2:]  # print string
            gn = torch.tensor(im0.shape)[[1, 0, 1, 0]]  #  normalization gain whwh
            if det is not None and len(det):
                # Rescale boxes from img_size to im0 size
                det[:, :4] = scale_coords(img.shape[2:], det[:, :4], im0.shape).round()

                # Print results
                for c in det[:, -1].unique():
                    n = (det[:, -1] == c).sum()  # detections per class
                    s += '%g %ss, ' % (n, names[int(c)])  # add to string
                    if n > 1:
                        print("警告！！！")
                        timestamp = datetime.datetime.strftime(datetime.datetime.now(), '%Y%m%d%H%M%S')
                        cv2.imwrite('images/' + timestamp + '.jpg', im0)

                # Write results
                for *xyxy, conf, cls in det:
                    label = '%s %.2f' % (names[int(cls)], conf)
                    plot_one_box(xyxy, im0, label=label, color=colors[int(cls)], line_thickness=3)
                    if conf.item() < 0.45:
                        print("警告！！！")
                        timestamp = datetime.datetime.strftime(datetime.datetime.now(), '%Y%m%d%H%M%S')
                        cv2.imwrite('images/' + timestamp + '.jpg', im0)
            else:
                print("警告！！！")
                timestamp = datetime.datetime.strftime(datetime.datetime.now(), '%Y%m%d%H%M%S')
                cv2.imwrite('images/' + timestamp + '.jpg', im0)

            # Print time (inference + NMS)
            print('%sDone. (%.3fs)' % (s, t2 - t1))
            # Stream results
            if view_img:
                cv2.imshow(p, im0)
                if cv2.waitKey(1) == ord('q'):  # q to quit
                    raise StopIteration




def main():
    run()


if __name__ == "__main__":
    main()

