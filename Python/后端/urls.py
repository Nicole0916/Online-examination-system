"""后端 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from demo import views


urlpatterns = [
    # path('',views.index),
    # path('admin/', admin.site.urls),
    # path('post/',views.model),
    # path('train/',views.train_platform),
    # path('train/test/',views.eva),
    # path('train/test/get/',views.monitor),
    # path('train/test/density/',views.train_density),
    # path('get/',views.hanshu),
    # path('backup/',views.backup),
    # path('load/',views.model_load),

    path('',views.supervision),
    path('camera/',views.detact),
    path('camera_off/',views.camara_off),
    path('upload/',views.upload),
    path('upload_1/', views.upload_1),
    path('recognize/', views.recognize),
    path('websocket/', views.websocket_on,name='websocket'),
    path('drew/', views.drew),
    path('face_recognize/', views.face_recognize),
    path('face_information_collection/', views.face_information_collection),
    path('supervision/',views.supervision),
    path('vidieo/',views.vidieo),

    path('photo_list/',views.photo_list),
    path('upload_unusual_image/', views.upload_unusual_image),
    path('Yolo_upload/',views.Yolo_upload),

    path('switch_user/', views.switch_user),
    # 添加一个用户
    path('add_fi/', views.add_fi),

    # 添加一个用户
    path('switch_display_mode/', views.switch_display_mode),
]
