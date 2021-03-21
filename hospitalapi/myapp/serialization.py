from rest_framework import serializers
from myapp.models import Patientmodel

class Serializationclass(serializers.ModelSerializer):
    class Meta:
        model=Patientmodel
        fields='__all__'
