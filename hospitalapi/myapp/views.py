from myapp.serialization import SerializationclassPatient,SerializationclassDoctor,SerializationclassNurse, SerializationclassAppointment, SerializationclassRoom, SerializationclassBilling, SerializationclassBlood,SerializationclassDiagnosis, SerializationclassVisitor, SerializationclassEmergency
from myapp.models import Patientmodel
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import render, redirect
from django.db import connection
import requests
from .forms import PatientForm, DoctorForm, NurseForm, AppointmentForm, RoomForm, BillingForm, BloodBankForm,DiagnosisForm, VisitorForm, EmergencyForm
from .models import Patientmodel, Doctormodel, Nursemodel, Appointmentmodel, Roommodel, Billingmodel, BloodBankmodel, Diagnosismodel, Visitormodel, Emergencymodel, diagnosis_patientmodel,final_amount,nurse_doctor,patient_doctor,room_filter,summation,Blood_Group,room_filter,beds_in_room,no_of_appointments,blood_group_func
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django.contrib import messages
from route_decorator import Route
route=Route()

@api_view(['GET'])
def showPatient(request):
    if request.method=='GET':
        results=Patientmodel.objects.all()
        serialize=SerializationclassPatient(results,many=True)
        return Response(serialize.data)

@api_view(['GET'])
def showDoctor(request):
    if request.method=='GET':
        results=Doctormodel.objects.all()
        serialize=SerializationclassDoctor(results,many=True)
        return Response(serialize.data)

@api_view(['GET'])
def showNurse(request):
    if request.method=='GET':
        results=Nursemodel.objects.all()
        serialize=SerializationclassNurse(results,many=True)
        return Response(serialize.data)

@api_view(['GET'])
def showAppointment(request):
    if request.method=='GET':
        results=Appointmentmodel.objects.all()
        serialize=SerializationclassAppointment(results,many=True)
        return Response(serialize.data)

@api_view(['GET'])
def showRoom(request):
    if request.method=='GET':
        results=Roommodel.objects.all()
        serialize=SerializationclassRoom(results,many=True)
        return Response(serialize.data)

@api_view(['GET'])
def showBill(request):
    if request.method=='GET':
        results=Billingmodel.objects.all()
        serialize=SerializationclassBilling(results,many=True)
        return Response(serialize.data)

@api_view(['GET'])
def showBlood(request):
    if request.method=='GET':
        results=BloodBankmodel.objects.all()
        serialize=SerializationclassBlood(results,many=True)
        return Response(serialize.data)

@api_view(['GET'])
def showDiagnosis(request):
    if request.method=='GET':
        results=Diagnosismodel.objects.all()
        serialize=SerializationclassDiagnosis(results,many=True)
        return Response(serialize.data)

@api_view(['GET'])
def showVisitor(request):
    if request.method=='GET':
        results=Visitormodel.objects.all()
        serialize=SerializationclassVisitor(results,many=True)
        return Response(serialize.data)

@api_view(['GET'])
def showEmergency(request):
    if request.method=='GET':
        results=Emergencymodel.objects.all()
        serialize=SerializationclassEmergency(results,many=True)
        return Response(serialize.data)

def displayHome(request):
    return render(request,'index.html')


def displaydata(request):
    callapi=requests.get('http://127.0.0.1:8000/show')
    results=callapi.json()
    return render(request,'Patient.html',{'Patientmodel':results})

def displaydoctor(request):
    callapi=requests.get('http://127.0.0.1:8000/showDoctor')
    results=callapi.json()
    return render(request,'Doctor.html',{'Doctormodel':results})

def displaynurse(request):
    callapi=requests.get('http://127.0.0.1:8000/showNurse')
    results=callapi.json()
    return render(request,'Nurse.html',{'Nursemodel':results})

def displayappointment(request):
    callapi=requests.get('http://127.0.0.1:8000/showAppointment')
    results=callapi.json()
    return render(request,'Appointment.html',{'Appointmentmodel':results})

def displayroom(request):
    callapi=requests.get('http://127.0.0.1:8000/showRoom')
    results=callapi.json()
    return render(request,'Room.html',{'Roommodel':results})

def displaybill(request):
    callapi=requests.get('http://127.0.0.1:8000/showBill')
    results=callapi.json()
    return render(request,'Bill.html',{'Billingmodel':results})

def displayblood(request):
    callapi=requests.get('http://127.0.0.1:8000/showBlood')
    results=callapi.json()
    return render(request,'Blood.html',{'BloodBankmodel':results})

def displaydiagnosis(request):
    callapi=requests.get('http://127.0.0.1:8000/showDiagnosis')
    results=callapi.json()
    return render(request,'Diagnosis.html',{'Diagnosismodel':results})

def displayvisitor(request):
    callapi=requests.get('http://127.0.0.1:8000/showVisitor')
    results=callapi.json()
    return render(request,'Visitor.html',{'Visitormodel':results})

def displayemergency(request):
    callapi=requests.get('http://127.0.0.1:8000/showEmergency')
    results=callapi.json()
    return render(request,'Emergency.html',{'Emergencymodel':results})

def create_patient(request):
    inst=Patientmodel()
    form=PatientForm(instance=inst)
    if request.method=='POST':
        form=PatientForm(request.POST,instance=inst)
        if form.is_valid():
            form.save()
            messages.info(request,"New patient created successfully!!")
            return redirect('/patient')

    context={'form':form}
    return render(request,'create_patient.html',context)

def create_doctor(request):
    inst=Doctormodel()
    form=DoctorForm(instance=inst)
    if request.method=='POST':
        form=DoctorForm(request.POST,instance=inst)
        if form.is_valid():
            form.save()
            messages.info(request,"New doctor created successfully!!")
            return redirect('/doctor')


    context={'form':form}
    return render(request,'create_doctor.html',context)

def create_nurse(request):
    inst=Nursemodel()
    form=NurseForm(instance=inst)
    if request.method=='POST':
        form=NurseForm(request.POST,instance=inst)
        if form.is_valid():
            form.save()
            messages.info(request,"New nurse created successfully!!")
            return redirect('/nurse')


    context={'form':form}
    return render(request,'create_nurse.html',context)

def create_appointment(request):
    inst=Appointmentmodel()
    form=AppointmentForm(instance=inst)
    if request.method=='POST':
        form=AppointmentForm(request.POST,instance=inst)
        if form.is_valid():
            form.save()
            messages.info(request,"New appointment created successfully!!")
            return redirect('/appointment')




    context={'form':form}
    return render(request,'create_appointment.html',context)

def create_room(request):
    inst=Roommodel()
    form=RoomForm(instance=inst)
    if request.method=='POST':
        form=RoomForm(request.POST,instance=inst)
        if form.is_valid():
            form.save()
            messages.info(request,"New room created successfully!!")
            return redirect('/room')


    context={'form':form}
    return render(request,'create_room.html',context)

def create_bill(request):
    inst=Billingmodel()
    form=BillingForm(instance=inst)
    if request.method=='POST':
        form=BillingForm(request.POST,instance=inst)
        if form.is_valid():
            form.save()
            messages.info(request,"New bill created successfully!!")
            return redirect('/bill')


    context={'form':form}
    return render(request,'create_bill.html',context)

def create_blood(request):
    inst=BloodBankmodel()
    form=BloodBankForm(instance=inst)
    if request.method=='POST':
        form=BloodBankForm(request.POST,instance=inst)
        if form.is_valid():
            form.save()
            messages.info(request,"New blood record created successfully!!")
            return redirect('/blood')


    context={'form':form}
    return render(request,'create_blood.html',context)

def create_diagnosis(request):
    inst=Diagnosismodel()
    form=DiagnosisForm(instance=inst)
    if request.method=='POST':
        form=DiagnosisForm(request.POST,instance=inst)
        if form.is_valid():
            form.save()
            messages.info(request,"New diagnosis record created successfully!!")
            return redirect('/diagnosis')


    context={'form':form}
    return render(request,'create_diagnosis.html',context)

def create_visitor(request):
        inst=Visitormodel()
        form=VisitorForm(instance=inst)
        if request.method=='POST':
            form=VisitorForm(request.POST,instance=inst)
            if form.is_valid():
                form.save()
                messages.info(request,"New visitor record created successfully!!")
                return redirect('/visitor')


        context={'form':form}
        return render(request,'create_visitor.html',context)

def create_emergency(request):
        inst=Emergencymodel()
        form=EmergencyForm(instance=inst)
        if request.method=='POST':
            form=EmergencyForm(request.POST,instance=inst)
            if form.is_valid():
                form.save()
                messages.info(request,"New emergency room created successfully!!")
                return redirect('/emergency')


        context={'form':form}
        return render(request,'create_emergency.html',context)

def update_patient(request,pk):
    curr_patient=Patientmodel.objects.get(Patient_Id=pk)
    name=curr_patient.Patient_Name
    form =PatientForm(initial={'Patient_Id':curr_patient.Patient_Id,'Patient_Name':name,'Gender':curr_patient.Gender,'Age':curr_patient.Age,'Blood_Group':curr_patient.Blood_Group,'Address':curr_patient.Address,'Patient_Contact_No':curr_patient.Patient_Contact_No,'Residence_No':curr_patient.Residence_No,'Email_Id':curr_patient.Email_Id,'Emergency_Number':curr_patient.Emergency_Number,'Emergency_Contact_Name':curr_patient.Emergency_Contact_Name,'Purpose':curr_patient.Purpose,'Emergency_Patient':curr_patient.Emergency_Patient})
    if request.method == 'POST':
        form = PatientForm(request.POST,instance=curr_patient)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/patient')


    context={'form':form}
    return render(request,'update_patient.html',context)


def update_doctor(request,pk):
    curr_doctor=Doctormodel.objects.get(Doctor_Id=pk)
    name=curr_doctor.Doctor_Name
    form =DoctorForm(initial={'Doctor_Id':curr_doctor.Doctor_Id,'Doctor_Name':name,'Age':curr_doctor.Age,'Speciality':curr_doctor.Speciality,'Email_Id':curr_doctor.Email_Id,'Contact_No':curr_doctor.Contact_No,'Office_Room_No':curr_doctor.Office_Room_No,'Salary':curr_doctor.Salary,'Patient_Id':curr_doctor.Patient_Id})
    if request.method == 'POST':
        form = DoctorForm(request.POST,instance=curr_doctor)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/doctor')


    context={'form':form}
    return render(request,'update_doctor.html',context)

def update_nurse(request,pk):
    curr_nurse=Nursemodel.objects.get(Nurse_Id=pk)
    name=curr_nurse.Nurse_Name
    form =NurseForm(initial={'Nurse_Id':curr_nurse.Nurse_Id,'Nurse_Name':name,'Gender':curr_nurse.Gender,'Age':curr_nurse.Age,'Phone_Number':curr_nurse.Phone_Number,'Joining_date':curr_nurse.Joining_date,'Shift_Days':curr_nurse.Shift_Days,'Shift_timing':curr_nurse.Shift_timing,'Position':curr_nurse.Position,'Salary':curr_nurse.Salary,'Patient_Id':curr_nurse.Patient_Id})
    if request.method == 'POST':
        form = NurseForm(request.POST,instance=curr_nurse)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/nurse')


    context={'form':form}
    return render(request,'update_nurse.html',context)

def update_appointment(request,pk):
    curr_app=Appointmentmodel.objects.get(Patient_Id=pk)
    name=curr_app.Patient_Name
    form =AppointmentForm(initial={'Patient_Id':curr_app.Patient_Id,'Patient_Name':name,'Appointment_Date':curr_app.Appointment_Date,'Time':curr_app.Time,'Purpose':curr_app.Purpose,'Patient_Contact_No':curr_app.Patient_Contact_No,'Doctor_Id':curr_app.Doctor_Id,'Doctor_Name':curr_app.Doctor_Name,'Room_No':curr_app.Room_No})
    if request.method == 'POST':
        form = AppointmentForm(request.POST,instance=curr_app)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/appointment')


    context={'form':form}
    return render(request,'update_appointment.html',context)

def update_room(request,pk):
    curr_room=Roommodel.objects.get(Room_No=pk)
    name=curr_room.Room_type
    form =RoomForm(initial={'Room_No':curr_room.Room_No,'Room_type':name,'Number_of_bed':curr_room.Number_of_bed,'Availability_status':curr_room.Availability_status})
    if request.method == 'POST':
        form =RoomForm(request.POST,instance=curr_room)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/room')


    context={'form':form}
    return render(request,'update_room.html',context)

def update_bill(request,pk):
    curr_bill=Billingmodel.objects.get(Bill_No=pk)
    name=curr_bill.Bill_No
    form =BillingForm(initial={'Bill_No':curr_bill.Bill_No,'Bill_Date':curr_bill.Bill_Date,'Patient_Id':curr_bill.Patient_Id,'Patient_Name':curr_bill.Patient_Id,'Patient_Name':curr_bill.Patient_Name,'Doctor_Id':curr_bill.Doctor_Id,'Doctors_fees':curr_bill.Doctors_fees,'Room_Charges':curr_bill.Room_Charges,'Tests_Charges':curr_bill.Tests_Charges,'Tax':curr_bill.Tax,'Total_Amount':curr_bill.Total_Amount})
    if request.method == 'POST':
        form =BillingForm(request.POST,instance=curr_bill)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/bill')


    context={'form':form}
    return render(request,'update_bill.html',context)

def update_blood(request,pk):
    curr_blood=BloodBankmodel.objects.get(Serial_No=pk)
    name=curr_blood.Blood_Group
    form =BloodBankForm(initial={'Serial_No':curr_blood.Serial_No,'Date_issued':curr_blood.Date_issued,'Blood_Group':curr_blood.Blood_Group,'Pints_donated':curr_blood.Pints_donated})
    if request.method == 'POST':
        form =BloodBankForm(request.POST,instance=curr_blood)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/blood')


    context={'form':form}
    return render(request,'update_blood.html',context)

def update_diagnosis(request,pk):
    curr_rec=Diagnosismodel.objects.get(Diagnosis_ID=pk)
    name=curr_rec.Diagnosis_ID
    form =DiagnosisForm(initial={'Diagnosis_ID':name,'Date':curr_rec.Date,'Diagnosis_details':curr_rec.Diagnosis_details,'Remarks':curr_rec.Remarks,'Prescription':curr_rec.Prescription,'Insurance_Policy_No':curr_rec.Insurance_Policy_No,'Patient_Id':curr_rec.Patient_Id})
    if request.method == 'POST':
        form =DiagnosisForm(request.POST,instance=curr_rec)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/diagnosis')


    context={'form':form}
    return render(request,'update_diagnosis.html',context)

def update_visitor(request,pk):
    curr_rec=Visitormodel.objects.get(Visitor_Id=pk)
    name=curr_rec.Visitor_Id
    form =VisitorForm(initial={'Visitor_Id':name,'Visitor_Name':curr_rec.Visitor_Name,'Patient_Id':curr_rec.Patient_Name,'Time':curr_rec.Time,'Room_No':curr_rec.Room_No})
    if request.method == 'POST':
        form =VisitorForm(request.POST,instance=curr_rec)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/visitor')


    context={'form':form}
    return render(request,'update_visitor.html',context)

def update_emergency(request,pk):
    curr_rec=Emergencymodel.objects.get(Patient_Id=pk)
    name=curr_rec.Patient_Id
    form =EmergencyForm(initial={'Patient_Id':name,'Patient_Name':curr_rec.Patient_Name,'Room_No':curr_rec.Room_No,'Contact_Number':curr_rec.Contact_Number})
    if request.method == 'POST':
        form =EmergencyForm(request.POST,instance=curr_rec)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/emergency')


    context={'form':form}
    return render(request,'update_emergency.html',context)

def delete_patient(request,pk):
    curr_patient=Patientmodel.objects.get(Patient_Id=pk)
    name=curr_patient.Patient_Name
    if request.method=="POST":
        curr_patient.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/patient')
    context = {'item': curr_patient}
    return render(request, 'delete.html', context)


def delete_doctor(request,pk):
    curr_doctor=Doctormodel.objects.get(Doctor_Id=pk)
    name=curr_doctor.Doctor_Name
    if request.method=="POST":
        curr_doctor.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/doctor')
    context = {'item': curr_doctor}
    return render(request, 'delete_doctor.html', context)

def delete_nurse(request,pk):
    curr_nurse=Nursemodel.objects.get(Nurse_Id=pk)
    name=curr_nurse.Nurse_Name
    if request.method=="POST":
        curr_nurse.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/nurse')
    context = {'item': curr_nurse}
    return render(request, 'delete_nurse.html', context)

def delete_appointment(request,pk):
    curr_app=Appointmentmodel.objects.get(Patient_Id=pk)
    name=curr_app.Patient_Name
    if request.method=="POST":
        curr_app.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/appointment')
    context = {'item': curr_app}
    return render(request, 'delete_appointment.html', context)

def delete_room(request,pk):
    curr_room=Roommodel.objects.get(Room_No=pk)
    name=curr_room.Room_No
    if request.method=="POST":
        curr_room.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/room')
    context = {'item': curr_room}
    return render(request, 'delete_room.html', context)

def delete_bill(request,pk):
    curr_bill=Billingmodel.objects.get(Bill_No=pk)
    name=curr_bill.Bill_No
    if request.method=="POST":
        curr_bill.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/bill')
    context = {'item': curr_bill}
    return render(request, 'delete_bill.html', context)

def delete_blood(request,pk):
    curr_blood=BloodBankmodel.objects.get(Serial_No=pk)
    name=curr_blood.Serial_No
    if request.method=="POST":
        curr_blood.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/blood')
    context = {'item': curr_blood}
    return render(request, 'delete_blood.html', context)


def delete_diagnosis(request,pk):
    curr_rec=Diagnosismodel.objects.get(Diagnosis_ID=pk)
    name=curr_rec.Diagnosis_ID
    if request.method=="POST":
        curr_rec.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/diagnosis')
    context = {'item': curr_rec}
    return render(request, 'delete_diagnosis.html', context)

def delete_visitor(request,pk):
    curr_rec=Visitormodel.objects.get(Visitor_Id=pk)
    name=curr_rec.Visitor_Id
    if request.method=="POST":
        curr_rec.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/visitor')
    context = {'item': curr_rec}
    return render(request, 'delete_visitor.html', context)

def delete_emergency(request,pk):
    curr_rec=Emergencymodel.objects.get(Patient_Id=pk)
    name=curr_rec.Room_No
    if request.method=="POST":
        curr_rec.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/emergency')
    context = {'item': curr_rec}
    return render(request, 'delete_emergency.html', context)

def showprocedure1(request):
    cursor=connection.cursor()
    cursor.execute("call diagnosis_patient()")
    results=cursor.fetchall()
    return render(request,'diagnosis_patient.html',{'diagnosis_patientmodel':results})

def showprocedure2(request):
    cursor=connection.cursor()
    cursor.execute("call final_amount()")
    results=cursor.fetchall()
    return render(request,'final_amount.html',{'final_amount':results})

@route('/nurse_doctor')
def showprocedure3(request):
  if request.method=='POST':
     if request.POST.get('Patient_Id'):
        saverecord=nurse_doctor()
        saverecord.Patient_Id=request.POST.get('Patient_Id')
        args=[request.POST.get('Patient_Id')]
        cursor=connection.cursor()
        cursor.callproc("nurse_doctor",args)
        results=cursor.fetchall()
        return render(request,'nurse_doctor.html',{'nurse_doctor':results})
  else:
       return render (request,'nurse_doctor.html')

@route('/patient_doctor')
def showprocedure4(request):
  if request.method=='POST':
     if request.POST.get('Doctor_Id'):
        saverecord=patient_doctor()
        saverecord.Patient_Id=request.POST.get('Doctor_Id')
        args=[request.POST.get('Doctor_Id')]
        cursor=connection.cursor()
        cursor.callproc("patient_doctor",args)
        results=cursor.fetchall()
        return render(request,'patient_doctor.html',{'patient_doctor':results})
  else:
        return render (request,'patient_doctor.html')

@route('/Blood_Group')
def showprocedure5(request):
  if request.method=='POST':
     if request.POST.get('Blood_Group'):
        saverecord=Blood_Group()
        saverecord.Blood_Group=request.POST.get('Blood_Group')
        args=[request.POST.get('Blood_Group')]
        cursor=connection.cursor()
        cursor.callproc("Blood_Group",args)
        results=cursor.fetchall()
        return render(request,'Blood_Group.html',{'Blood_Group':results})
  else:
       return render (request,'Blood_Group.html')

@route('/room_filter')
def showprocedure6(request):
  if request.method=='POST':
     if request.POST.get('Room_type'):
        saverecord=room_filter()
        saverecord.Room_type=request.POST.get('Room_type')
        saverecord.Availability_status=request.POST.get('Availability_status')
        args=[request.POST.get('Room_type'),request.POST.get('Availability_status')]
        cursor=connection.cursor()
        cursor.callproc("room_filter",args)
        results=cursor.fetchall()
        return render(request,'room_filter.html',{'room_filter':results})
  else:
       return render (request,'room_filter.html')

@route('/summation')
def showfunction(request):
  if request.method=='POST':
     if request.POST.get('Patient_Id'):
        saverecord=summation()
        saverecord.Patient_Id=request.POST.get('Patient_Id')
        args=[request.POST.get('Patient_Id')]
        cursor=connection.cursor()
        cursor.callproc('summation',args)
        results=cursor.fetchall()
        return render(request,'summation.html',{'summation':results})
  else:
      return render (request,'summation.html')

@route('/beds_in_room')
def showfunction2(request):
  if request.method=='POST':
     if request.POST.get('Room_No'):
        saverecord=beds_in_room()
        saverecord.Room_No=request.POST.get('Room_No')
        args=[request.POST.get('Room_No')]
        cursor=connection.cursor()
        cursor.callproc('beds_in_room',args)
        results=cursor.fetchall()
        return render(request,'beds_in_room.html',{'beds_in_room':results})
  else:
      return render (request,'beds_in_room.html')

@route('/no_of_appointments')
def showfunction3(request):
  if request.method=='POST':
     if request.POST.get('appointments'):
        saverecord=no_of_appointments()
        saverecord.Room_No=request.POST.get('appointments')
        args=[request.POST.get('appointments')]
        cursor=connection.cursor()
        cursor.callproc('no_of_appointments',args)
        results=cursor.fetchall()
        return render(request,'no_of_appointments.html',{'no_of_appointments':results})
  else:
      return render (request,'no_of_appointments.html')


@route('/blood_group_func')
def showfunction4(request):
  if request.method=='POST':
     if request.POST.get('Blood_Group'):
        saverecord=blood_group_func()
        saverecord.Blood_Group=request.POST.get('Blood_Group')
        args=[request.POST.get('Blood_Group')]
        cursor=connection.cursor()
        cursor.callproc("blood_group_func",args)
        results=cursor.fetchall()
        return render(request,'blood_group_func.html',{'blood_group_func':results})
  else:
       return render (request,'blood_group_func.html')
