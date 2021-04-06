from myapp.serialization import SerializationclassPatient,SerializationclassDoctor,SerializationclassNurse, SerializationclassAppointment, SerializationclassRoom
from myapp.models import Patientmodel
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import render, redirect
import requests
from .forms import PatientForm, DoctorForm, NurseForm, AppointmentForm, RoomForm
from .models import Patientmodel, Doctormodel, Nursemodel, Appointmentmodel, Roommodel
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django.contrib import messages


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

def create_patient(request):
    inst=Patientmodel()
    form=PatientForm(instance=inst)
    if request.method=='POST':
        form=PatientForm(request.POST,instance=inst)
        if form.is_valid():
            form.save()
            messages.info(request,"New patient created successfully!!")
            return redirect('/patient')

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

def update_patient(request,pk):
    curr_patient=Patientmodel.objects.get(Patient_Id=pk)
    name=curr_patient.Patient_Name
    form =PatientForm(initial={'Patient_Id':curr_patient.Patient_Id,'Patient_Name':name,'Patient Contact No':curr_patient.Patient_Contact_No})
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
    form =DoctorForm(initial={'Doctor Id':curr_doctor.Doctor_Id,'Doctor Name':name,'Contact No.':curr_doctor.Contact_No})
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
    form =NurseForm(initial={'Nurse Id':curr_nurse.Nurse_Id,'Nurse Name':name,'Contact No.':curr_nurse.Phone_Number})
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
    form =AppointmentForm(initial={'Patient Id':curr_app.Patient_Id,'Patient Name':name,'Contact No.':curr_app.Patient_Contact_No})
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
    form =RoomForm(initial={'Room No':curr_room.Room_No,'Room type':name,'Number of beds':curr_room.Number_of_bed})
    if request.method == 'POST':
        form =RoomForm(request.POST,instance=curr_room)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/room')


    context={'form':form}
    return render(request,'update_room.html',context)

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
