import os

if __name__ == '__main__':
    path_dict = {}
    path_dict['photo_paths'] = os.listdir('../../static/unusal_action')
    path_dict['ab_path'] = os.path.abspath('../../../static/unusal_action')
    print(path_dict)
    b = os.path.abspath('.')
    print(b)
    a = os.listdir('../../Face_test/face_feature')
    print(a)
    x = []
    for i in a:
        x.append(i.split('_')[0])

    x = list(set(x))
    print(x)
