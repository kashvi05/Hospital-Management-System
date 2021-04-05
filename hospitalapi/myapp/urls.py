from django.urls import path
from . import views

app_name = "myapp"

urlpatterns = [
    path('', views.displayHome, name="home"),
    path('home/', views.displayHome, name="home"),
    path('patient/', views.displaydata, name="patient"),
    path('create_patient/', views.create_patient, name="create_patient"),
    path("update_patient/<int:pk>/", views.update_patient, name="update_patient"),
    path("delete_patient/<int:pk>/", views.delete_patient, name="delete_patient"),
    path('doctor/', views.displaydoctor, name="doctor"),
    path('create_doctor/', views.create_doctor, name="create_doctor"),
    path("update_doctor/<int:pk>/", views.update_doctor, name="update_doctor"),
    path("delete_doctor/<int:pk>/", views.delete_doctor, name="delete_doctor"),
    path('nurse/', views.displaynurse, name="nurse"),
    path('create_nurse/', views.create_nurse, name="create_nurse"),
    path("update_nurse/<int:pk>/", views.update_nurse, name="update_nurse"),
    path("delete_nurse/<int:pk>/", views.delete_nurse, name="delete_nurse"),
 ]
