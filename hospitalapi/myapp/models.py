from django.db import models
from django.db.models import CharField
from django.db.models import IntegerField
from django.db.models import BooleanField
from django.db.models import FloatField
from django.db.models import DateTimeField
from django.db.models import DateField
from django.db.models import TimeField

class Patientmodel(models.Model):
    Patient_Id=models.IntegerField(primary_key=True)
    Patient_Name=models.CharField(max_length=100)
    Gender=models.CharField(max_length=1)
    Age=models.IntegerField()
    Blood_Group=CharField(max_length=3)
    Address=CharField(max_length=225)
    Patient_Contact_No=CharField(max_length=10)
    Residence_No=CharField(max_length=8)
    Email_Id=CharField(max_length=225)
    Emergency_Number=CharField(max_length=10)
    Emergency_Contact_Name=CharField(max_length=300)
    Purpose=CharField(max_length=300)
    Emergency_Patient=BooleanField()
    class Meta:
        db_table='patient_table'

class Doctormodel(models.Model):
    Doctor_Id=IntegerField(primary_key=True)
    Doctor_Name=CharField(max_length=255)
    Age=IntegerField()
    Speciality=CharField(max_length=255)
    Email_Id=CharField(max_length=255)
    Contact_No=CharField(max_length=10)
    Office_Room_No=IntegerField()
    Salary=FloatField()
    Patient_Id=IntegerField()
    class Meta:
        db_table='doctor_table'

class Nursemodel(models.Model):
    Nurse_Id=IntegerField(primary_key=True)
    Nurse_Name=CharField(max_length=300)
    Gender=CharField(max_length=1)
    Age=IntegerField()
    Phone_Number=CharField(max_length=10)
    Joining_date=DateField()
    Shift_Days=CharField(max_length=300)
    Shift_timing=CharField(max_length=300)
    Position=CharField(max_length=300)
    Salary=FloatField()
    Patient_Id=IntegerField()
    class Meta:
        db_table='nurse_table'

class Appointmentmodel(models.Model):
    Patient_Id=IntegerField(primary_key=True)
    Patient_Name=CharField(max_length=255)
    Appointment_Date=DateField()
    Time=CharField(max_length=30)
    Purpose=CharField(max_length=255)
    Patient_Contact_No=CharField(max_length=10)
    Doctor_Id=IntegerField()
    Doctor_Name=CharField(max_length=255)
    Room_No=IntegerField()
    class Meta:
        db_table='appointment_table'

class Roommodel(models.Model):
    Room_No=IntegerField(primary_key=True)
    Room_type=CharField(max_length=100)
    Number_of_bed=IntegerField()
    Availability_status=BooleanField()
    class Meta:
        db_table='room_table'

class Billingmodel(models.Model):
    Bill_No=IntegerField(primary_key=True)
    Bill_Date=DateField()
    Patient_Id=IntegerField()
    Patient_Name=CharField(max_length=255)
    Doctor_Id=IntegerField()
    Doctors_fees=FloatField()
    Room_Charges=FloatField()
    Tests_Charges=FloatField()
    Tax=FloatField()
    Total_Amount=FloatField()
    class Meta:
        db_table='billing'

class BloodBankmodel(models.Model):
    Serial_No=IntegerField(primary_key=True)
    Date_issued=DateField()
    Blood_Group=CharField(max_length=3)
    Pints_donated=IntegerField()
    class Meta:
        db_table='blood_bank_records'

class Diagnosismodel(models.Model):
    Diagnosis_ID=IntegerField(primary_key=True)
    Date=DateField()
    Diagnosis_details=CharField(max_length=300)
    Remarks=CharField(max_length=300)
    Prescription=CharField(max_length=300)
    Insurance_Policy_No=CharField(max_length=300)
    Patient_Id=IntegerField()
    class Meta:
        db_table='patient_diagnosis'

class Visitormodel(models.Model):
     Visitor_Id=IntegerField(primary_key=True)
     Visitor_Name=CharField(max_length=300)
     Patient_Id=IntegerField()
     Patient_Name=CharField(max_length=300)
     Time=CharField(max_length=20)
     Room_No=IntegerField()
     class Meta:
         db_table='visitors_table'

class Emergencymodel(models.Model):
    Patient_Id=IntegerField(primary_key=True)
    Patient_Name=CharField(max_length=300)
    Room_No=IntegerField()
    Contact_Number=CharField(max_length=10)
    class Meta:
        db_table='emergency_room_log'

class diagnosis_patientmodel(models.Model):
    Patient_Id=IntegerField()
    Patient_Name=CharField(max_length=300)
    Diagnosis_Details=CharField(max_length=300)
    Purpose=CharField(max_length=300)
    Remarks=CharField(max_length=300)
    Prescription=CharField(max_length=300)

class final_amount(models.Model):
    Patient_Name=CharField(max_length=300)
    Patient_Id=IntegerField()
    Purpose=CharField(max_length=300)
    Contact_No=CharField(max_length=10)
    Total_Amount=float()

class nurse_doctor(models.Model):
    Patient_Id=IntegerField()
    Patient_Name=CharField(max_length=300)
    Nurse_Id=IntegerField()
    Nurse_Name=CharField(max_length=300)
    Nurse_Position=CharField(max_length=300)
    Doctor_Id=IntegerField
    Doctor_Name=CharField(max_length=300)
    Doctor_Speciality=CharField(max_length=300)


class patient_doctor(models.Model):
    Patient_Id=IntegerField()
    Patient_Name=CharField(max_length=300)
    Appointment_Date=DateField()
    Time=CharField(max_length=300)
    Purpose=CharField(max_length=300)
    Patient_Contact_No=CharField(max_length=10)
    Doctor_Id=IntegerField()
    Doctor_Name=CharField(max_length=300)
    Room_No=IntegerField()

class Blood_Group(models.Model):
    count_pints=IntegerField()

class room_filter(models.Model):
    Room_No=IntegerField()
    Room_type=CharField(max_length=300)
    Number_of_beds=IntegerField()
    Availability_status=BooleanField()

class summation(models.Model):
    Total_Amount=FloatField()

class beds_in_room(models.Model):
    Number_of_beds=IntegerField()

class no_of_appointments(models.Model):
    appointments=IntegerField

class blood_group_func(models.Model):
    total_patients=IntegerField()
