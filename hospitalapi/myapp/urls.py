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
    path('appointment/', views.displayappointment, name="appointment"),
    path('create_appointment/', views.create_appointment, name="create_appointment"),
    path("update_appointment/<int:pk>/", views.update_appointment, name="update_appointment"),
    path("delete_appointment/<int:pk>/", views.delete_appointment, name="delete_appointment"),
    path('room/', views.displayroom, name="room"),
    path('create_room/', views.create_room, name="create_room"),
    path("update_room/<int:pk>/", views.update_room, name="update_room"),
    path("delete_room/<int:pk>/", views.delete_room, name="delete_room"),
    path('bill/', views.displaybill, name="bill"),
    path('create_bill/', views.create_bill, name="create_bill"),
    path("update_bill/<int:pk>/", views.update_bill, name="update_bill"),
    path("delete_bill/<int:pk>/", views.delete_bill, name="delete_bill"),
    path('blood/', views.displayblood, name="blood"),
    path('create_blood/', views.create_blood, name="create_blood"),
    path("update_blood/<str:pk>/", views.update_blood, name="update_blood"),
    path("delete_blood/<str:pk>/", views.delete_blood, name="delete_blood"),
 ]
