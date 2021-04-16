create database hospital;
use hospital;
#drop database hospital;
CREATE TABLE `Patient_Table` (
	`Patient_Id` INT NOT NULL AUTO_INCREMENT,
	`Patient_Name` varchar(255) NOT NULL,
	`Gender` varchar(1) NOT NULL,
	`Age` INT NOT NULL,
	`Blood_Group` varchar(3) NOT NULL,
	`Address` varchar(255) NOT NULL,
	`Patient_Contact_No` INT NOT NULL,
	`Residence_No` INT NOT NULL,
	`Email_ID` varchar(255) NOT NULL,
	`Emergency_Number` INT NOT NULL,
	`Emergency_Contact_Name` varchar(300) NOT NULL,
	`Purpose` varchar(300) NOT NULL,
	`Emergency_Patient` BOOLEAN NOT NULL,
	PRIMARY KEY (`Patient_Id`,`Patient_Name`,`Patient_Contact_No`)
);

CREATE TABLE `Doctor_Table` (
	`Doctor_Id` INT NOT NULL AUTO_INCREMENT,
	`Doctor_Name` varchar(255) NOT NULL,
	`Age` INT NOT NULL,
	`Speciality` varchar(255) NOT NULL,
	`Email_id` varchar(255) NOT NULL,
	`Contact_No` INT NOT NULL,
	`Office_Room_No` INT NOT NULL,
	`Salary` FLOAT NOT NULL,
	`Patient_Id` INT NOT NULL,
	PRIMARY KEY (`Doctor_Id`,`Doctor_Name`)
);

CREATE TABLE `Nurse_Table` (
	`Nurse_Id` INT NOT NULL,
	`Nurse_Name` varchar(300) NOT NULL,
	`Gender` varchar(1) NOT NULL,
	`Age` INT NOT NULL,
	`Phone_Number` INT NOT NULL,
	`Joining_Date` date NOT NULL,
	`Shift_Days` varchar(300) NOT NULL,
	`Shift_timing` TIMESTAMP NOT NULL,
	`Position` varchar(300) NOT NULL,
	`Salary` FLOAT NOT NULL,
	`Patient_Id` INT NOT NULL,
	PRIMARY KEY (`Nurse_Id`)
);

CREATE TABLE `Room_Table` (
	`Room_No` INT NOT NULL AUTO_INCREMENT,
	`Room_type` varchar(100) NOT NULL,
	`Number_of_bed` INT NOT NULL,
	`Availibility_Status` BOOLEAN NOT NULL,
	PRIMARY KEY (`Room_No`)
);

CREATE TABLE `Appointment_Table` (
	`Patient_Id` INT NOT NULL UNIQUE,
	`Patient_Name` varchar(255) NOT NULL,
	`Appointment_Date` date NOT NULL,
	`Time` TIMESTAMP NOT NULL,
	`Purpose` varchar(300) NOT NULL,
	`Patient_Contact_No` INT NOT NULL,
	`Doctor_Id` INT NOT NULL UNIQUE,
	`Doctor_Name` varchar(255) NOT NULL,
	`Room_No` INT NOT NULL
);

CREATE TABLE `Billing` (
	`Bill_No` INT NOT NULL AUTO_INCREMENT,
	`Bill_Date` date NOT NULL,
	`Patient_Id` INT NOT NULL,
	`Patient_Name` varchar(255) NOT NULL,
	`Doctor_Id` INT NOT NULL,
	`Doctor's_fees` FLOAT NOT NULL,
	`Room_Charges` FLOAT,
	`Tests_Charges` FLOAT,
	`Tax` FLOAT NOT NULL,
	`Total_Amount` FLOAT NOT NULL,
	PRIMARY KEY (`Bill_No`)
);

CREATE TABLE `Blood_Bank_Records` (
	`Date_issued` date NOT NULL,
	`Blood_Group` varchar(3) NOT NULL,
	`Pints_available` INT NOT NULL,
	PRIMARY KEY (`Blood_Group`)
);

CREATE TABLE `Patient_Diagnosis` (
	`Diagnosis_ID` INT NOT NULL AUTO_INCREMENT,
	`Date` date NOT NULL,
	`Diagnosis_details` varchar(300) NOT NULL,
	`Remarks` varchar(100) NOT NULL,
	`Prescription` varchar(200) NOT NULL,
	`Insurance_Policy_No` varchar(50) NOT NULL,
	`Patient_Id` INT NOT NULL,
	PRIMARY KEY (`Diagnosis_ID`)
);

CREATE TABLE `Visitor's_Table` (
	`Visitor's_Id` INT NOT NULL,
	`Visitor's_Name` VARCHAR(255) NOT NULL,
	`Patient_Id` INT NOT NULL,
	`Patient_Name` varchar(255) NOT NULL,
	`Time` TIMESTAMP NOT NULL,
	`Room_No` INT NOT NULL,
	PRIMARY KEY (`Visitor's_Id`)
);

CREATE TABLE `Emergency_Room_Log` (
	`Patient_Name` varchar(255) NOT NULL,
	`Room_No` INT NOT NULL,
	`Contact_Number` INT NOT NULL
);

ALTER TABLE `Doctor_Table` ADD CONSTRAINT `Doctor_Table_fk0` FOREIGN KEY (`Patient_Id`) REFERENCES `Patient_Table`(`Patient_Id`);

ALTER TABLE `Nurse_Table` ADD CONSTRAINT `Nurse_Table_fk0` FOREIGN KEY (`Patient_Id`) REFERENCES `Patient_Table`(`Patient_Id`);

ALTER TABLE `Appointment_Table` ADD CONSTRAINT `Appointment_Table_fk2` FOREIGN KEY (`Patient_Id`,`Patient_Name`,`Patient_Contact_No`) REFERENCES `Patient_Table`(`Patient_Id`,`Patient_Name`,`Patient_Contact_No`);

ALTER TABLE `Appointment_Table` ADD CONSTRAINT `Appointment_Table_fk4` FOREIGN KEY (`Doctor_Id`,`Doctor_Name`) REFERENCES `Doctor_Table`(`Doctor_Id`,`Doctor_Name`);

ALTER TABLE `Appointment_Table` ADD CONSTRAINT `Appointment_Table_fk5` FOREIGN KEY (`Room_No`) REFERENCES `Room_Table`(`Room_No`);

ALTER TABLE `Billing` ADD CONSTRAINT `Billing_fk1` FOREIGN KEY (`Patient_Id`,`Patient_Name`) REFERENCES `Patient_Table`(`Patient_Id`,`Patient_Name`);

ALTER TABLE `Billing` ADD CONSTRAINT `Billing_fk2` FOREIGN KEY (`Doctor_Id`) REFERENCES `Doctor_Table`(`Doctor_Id`);

ALTER TABLE `Patient_Diagnosis` ADD CONSTRAINT `Patient_Diagnosis_fk0` FOREIGN KEY (`Patient_Id`) REFERENCES `Patient_Table`(`Patient_Id`);

ALTER TABLE `Visitor's_Table` ADD CONSTRAINT `Visitor's_Table_fk0` FOREIGN KEY (`Patient_Id`,`Patient_Name`) REFERENCES `Patient_Table`(`Patient_Id`,`Patient_Name`);

ALTER TABLE `Visitor's_Table` ADD CONSTRAINT `Visitor's_Table_fk2` FOREIGN KEY (`Room_No`) REFERENCES `Room_Table`(`Room_No`);

ALTER TABLE `Emergency_Room_Log` ADD CONSTRAINT `Emergency_Room_Log_fk0` FOREIGN KEY (`Room_No`) REFERENCES `Room_Table`(`Room_No`);
