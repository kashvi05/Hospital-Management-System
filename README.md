# Hospital-Management-System
1.	Open https://github.com/kashvi05/Hospital-Management-System.git
2.	Fork the repository
3.	Open terminal/git bash in your system.
4.	Clone the repository locally.
5.	Open the cloned repository in any IDE.
6.	Open Hospital-Management-System\hospitalapi\hospitalapi\settings.py
7.	In settings.py file, make the following changes in DATABASES:
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'hospital_management_system',
        'USER': 'root',
        'PASSWORD':'<root-password>'
        'HOST':'localhost',
        'PORT':'3306',
        'OPTIONS':{
            'init_command':"SET sql_mode='STRICT_TRANS_TABLES'"
        }
8.	Open MYSQL
9.	Run ‘Hospital.sql’ in MYSQL database.
10.	Open terminal
11.	cd Hospital-Management-System
12.	run python manage.py migrate
13.	run python manage.py makemigrations
14.	run python manage.py runserver















ENTITY – RELATIONSHIP DIAGRAM





  

  

  

  









TABLE DESIGN (DATA DICTIONARY)
(All the tables are in 3NF)  


1.           Patient_Table 





Appointment_Table 
















Billing 



Blood_Bank_Records



Nurse_Table 










Patient_Diagnosis



7.	Emergency_Room_Log



Room_Table 



Doctor_Table 






Visitor’s_Table





TABLES AND SAMPLE DATA ENTRY 

1.          Appointment_Table













Billing





Blood_Bank_Records 








Doctor_Table 






5.	Emergency_Room_Log










6.	Nurse_Table






7.	Patient_Diagnosis






8.	Patient Table





(The table being too long is blurry, thus we have added 2 more images for the same in two halves.)




(First half)



(Second half)

Room_Table





Visitor’s_Table







VALIDATIONS AND INTEGRITY CONSTRAINTS







CRUD OPERATIONS AND TABLES ON FRONTEND






 


          



            


   

   


         



 


         




