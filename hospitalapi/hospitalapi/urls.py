"""hospitalapi URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
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
from django.urls import path
from myapp import views
from django.conf.urls.static import static
from django.conf import settings
from django.conf.urls import include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('show',views.showPatient,name='showPatient'),
    path('showDoctor',views.showDoctor,name='showDoctor'),
    path('showNurse',views.showNurse,name='showNurse'),
    path('showAppointment',views.showAppointment,name='showAppointment'),
    path('showRoom',views.showRoom,name='showRoom'),
    path('showBill',views.showBill,name='showBill'),
    path('showBlood',views.showBlood,name='showBlood'),
    path('showDiagnosis',views.showDiagnosis,name='showDiagnosis'),
    path('showVisitor',views.showVisitor,name='showVisitor'),
    path('showEmergency',views.showEmergency,name='showEmergency'),
    path('', include('myapp.urls')),

]+static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
