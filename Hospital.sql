use hospital_management_system;

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
	`Patient_Contact_No` varchar(10) NOT NULL,
	`Residence_No` varchar(8) NOT NULL,
	`Email_Id` varchar(255) NOT NULL,
	`Emergency_Number` varchar(10) NOT NULL,
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
	`Email_Id` varchar(255) NOT NULL,
	`Contact_No` varchar(10) NOT NULL,
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
	`Phone_Number` varchar(10) NOT NULL,
	`Joining_Date` date NOT NULL,
	`Shift_Days` varchar(300) NOT NULL,
	`Shift_timing` varchar(300) NOT NULL,
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
	`Time` varchar(300) NOT NULL,
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
	`Doctors_fees` FLOAT NOT NULL,
	`Room_Charges` FLOAT,
	`Tests_Charges` FLOAT,
	`Tax` FLOAT NOT NULL,
	`Total_Amount` FLOAT NOT NULL,
	PRIMARY KEY (`Bill_No`)
);

CREATE TABLE `Blood_Bank_Records` (
	`Serial_No` INT PRIMARY KEY,
	`Date_issued` date NOT NULL,
	`Blood_Group` varchar(3) NOT NULL,
	`Pints_donated` INT NOT NULL
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

CREATE TABLE `Visitors_Table` (
	`Visitor_Id` INT NOT NULL,
	`Visitor_Name` VARCHAR(255) NOT NULL,
	`Patient_Id` INT NOT NULL,
	`Patient_Name` varchar(255) NOT NULL,
	`Time` TIMESTAMP NOT NULL,
	`Room_No` INT NOT NULL,
	PRIMARY KEY (`Visitor_Id`)
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

ALTER TABLE `Visitors_Table` ADD CONSTRAINT `Visitor's_Table_fk0` FOREIGN KEY (`Patient_Id`,`Patient_Name`) REFERENCES `Patient_Table`(`Patient_Id`,`Patient_Name`);

ALTER TABLE `visitors_table` ADD CONSTRAINT `Visitor's_Table_fk2` FOREIGN KEY (`Room_No`) REFERENCES `Room_Table`(`Room_No`);

ALTER TABLE `Emergency_Room_Log` ADD CONSTRAINT `Emergency_Room_Log_fk0` FOREIGN KEY (`Room_No`) REFERENCES `Room_Table`(`Room_No`);


-- Patient Table
INSERT INTO `patient_table` VALUES ('1', 'Kairavi Shah', 'F', '19', 'O+', '2079  Kenwood Place, Ahmedabad-55', '8060811219', '64636247', 'ksaaa@gmail.com', '2091029728', 'Sanya Zaveri', 'Headache', '1');
INSERT INTO `patient_table` VALUES('2', 'Khushi Shah', 'F', '20', 'O+', '3423  Parrish Avenue, Ahmedabad-03', '1477985098', '95363904', 'ksaaas@gmail.com', '1477985098', 'Khushi Shah', 'Fever', '1');
INSERT INTO `patient_table` VALUES('3', 'Kashvi Gandhi', 'F', '18', 'A+', '3582  Olive Street, Ahmedabad-09', '1332423739', '24074051', 'kgaaa@gmail.com', '1332423739', 'Kashvi Gandhi', 'Cough and Cold', '1');
INSERT INTO `patient_table` VALUES ('4', 'Sanya Zaveri', 'F', '19', 'B+', '2663  Farland Avenue, Ahmedabad-04', '2091029928', '88365299', 'szaaa@gmail.com', '8060811219', 'Kairavi Shah', 'Cavity', '1');
INSERT INTO `patient_table` VALUES('5', 'Mukul Verma', 'M', '30', 'O-', '400  Red Dog Road, Ahmedabad-06', '7379145809', '59688637', 'mvaaa@gmail.com', '2552784588', 'Kajal Patel', 'Cancer', '0');
INSERT INTO `patient_table` VALUES('6', 'Nipun Patel', 'M', '40', 'AB+', '162  Brooklyn Street, Ahmedabad-08', '1322872111', '55289127', 'npaaa@gmail.com', '2091029728', 'Sanya Zaveri', 'Heart Attack', '0');
INSERT INTO `patient_table` VALUES('7', 'Shailin Shetty', 'M', '65', 'AB-', '1142  Cottonwood Lane, Ahmedabad-09', '7030507278', '75008767', 'sanas@gmail.com', '5621286607', 'Sejal Patel', 'Parkinson disease', '0');
INSERT INTO `patient_table` VALUES('8', 'Om Choudhary', 'M', '80', 'B+', '4777  Charack Road, Ahemdabad-10', '6334572601', '86897873', 'oczzz@gmail.com', '3579561566', 'Shilpa Shetty', 'Cirrhosis', '0');
INSERT INTO `patient_table` VALUES('9', 'Rimi Rawat', 'F', '43', 'A+', '2750  Coal Street, Ahmedabad-11', '5065878147', '21881631', 'rrzzza@gmail.com', '8629710112', 'Anit Choudhary', 'Skin Disease', '1');
INSERT INTO `patient_table` VALUES('10', 'Palak Merchant', 'F', '25', 'AB+', '2877  Collins Street, Ahmedabad-12', '5475325576', '43689050', 'pmezzr@gmail.com', '8060811219', 'Kairavi Shah', 'Diebetes', '1');
INSERT INTO `patient_table` VALUES('11', 'Pala Merchant', 'F', '25', 'AB+', '2877  Collins Street, Ahmedabad-13', '5475385576', '13689050', 'piuuez@gmail.com', '5060811219', 'Kaiavi Shah', 'Diebetes', '1');

-- Doctor Table
INSERT INTO `doctor_table` VALUES ('1', 'Dr. Yogesh Shah', '45', 'Cardiologist', 'drys@gmail.com', '3456082966', '101', '50000', '6'),
('2', 'Dr. Krishna Ramakrishnan', '35', 'Dermatologist', 'drkr@gmail.com', '7728413597', '102', '40000', '9'),
('3', 'Dr. Pratibha Morar', '39', 'Physician', 'drpm@gmail.com', '2528165764', '103', '30000', '1'),
('4', 'Dr. Mitra Oza', '30', 'Otolaryngologist', 'drmo@gmail.com', '7524448265', '104', '25000', '3'),
('5', 'Dr. Kamala Prabhakar', '32', 'Endocrinologist', 'drkp@gmail.com', '8801279631', '105', '45000', '10'),
('6', 'Dr. Amit Kapadia', '50', 'Neurologist', 'drak@gmail.com', '3984951631', '106', '55000', '7'),
('7', 'Dr. Akshay Sur', '55', 'Hepatologist', 'dras@gmail.com', '5487170426', '107', '35000', '8'),
('8', 'Dr. Asim Samra', '58', 'Oncologist', 'drasa@gmail.com', '9365126799', '108', '70000', '5'),
('9', 'Dr. Indu Iyengar', '43', 'Dentist', 'drii@gmail.com', '6952013258', '109', '40000', '4'),
('10', 'Dr. Suman Batra', '47', 'Pediatrician', 'drsb@gmail.com', '4791238635', '110', '35000', '2');

insert into doctor_table values('3', 'Dr. Pratibha Morar', '39', 'Physician', 'drpm@gmail.com', '2528165764', '103', '30000', '1');
-- Nurse Table
INSERT INTO `nurse_table` VALUES ('1', 'Kalpana Kari', 'F', '25', '8584631552', '2017/01/05', 'Monday to Saturday', '8am to 8pm', 'Head ', '20000', '10'),
('2', 'Zoya Talwar', 'F', '30', '8990495793', '2007/02/09', 'Monday to Saturday', '8am to 8pm', 'Head', '20000', '9'),
('3', 'Dayita Buch', 'F', '35', '9105613646', '2000/03/15', 'Monday to Wednesday', '8am to 4pm', 'Assistant', '10000', '8'),
('4', 'Charu Thaman', 'F', '45', '7598731617', '1987/04/17', 'Thursday to Saturday', '8am to 4pm', 'Assistant', '10000', '7'),
('5', 'Gauri Chawla', 'F', '50', '7440179296', '1985/05/25', 'Saturday and Sunday', '8am to 4pm', 'Assistant', '10000', '6'),
('6', 'Abhishek Jayaraman', 'M', '37', '7251380380', '1993/06/30', 'Monday to Saturday', '8am to 8pm', 'Head', '20000', '5'),
('7', 'Manu Kibe', 'M', '32', '8859406339', '1998/07/01', 'Monday to Saturday', '8am to 8pm', 'Head', '20000', '4'),
('8', 'Yash Hari', 'M', '26', '9593753690', '2016/08/28', 'Monday to Wednesday', '8am to 4pm', 'Assistant', '10000', '3'),
('9', 'Rajani Kota', 'M', '30', '8125140534', '2007/09/12', 'Thursday to Saturday', '8am to 4pm', 'Assistant', '10000', '2'),
('10', 'Vivaan Pillai', 'M', '39', '9377455395', '1990/10/17', 'Saturday and Sunday', '8am to 4pm', 'Assistant', '10000', '1');
INSERT INTO `nurse_table` VALUES('10', 'Vivaan Pillai', 'M', '39', '9377455395', '1990/10/17', 'Saturday and Sunday', '8am to 4pm', 'Assistant', '10000', '1');

-- Room Table
INSERT INTO `room_table` VALUES ('1001', 'Regular', '4', '0'),
('1002', 'Regular', '4', '1'),
('1003', 'Regular', '4', '1'),
('1004', 'Regular', '4', '1'),
('1005', 'Emergency', '5', '1'),
('1006', 'Emergency', '5', '1'),
('1007', 'Premium', '2', '1'),
('1008', 'Premium', '2', '1'),
('1009', 'ICU', '2', '1'),
('1010', 'ICU', '2', '1');

-- Billing Table
INSERT INTO `billing` VALUES ('1', '2020/11/15', '1', 'Kairavi Shah', '3', '500', '100', '100', '50', '750'),
('2', '2020/09/25', '2', 'Khushi Shah', '10', '500', '200', '100', '50', '850'),
('3', '2020/10/02', '3', 'Kashvi Gandhi', '4', '500', '150', '100', '50', '800'),
('4', '2021/01/21', '4', 'Sanya Zaveri', '9', '500', '100', '100', '50', '750'),
('5', '2020/09/11', '5', 'Mukul Verma', '8', '1000', '200', '100', '50', '1350'),
('6', '2020/12/03', '6', 'Nipun Patel', '1', '1000', '100', '100', '50', '1250'),
('7', '2020/10/27', '7', 'Shailin Shetty', '6', '1000', '100', '100', '50', '1250'),
('8', '2021/02/25', '8', 'Om Choudhary', '7', '1000', '100', '100', '50', '1250'),
('9', '2021/02/05', '9', 'Rimi Rawat', '2', '1000', '100', '100', '50', '1250'),
('10', '2020/04/25', '10', 'Palak Merchant', '5', '700', '100', '100', '50', '950');
INSERT INTO `billing` VALUES ('1', '2020/11/15', '1', 'Kairavi Shah', '3', '500', '100', '100', '50', '750');

-- Blood_Bank_Records
INSERT INTO `blood_bank_records` VALUES ('1','2020/01/16', 'O+', '10'),
('2','2021/01/16', 'O-', '15'),
('3','2020/02/15', 'A+', '10'),
('4','2021/02/27', 'A-', '15'),
('5','2020/12/13', 'B+', '9'),
('6','2020/11/06', 'B-', '8'),
('7','2021/03/16', 'AB+', '10'),
('8','2021/01/26', 'AB-', '8'),
('9','2021/01/26', 'AB-', '10');

-- Patient_Diagnosis Table
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('1', '2020/11/15', 'Minor Stress', 'Follow up in 2 days.', 'Pills', '37896225245', '1');
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('2', '2020/09/25', 'Viral infection', 'Follow up after 3 days if required.', 'Pills, Syrup', '10719126609', '2');
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('3', '2020/10/02', 'Regular flu', 'Follow up after 3 days if required.', 'Syrup', '45729323421', '3');
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('4', '2021/01/21', 'Cavity in polar teeth - 2', 'No follow up required unless severe pain even after a week.', 'Cold and liquid foods', '31587070449', '4');
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('5', '2020/09/11', 'Lung Cancer', 'Admitted, every week chemo treatment.', 'Pills', '66147145799', '5');
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('6', '2020/12/03', 'Heart attacks(minor)', 'Admitted', 'Pills', '15824299699', '6');
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('7', '2020/10/27', 'Restless sleep and nightmares', 'Every week check-up', 'Pills', '73725567459', '7');
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('8', '2021/02/25', 'Fatigue and weight loss', 'Every week check-up', 'Pills', '50382965256', '8');
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('9', '2021/02/05', 'Acnes on face and back', 'Follow up after every month.', 'Pills', '83801787597', '9');
INSERT INTO `patient_diagnosis` (`Diagnosis_ID`, `Date`, `Diagnosis_details`, `Remarks`, `Prescription`, `Insurance_Policy_No`, `Patient_Id`) VALUES ('10', '2020/04/25', 'High Diebetes', 'Follow up after 3 months after getiing lab reports.', 'Pills', '21272387606', '10');



-- Visitors_Table
INSERT INTO `visitors_table` VALUES ('1', 'Aditi Shah', '1', 'Kairavi Shah', '1:00pm to 2:00pm', '1001'),
('2', 'Bijoy Shah', '2', 'Khushi Shah', '1:30pm to 2:00pm', '1008'),
('3', 'Parminder Gandhi', '3', 'Kashvi Gandhi', '2:00pm to 3:00pm', '1003'),
('4', 'Pravin Zaveri', '4', 'Sanya Zaveri', '3:00pm to 4:00pm', '1009'),
('5', 'Bhola Rau', '5', 'Mukul Verma', '1:00pm to 2:00pm', '1009'),
('6', 'Kirti Chokshi', '6', 'Nipun Patel', '2:00pm to 3:00pm', '1010'),
('7', 'Laveena Dalal', '7', 'Shailin Shetty', '1:00pm to 2:00pm', '1005'),
('8', 'Aishwarya Tella ', '8', 'Om Choudhary', '1:00pm to 2:00pm', '1005'),
('9', 'Monin Subramanian ', '9', 'Rimi Rawat', '2:00pm to 2:30pm', '1002'),
('10', 'Dhiraj Oommen ', '10', 'Palak Merchant', '1:00pm to 2:00pm', '1004');
select * from `visitor's_table`; 
INSERT INTO `visitors_table` VALUES ('1', 'Aditi Shah', '1', 'Kairavi Shah', '1:00pm to 2:00pm', '1001');

-- Emergency Room Log
INSERT INTO `emergency_room_log` VALUES ('Mukul Verma', 1005, '7379145809'),
('Nipun Patel', 1005, '1322872111'),
('Shailin Shetty', 1005, '7030507278'),
('Om Choudhary', 1005, '6334572601');


-- Appointment Table
INSERT INTO `appointment_table` VALUES ('1', 'Kairavi Shah', '2020/11/15', '10:15 am', 'Headache', '8060811219', '3', 'Dr. Pratibha Morar', '1001');
INSERT INTO `appointment_table` VALUES ('2', 'Khushi Shah', '2020/11/15', '05:15 pm', 'Fever', '1477985098', '10', 'Dr. Suman Batra', '1001');
INSERT INTO `appointment_table` VALUES ('3', 'Kashvi Gandhi', '2020/10/02', '11:00 am', 'Cough and Cold', '1332423739', '4', 'Dr. Mitra Oza', '1001');
INSERT INTO `appointment_table` VALUES ('4', 'Sanya Zaveri', '2021/01/21', '03:15 pm', 'Cavity', '2091029928', '9', 'Dr. Indu Iyengar', '1001');
INSERT INTO `appointment_table` VALUES ('5', 'Mukul Verma', '2020/09/11', '1:00 pm', 'Cancer', '7379145809', '8', 'Dr. Asim Samra', '1005');
INSERT INTO `appointment_table` VALUES ('6', 'Nipun Patel', '2020/12/03', '04:35 pm', 'Heart Attack', '1322872111', '1', 'Dr. Yogesh Shah', '1005');
INSERT INTO `appointment_table` VALUES ('7', 'Shailin Shetty', '2020/10/27', '02:45 pm', 'Parkinson disease', '7030507278', '6', 'Dr. Amit Kapadia', '1005');
INSERT INTO `appointment_table` VALUES ('8', 'Om Choudhary', '2021/02/25', '11:35 am', 'Cirrhosis', '6334572601', '7', 'Dr. Akshay Sur', '1005');
INSERT INTO `appointment_table` VALUES ('9', 'Rimi Rawat', '2021/02/05', '12:15 pm', 'Skin Disease', '5065878147', '2', 'Dr. Krishna Ramakrishnan', '1001');
INSERT INTO `appointment_table` VALUES ('10', 'Palak Merchant', '2020/04/25', '10:00 am', 'Diabetes', '5475325576', '5', 'Dr. Kamala Prabhakar', '1001');



-- Validations

-- Patient
ALTER TABLE patient_table ADD CONSTRAINT email_check_constraint  CHECK(Email_Id LIKE '%___@___%');
ALTER TABLE patient_table ADD CONSTRAINT CK_ValidGender CHECK (Gender in ('M', 'F', 'O','m','f'));
ALTER TABLE patient_table ADD CONSTRAINT blood_grp_check CHECK(Blood_Group LIKE '(A|B|AB|O)[+-]');
ALTER TABLE patient_table ADD CONSTRAINT chk_contact_number CHECK (Patient_Contact_No regexp '^[0-9]{10}$');
ALTER TABLE patient_table ADD CONSTRAINT chk_residency_number CHECK (Residence_No regexp '^[0-9]{8}$');
ALTER TABLE patient_table ADD CONSTRAINT chk_emergency_number CHECK (Emergency_Number regexp '^[0-9]{10}$');
ALTER TABLE patient_table ADD CONSTRAINT cc_ValidAgeCHECK CHECK(Age > 5 AND Age < 120);


-- Doctor
ALTER TABLE doctor_table ADD CONSTRAINT Age_CHECK CHECK(Age > 18 AND Age < 65);
ALTER TABLE doctor_table ADD CONSTRAINT email_check_constraint_1  CHECK(Email_Id LIKE '%___@___%');
ALTER TABLE doctor_table ADD CONSTRAINT chk_contact_number_1 CHECK (Contact_No regexp '^[0-9]{10}$');


-- Nurse
ALTER TABLE nurse_table ADD CONSTRAINT CK_ValidGender_1 CHECK (Gender in ('M', 'F', 'O','m','f'));
ALTER TABLE nurse_table ADD CONSTRAINT Age_CHECK_1 CHECK(Age > 18 AND Age < 65);
ALTER TABLE nurse_table ADD CONSTRAINT chk_contact_number_2 CHECK (Phone_Number regexp '^[0-9]{10}$');

-- Appointment
ALTER TABLE appointment_table ADD CONSTRAINT chk_contact_number_3 CHECK (Patient_Contact_No regexp '^[0-9]{10}$');

-- Emergency Room Logs
ALTER TABLE emergency_room_log ADD CONSTRAINT chk_contact_number_4 CHECK (Contact_Number regexp '^[0-9]{10}$');


-- Procedures

USE `hospital_management_system`;
DROP procedure IF EXISTS `diagnosis_patient`;
-- 1 
DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `diagnosis_patient`()
begin 
	
select p.Patient_Id, p.Patient_Name,d.diagnosis_details, p.Purpose, d.Remarks, d.Prescription from Patient_Table p left join Patient_Diagnosis d on p.Patient_Id=d.Patient_Id;
 end$$

DELIMITER ;
-- 2
USE `hospital_management_system`;
DROP procedure IF EXISTS `final_amount`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `final_amount`()
BEGIN
declare cnt int default 0;
	declare f_id int default 0;
	declare f_name varchar(255);
	declare f_purpose varchar(300);
	declare f_contact varchar(10);
    declare f_Amount float;
	declare f_cursor cursor for select Patient_Id, Patient_Name, Purpose, Patient_Contact_No from Patient_Table;
    declare c_cursor cursor for select Total_Amount from billing left join patient_table on billing.Patient_Id=patient_table.Patient_Id ;
    
	
	declare continue handler for not found set cnt = 1;
    CREATE TEMPORARY TABLE log
  (
    Patient_name varchar(300) ,
    Patient_id int,
    Purpose varchar(300),
    Contact_No varchar(10),
    Total_Amount float
);
	open c_cursor;
	open f_cursor;
	f:loop
		fetch f_cursor into f_id,f_name,f_purpose,f_contact;
		fetch c_cursor into f_Amount;
			if cnt = 1 then
				leave f;
			end if;
		-- select f_name as "Patient_Name";
		-- select f_id as "Patient_Id";
		-- select f_purpose as "Purpose";
		-- select f_contact as "Contact_No";
		-- select Total_Amount from Billing where f_id=Patient_Id;
		insert into log values(f_name,f_id,f_purpose,f_contact,f_Amount);
         
	end loop;
	close f_cursor;
    close c_cursor;
    SELECT * FROM log;
  DROP TABLE log;
END$$

DELIMITER ;
-- 3
USE `hospital_management_system`;
DROP procedure IF EXISTS `nurse_doctor`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nurse_doctor`(p_id int)
begin
    declare p_name varchar(300);
    declare n_id int;
    declare n_name varchar(300);
    declare n_pos varchar(300);
    declare d_id int;
    declare d_name varchar(300);
    declare d_speciality varchar(300);
    declare cnt int default 0;
    declare p_cursor cursor for select Patient_Id from patient_table;
    declare t_cursor cursor for select patient_table.Patient_Id,patient_table.Patient_Name,nurse_table.Nurse_Id,nurse_table.Nurse_Name,nurse_table.Position,doctor_table.Doctor_Id,doctor_table.Doctor_name,doctor_table.Speciality from patient_table,doctor_table,nurse_table where doctor_table.Patient_Id=p_id and nurse_table.Patient_Id=p_id and patient_table.Patient_Id=p_id;
    declare continue handler for not found set cnt = 1;
     CREATE TEMPORARY TABLE logger
  ( 
    patient_id int,
    patient_name varchar(300),
    nurse_id int,
    nurse_name varchar(300),
    nurse_position varchar(300),
    doctor_id int,
    doctor_name varchar(300),
    doctor_speciality varchar(300)
);
    open p_cursor;
    open t_cursor;
    n:loop
        fetch p_cursor into p_id;
        fetch t_cursor into p_id, p_name, n_id,n_name,n_pos,d_id,d_name,d_speciality;
        if cnt = 1 then
            leave n;
        end if; 
        insert into logger values(p_id,p_name,n_id,n_name,n_pos,d_id,d_name,d_speciality);
    end loop;
    close p_cursor;
    close t_cursor;
    SELECT * FROM logger;
	DROP TABLE logger;
end$$

DELIMITER ;
-- 4
USE `hospital_management_system`;
DROP procedure IF EXISTS `patient_doctor`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_doctor`(d_id int)
begin 
	select * from appointment_table where Doctor_id = d_id group by doctor_name;
 end$$

-- 5 (not connected to frontend)
DELIMITER ;
USE `hospital_management_system`;
DROP procedure IF EXISTS `nurse_patient_room`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nurse_patient_room`()
begin 
	declare cnt int default 0;
    declare n_id varchar(5);
    declare n_name varchar(255);
    declare p_id int default 0;
    declare n_cursor cursor for select Nurse_Id,Nurse_Name,Patient_Id from Nurse_Table order by Nurse_Id asc;
    
    declare continue handler for not found set cnt = 1;
    open n_cursor;
    n:loop
        fetch n_cursor into n_id,n_name,p_id;
        if cnt = 1 then
            leave n;
        end if; 
        -- select n_id as "Nurse_Id", n_name as "Nurse_Name", Patient_Name, Room_No from Appointment_Table where p_id = Patient_Id;
        -- select n.Nurse_Id, n.Nurse_Name, n.Patient_Id, a.Patient_Name, a.Room_No from Patient_Table p left join Nurse_Table n on p.Patient_Id=n.Patient_Id left join Appointment_Table a on p.Patient_Id=a.Patient_Id;
		select n_id as "Nurse_Id", n_name as "Nurse_Name", p_id as 'Patient_Name', a.room_no from appointment_table a where a.Patient_Id = p_id;
   end loop;
    close n_cursor;
end$$

DELIMITER ;
-- 6 

USE `hospital_management_system`;
DROP procedure IF EXISTS `Blood_Group`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Blood_Group`(bg varchar(3))

BEGIN 
select sum(Pints_donated) from blood_bank_records where blood_group = bg;
END$$

DELIMITER ;


-- 7 (not connected)

USE `hospital_management_system`;
DROP procedure IF EXISTS `Appointment`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Appointment`(d date)
BEGIN
select * from appointment_table where Appointment_Date = d ;
END$$

DELIMITER ;

-- 8
 
 USE `hospital_management_system`;
DROP procedure IF EXISTS `room_filter`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `room_filter`(r_t varchar(100), r_avail boolean)
BEGIN
	declare cnt int default 0;
  	declare r_no int; 
	declare r_type varchar(100);
	declare r_status boolean;
  	declare r_cursor cursor for select Room_No, Room_Type, Availability_Status from Room_Table;
 
	declare continue handler for not found set cnt = 1;

	open r_cursor;
  	r:loop
    		fetch r_cursor into r_no, r_type, r_status;
            if cnt = 1 then 
					leave r;
			end if;
    		if r_type = r_t and r_status = r_avail then
					SELECT distinct r_no as 'Room_No', r_type as 'Room_Type', r_status as 'Availibility_Status' from Room_Table;
                    -- select * from Room_Table;
			end if;
    end loop;
end$$

DELIMITER ;

-- Functions

-- 1
USE `hospital_management_system`;
DROP function IF EXISTS `beds_in_room`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `beds_in_room`(r int) RETURNS int(11)
    DETERMINISTIC
begin 
		declare r_no int default 0;
		declare n1 int default 0;
        declare nob int default 0;
        declare cnt int default 0;
        declare r_cursor cursor for select count(Patient_Id) from Appointment_Table where Room_No = r;
    declare continue handler for not found set cnt = 1;
		open r_cursor;
        r:loop
			fetch r_cursor into r_no; 
				if cnt = 1 then
					leave r;
				end if;
                select Number_of_bed from Room_Table where Room_No = r into n1;
                 set nob = n1-r_no;			
			end loop;
		return nob;
end$$

DELIMITER ;

-- Procedure to call function beds_in_room
USE `hospital_management_system`;
DROP procedure IF EXISTS `beds_in_room`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `beds_in_room`(r int)

BEGIN
select beds_in_room(r);
END$$

DELIMITER ;

-- 2
USE `hospital_management_system`;
DROP function IF EXISTS `blood_group_func`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `blood_group_func`(bg varchar(3)) RETURNS int(11)
    DETERMINISTIC
    
begin
    declare samesies int default 0;
    select count(Patient_Id) from Patient_Table where Blood_Group = bg into samesies; 
    return samesies;
end$$

DELIMITER ;

-- Procedure to call function blood_group_func
USE `hospital_management_system`;
DROP procedure IF EXISTS `blood_group_func`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `blood_group_func`(bg varchar(3))

BEGIN
select blood_group_func(bg);
END$$

DELIMITER ;

-- 3
USE `hospital_management_system`;
DROP function IF EXISTS `no_of_appointments`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `no_of_appointments`(d date) RETURNS int(11)
    DETERMINISTIC
    
begin
		declare No_of_appointments int default 0;
		select count(Patient_Id) from appointment_table where Appointment_Date = d into No_of_appointments;
        return No_of_appointments;
end$$

DELIMITER ;

-- Procedure to call function no_of_appointments
USE `hospital_management_system`;
DROP procedure IF EXISTS `no_of_appointments`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `no_of_appointments`(d date)

BEGIN
select no_of_appointments(d);
END$$

DELIMITER ;

-- 4
USE `hospital_management_system`;
DROP function IF EXISTS `summation`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `summation`(p_id int) RETURNS float
    DETERMINISTIC
    
begin
    declare amount float default 0.0;
    declare b_rc float default 0.0;
    declare b_tc float default 0.0;
    declare b_tax float default 0.0;
    declare b_doc float default 0.0;
    declare cnt int default 0;
    declare b_cursor cursor for select Room_Charges, Tests_Charges, Tax, Doctors_fees from Billing where Patient_Id = p_id;
    declare continue handler for not found set cnt = 1;
    open b_cursor;
    b:loop
        fetch b_cursor into b_rc,b_tc,b_tax,b_doc;
        if cnt = 1 then
            leave b;
        end if;
        set amount = b_rc+b_tc+b_tax+b_doc;
    end loop;
    return amount;
end$$

DELIMITER ;

-- Procedure to call function summation
USE `hospital_management_system`;
DROP procedure IF EXISTS `summation`;

DELIMITER $$
USE `hospital_management_system`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `summation`(p_id int)

BEGIN
select summation(p_id);
END$$

DELIMITER ;

call beds_in_room(1005);

-- Triggers

#1 -------------------------------------------------------------------------------------------------

#phone number check if = 10
drop trigger if exists patient_number;
delimiter $$
create trigger patient_number before insert on Patient_Table for each row
begin
	if length(new.Patient_Contact_No) != 10 then signal sqlstate '21000' set message_text = 'Contact Length should be 10 digits';
end if;
end $$ 
delimiter ;

#phone number check if = 10
drop trigger if exists patient_number_update;
delimiter $$
create trigger patient_number_update before update on Patient_Table for each row
begin
	if length(new.Patient_Contact_No) != 10 then signal sqlstate '21000' set message_text = 'Contact Length should be 10 digits';
end if;
end $$ 
delimiter ;

#2 ----------------------------------------------------------------------------------------

# residence number check
drop trigger if exists residence_number;
delimiter $$
create trigger residence_number before insert on Patient_Table for each row
begin
	if length(new.Residence_No) != 8 then signal sqlstate '21000' set message_text = 'Residence contact number should be equal to 8 digits' ;
end if;
end $$ 
delimiter ;

drop trigger if exists residence_number_update;
delimiter $$
create trigger residence_number_update before update on Patient_Table for each row
begin
	if length(new.Residence_No) != 8 then signal sqlstate '21000' set message_text = 'Residence contact number should be equal to 8 digits' ;
end if;
end $$ 
delimiter ;

#3 ------------------------------------------------------------------------------------------------

#emergency contact number check
drop trigger if exists emergency_number;
delimiter $$
create trigger emergency_number before insert on Patient_Table for each row
begin
	if length(new.Emergency_Number) != 10 then signal sqlstate '21000' set message_text = 'Emergency contact number should be equal to 10 digits' ;
end if;
end $$ 
delimiter ;

drop trigger if exists emergency_number_update;
delimiter $$
create trigger emergency_number_update before update on Patient_Table for each row
begin
	if length(new.Emergency_Number) != 10 then signal sqlstate '21000' set message_text = 'Emergency contact number should be equal to 10 digits' ;
end if;
end $$ 
delimiter ;

#4 ---------------------------------------------------------------------------------------------------------

#email id check 
drop trigger if exists email_check;
delimiter $$
create trigger email_check before insert on Patient_Table for each row
begin
	if  new.Email_Id not like '%@%' then signal sqlstate value '21000' set message_text = 'Email is invalid';
end if;
end $$ 
delimiter ;

drop trigger if exists email_check_update;
delimiter $$
create trigger email_check_update before update on Patient_Table for each row
begin
	if  new.Email_Id not like '%@%' then signal sqlstate value '21000' set message_text = 'Email is invalid';
end if;
end $$ 
delimiter ;

#5 -------------------------------------------------------------------------------------------------------------

#  insurance policy not greater than 11 digits
drop trigger if exists policy_check;
delimiter $$
create trigger policy_check before insert on patient_diagnosis for each row
begin
	if length(new.Insurance_Policy_No) != 11 then signal sqlstate value '21000' set message_text = 'Please enter valid policy_number';
end if;
end $$
delimiter ;

drop trigger if exists policy_check_update;
delimiter $$
create trigger policy_check_update before update on patient_diagnosis for each row
begin
	if length(new.Insurance_Policy_No) != 11 then signal sqlstate value '21000' set message_text = 'Please enter valid policy_number';
end if;
end $$
delimiter ;
#6 -----------------------------------------------------------------------------------------------------------------------

#emergency patient room number must be 1005 or 1006
drop trigger if exists emergency_room;
delimiter $$
create trigger emergency_room before insert on emergency_room_log for each row
begin
	if new.Room_No != 1005 AND new.Room_No != 1006 then signal sqlstate value '21000' set message_text = 'Please enter room no for emergency patients';
end if;
end $$
delimiter ;

drop trigger if exists emergency_room_update;
delimiter $$
create trigger emergency_room_update before update on emergency_room_log for each row
begin
	if new.Room_No != 1005 AND new.Room_No != 1006 then signal sqlstate value '21000' set message_text = 'Please enter room no for emergency patients';
end if;
end $$
delimiter ;

#7 -------------------------------------------------------------------------------------------------------------------
#deleting records from child table upon deletion from parent table 
drop trigger if exists delete_patient_table;
delimiter $$
create trigger delete_patient_table before delete on patient_table for each row
begin 
    declare rno int default 0 ;
    select Room_No from Appointment_Table where Patient_Id = old.Patient_Id into rno;
    -- select beds_in_room(rno) into n;
    #select number_of_beds from Room_Table where Room_No = rno;
    -- set n = n+1;
    #check if number of beds in particular room 

    delete from Appointment_Table where Patient_Id = old.Patient_Id;
    delete from Visitors_Table where Patient_Id = old.Patient_Id;
    delete from Billing where Patient_Id = old.Patient_Id;
    delete from Doctor_Table where Patient_Id = old.Patient_Id;
    delete from Patient_Diagnosis where Patient_Id = old.Patient_Id;
    delete from Nurse_Table where Patient_Id = old.Patient_Id;

    update Room_Table set Availability_Status = 1 where Room_No = rno ;
end $$
delimiter ;
delete from Patient_Table where Patient_Id = 1;
select * from Appointment_Table; 
select * from Visitors_Table; 
select * from Billing; 
select * from Doctor_Table; 
select * from Patient_Diagnosis; 
select * from Nurse_Table; 
select * from Room_Table;
#---------------------------------------------------------------------------------------------

#on insert check if the room is available
drop trigger if exists room_availibility_insert;
delimiter $$
create trigger room_availibility_insert before insert on Appointment_Table for each row
begin
    declare n int default 1;
    select beds_in_room(new.Room_No) into n;
        if n = 0 then signal sqlstate value '21000' set message_text = 'No beds are available in this room. Please check your room number.';
    end if;

end $$
delimiter ;

# 8 --------------------------------------------------------------------------------------------------------------------
drop trigger if exists room_availibility_update;
delimiter $$
create trigger room_availibility_update before update on Appointment_Table for each row
begin
    declare n int default 1;
    select beds_in_room(new.Room_No) into n;
        if n = 0 then signal sqlstate value '21000' set message_text = 'No beds are available in this room. Please check your room number.';
    end if;

end $$
delimiter ;
update appointment_table set room_no = 1003 where patient_id = 9;
select beds_in_room(1005);
update appointment_table set room_no = 1005 where patient_id = 10;










