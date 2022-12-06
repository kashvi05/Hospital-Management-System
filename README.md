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

![image]()

