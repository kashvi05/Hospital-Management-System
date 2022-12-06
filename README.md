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

Entity Relationship Model

![image](https://user-images.githubusercontent.com/71372587/205970464-2cb2bccd-ac8c-48b3-ac5c-aad19d256719.png)

Glimpse of Tables:

1. Patient Table

![image](https://user-images.githubusercontent.com/71372587/205971369-7baa8753-b3a8-40d1-bc32-af2dbfad0fa3.png)

2. Appointment Table

![image](https://user-images.githubusercontent.com/71372587/205971443-5af6e878-33ca-4b8d-9f84-e33f58add210.png)

Adding Integrity Constraints:

![image](https://user-images.githubusercontent.com/71372587/205971674-5a7d4860-d993-4a78-bb73-5dd4916b2dfd.png)

CRUD Operations: 

![image](https://user-images.githubusercontent.com/71372587/205971692-6b35d2bf-c4e8-4281-a2d8-fea3efb63108.png)
![image](https://user-images.githubusercontent.com/71372587/205971726-802eeb23-6f97-4ba1-b54c-29f846c9d5f0.png)
![image](https://user-images.githubusercontent.com/71372587/205971753-aa276344-6954-4bde-acdb-5964d635a9f1.png)
![image](https://user-images.githubusercontent.com/71372587/205971781-c5543c1e-81e3-430a-86c7-fb6ad5dca95f.png)
![image](https://user-images.githubusercontent.com/71372587/205971820-11a055a9-2c88-4717-b7e3-e2b134d3bc1b.png)

Stored Procedures: 

![image](https://user-images.githubusercontent.com/71372587/205972590-ef5448a8-e72e-481d-bba2-ed502200bec2.png)

Stored Functions: 

![image](https://user-images.githubusercontent.com/71372587/205972788-bb07e037-27fa-4e53-a0e7-4f2460801eeb.png)
![image](https://user-images.githubusercontent.com/71372587/205972810-65e70842-c1b3-435b-9d2a-d30dd084e5c9.png)




