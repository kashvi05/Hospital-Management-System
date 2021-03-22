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
 ]
