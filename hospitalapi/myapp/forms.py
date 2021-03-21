from django.forms import ModelForm
from .models import Patientmodel
from django import forms


class PatientForm(ModelForm):
    class Meta:
        model=Patientmodel
        fields=['patId','patName','phone']
