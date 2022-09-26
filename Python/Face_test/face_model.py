import dlib
import numpy as np
import sys
import os
import cv2
import time

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(BASE_DIR)
path = sys.path[-1]

class FaceImport():
    def __init__(self,user_id):
        self.user_id = user_id
        self.dist_threshold = 0.3
        self.cnt = 0
        self.detrctor = dlib.get_frontal_face_detector()
        self.predictor = dlib.shape_predictor(os.path.join(path,'shape_predictor_68_face_landmarks.dat'))
        self.gacerec = dlib.face_recognition_model_v1(os.path.join(path,'dlib_face_recognition_resnet_model_v1.dat'))
        self.save_path = os.path.join(path,'face_feature')
        self.create_path(self.save_path)
        self.feature = None

    def create_path(self,path):
        if not os.path.exists(path):
            os.makedirs(path,exist_ok=True)

    def Euclidean_Distance(self,x, y):

        dist = np.sqrt(np.sum(np.square(x - y)))
        return dist

    def get_rectangles(self,face):
        return [face.left(),face.top(),face.right()-face.left(),face.bottom()-face.top()]


    def cheak_face(self,img):
        feature_path = os.path.join(path, 'face_feature')
        img_gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
        faces = self.detrctor(img_gray, 0)
        if len(faces) < 0:
            pass
        elif len(faces) == 1:
            # dict_d = dict()
            shape = self.predictor(img, faces[0])
            face_vector = self.gacerec.compute_face_descriptor(img, shape)
            list_npy = [npy for npy in os.listdir(feature_path) if self.user_id in npy]
            for npy_file in list_npy:
                feature = np.load(os.path.join(feature_path, npy_file))
                dist = self.Euclidean_Distance(face_vector, feature)
                if dist < self.dist_threshold:
                    return {'face_id': self.user_id}
            # dict_d = {k:np.mean(v) for k,v in dict_d.items()}
            # key = min(dict_d, key=lambda k: dict_d[k])
            return {'face_id': 0}

        elif len(faces) > 1:
            return {'face_id':0}

    def get_face(self,image):
        img_gray = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY)
        faces = self.detrctor(img_gray, 0)

        if len(faces) == 1:
            # for idx in range(len(faces)):
                # 人脸框
            rectangles= self.get_rectangles(faces[0])
            # 人脸点
            shape = self.get_points(faces[0], image)
            return {'rectangles': rectangles, 'shape': shape}
        return {'rectangles': [], 'shape': []}

    def get_img_feature(self,image):
        # 文件名（谁的照片），命名规则
        img_gray = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY)
        faces = self.detrctor(img_gray, 0)

        if len(faces) == 1:
            shape = self.predictor(image, faces[0])
            face_vector = self.gacerec.compute_face_descriptor(image, shape)
            save_path = os.path.join(self.save_path,
                                     self.user_id + '_' + str(self.cnt) + '_' + time.strftime("%Y-%m-%d-%H-%M-%S",
                                                                                              time.localtime()) + '.npy')
            np.save(save_path, face_vector)
            tip = 'The number of face is : {}'.format(str(len(faces)))
            self.cnt += 1
            return {'save_status': True}

        elif len(faces) > 1:
            tip = 'The number of face is : {}'.format(str(len(faces)))
            return {'save_status': False}

        else:
            tip = 'No face!'
            return {'save_status': False}

            # cnt += 1


    def get_points(self,face,img):
        shape = self.predictor(img, face)
        landmarks = [[p.x, p.y] for p in shape.parts()]
        return landmarks

    def get_feature(self):
        feature_path = os.path.join(path, 'face_feature')
        list_npy = [npy for npy in os.listdir(feature_path) if self.user_id in npy]
        feature = None
        for npy_file in list_npy[:10]:
            if feature is None:
                feature = np.load(os.path.join(feature_path, npy_file))[None]
            else:
                npy = np.load(os.path.join(feature_path, npy_file))[None]
                feature = np.concatenate((feature, npy), axis=0)
            print(feature.shape)
        self.feature = feature

    def oneline_test(self,img):

        if self.feature is None:
            self.get_feature()
        img_gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
        faces = self.detrctor(img_gray, 0)
        if len(faces) < 0:
            pass
        elif len(faces) == 1:

            shape = self.predictor(img, faces[0])

            face_vector = self.gacerec.compute_face_descriptor(img, shape)
            for feature in self.feature:
                dist = self.Euclidean_Distance(face_vector, feature)
                if dist < self.dist_threshold:
                    return {'face_id': self.user_id}
            return {'face_id': 0}

        elif len(faces) > 1:
            return {'face_id': 0}


if __name__ == '__main__':

    fi = FaceImport()
