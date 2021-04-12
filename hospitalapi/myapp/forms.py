from django.forms import ModelForm
from .models import Patientmodel,Doctormodel,Nursemodel, Appointmentmodel, Roommodel, Billingmodel,BloodBankmodel,Diagnosismodel
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

class AppointmentForm(ModelForm):
    class Meta:
        model=Appointmentmodel
        fields='__all__'

class RoomForm(ModelForm):
    class Meta:
        model=Roommodel
        fields='__all__'

class BillingForm(ModelForm):
    class Meta:
        model=Billingmodel
        fields='__all__'

class BloodBankForm(ModelForm):
    class Meta:
        model=BloodBankmodel
        fields='__all__'

class DiagnosisForm(ModelForm):
    class Meta:
        model=Diagnosismodel
        fields='__all__'
