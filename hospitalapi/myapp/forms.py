from django.forms import ModelForm
from .models import Patientmodel,Doctormodel,Nursemodel
from django import forms


class PatientForm(ModelForm):
    class Meta:
        model=Patientmodel
        fields='__all__'

class DoctorForm(ModelForm):
    class Meta:
        model=Doctormodel
        fields='__all__'

class NurseForm(ModelForm):
    class Meta:
        model=Nursemodel
        fields='__all__'
