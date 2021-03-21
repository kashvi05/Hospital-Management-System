from django.db import models

class Patientmodel(models.Model):
    patId=models.IntegerField(primary_key=True)
    patName=models.CharField(max_length=100)
    phone=models.CharField(max_length=12)
    class Meta:
        db_table='patient'
