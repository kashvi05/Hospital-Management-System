from rest_framework import serializers
from myapp.models import Patientmodel,Doctormodel,Nursemodel, Appointmentmodel, Roommodel, Billingmodel, BloodBankmodel

class SerializationclassPatient(serializers.ModelSerializer):
    class Meta:
        model=Patientmodel
        fields='__all__'

class SerializationclassDoctor(serializers.ModelSerializer):
    class Meta:
        model=Doctormodel
        fields='__all__'

class SerializationclassNurse(serializers.ModelSerializer):
    class Meta:
        model=Nursemodel
        fields='__all__'

class SerializationclassAppointment(serializers.ModelSerializer):
    class Meta:
        model=Appointmentmodel
        fields='__all__'

class SerializationclassRoom(serializers.ModelSerializer):
    class Meta:
        model=Roommodel
        fields='__all__'

class SerializationclassBilling(serializers.ModelSerializer):
    class Meta:
        model=Billingmodel
        fields='__all__'

class SerializationclassBlood(serializers.ModelSerializer):
    class Meta:
        model=BloodBankmodel
        fields='__all__'
