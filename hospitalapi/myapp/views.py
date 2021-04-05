from myapp.serialization import SerializationclassPatient,SerializationclassDoctor,SerializationclassNurse
from myapp.models import Patientmodel
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import render, redirect
import requests
from .forms import PatientForm, DoctorForm, NurseForm
from .models import Patientmodel, Doctormodel, Nursemodel
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
