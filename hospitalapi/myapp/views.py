from myapp.serialization import Serializationclass
from myapp.models import Patientmodel
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import render, redirect
import requests
from .forms import PatientForm
from .models import Patientmodel
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django.contrib import messages


@api_view(['GET'])
def showPatient(request):
    if request.method=='GET':
        results=Patientmodel.objects.all()
        serialize=Serializationclass(results,many=True)
        return Response(serialize.data)

def displayHome(request):
    return render(request,'index.html')


def displaydata(request):
    callapi=requests.get('http://127.0.0.1:8000/show')
    results=callapi.json()
    return render(request,'Patient.html',{'Patientmodel':results})

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

def update_patient(request,pk):
    curr_patient=Patientmodel.objects.get(patId=pk)
    name=curr_patient.patName
    form =PatientForm(initial={'patId':curr_patient.patId,'patName':name,'phone':curr_patient.phone})
    if request.method == 'POST':
        form = PatientForm(request.POST,instance=curr_patient)
        if form.is_valid():
            form.save()
            messages.error(request, f"{name} updated successfully!!")
            return redirect('/patient')

    context={'form':form}
    return render(request,'update_patient.html',context)

def delete_patient(request,pk):
    curr_patient=Patientmodel.objects.get(patId=pk)
    name=curr_patient.patName
    if request.method=="POST":
        curr_patient.delete()
        messages.error(request, f"{name} deleted successfully!!")
        return redirect('/patient')
    context = {'item': curr_patient}
    return render(request, 'delete.html', context)
