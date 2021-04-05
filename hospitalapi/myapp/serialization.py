from rest_framework import serializers
from myapp.models import Patientmodel,Doctormodel,Nursemodel

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
