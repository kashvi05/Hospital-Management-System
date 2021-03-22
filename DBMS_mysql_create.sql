CREATE TABLE `Patient Table` (
	`Patient Id` INT NOT NULL AUTO_INCREMENT,
	`Patient Name` varchar(255) NOT NULL,
	`Gender` varchar(1) NOT NULL,
	`Age` INT NOT NULL,
	`Blood Group` varchar(3) NOT NULL,
	`Address` varchar(255) NOT NULL,
	`Patient Contact No` INT(10) NOT NULL,
	`Residence No` INT(10) NOT NULL,
	`Email ID` varchar(255) NOT NULL,
	`Emergency Number` INT(10) NOT NULL,
	`Emergency Contact Name` varchar(300) NOT NULL,
	`Purpose` varchar(300) NOT NULL,
	PRIMARY KEY (`Patient Id`,`Patient Name`,`Patient Contact No`)
);

CREATE TABLE `Doctor Table` (
	`Doctor Id` INT NOT NULL AUTO_INCREMENT,
	`Doctor Name` varchar(255) NOT NULL,
	`Age` INT NOT NULL,
	`Speciality` varchar(255) NOT NULL,
	`Email id` varchar(255) NOT NULL,
	`Contact No` INT(10) NOT NULL,
	`Office Room No` INT(10) NOT NULL,
	`Salary` FLOAT NOT NULL,
	`Patient Id` INT NOT NULL,
	PRIMARY KEY (`Doctor Id`,`Doctor Name`)
);

CREATE TABLE `Nurse Table` (
	`Nurse Id` INT NOT NULL,
	`Nurse Name` varchar(300) NOT NULL,
	`Gender` varchar(1) NOT NULL,
	`Age` INT NOT NULL,
	`Phone Number` INT(10) NOT NULL,
	`Joining Date` DATETIME NOT NULL,
	`Shift Days` varchar(300) NOT NULL,
	`Shift timing` TIMESTAMP NOT NULL,
	`Position` varchar(300) NOT NULL,
	`Salary` FLOAT NOT NULL,
	`Patient Id` INT NOT NULL,
	PRIMARY KEY (`Nurse Id`)
);

CREATE TABLE `Room Table` (
	`Room No` INT NOT NULL AUTO_INCREMENT,
	`Room type` varchar(100) NOT NULL,
	`Number of bed` INT NOT NULL,
	`Availibility Status` BOOLEAN NOT NULL,
	PRIMARY KEY (`Room No`)
);

CREATE TABLE `Appointment Table` (
	`Patient Id` INT NOT NULL UNIQUE,
	`Patient Name` varchar(255) NOT NULL,
	`Appointment Date` DATETIME NOT NULL,
	`Time` TIMESTAMP NOT NULL,
	`Purpose` varchar(300) NOT NULL,
	`Patient Contact No` INT(10) NOT NULL,
	`Doctor Id` INT NOT NULL UNIQUE,
	`Doctor Name` varchar(255) NOT NULL,
	`Room No` INT NOT NULL
);

CREATE TABLE `Billing` (
	`Bill No` INT NOT NULL AUTO_INCREMENT,
	`Bill Date` DATETIME NOT NULL,
	`Patient Id` INT NOT NULL,
	`Patient Name` varchar(255) NOT NULL,
	`Doctor Id` INT NOT NULL,
	`Doctor's fees` FLOAT NOT NULL,
	`Room Charges` FLOAT,
	`Tests Charges` FLOAT,
	`Tax` FLOAT NOT NULL,
	`Total Amount` FLOAT NOT NULL,
	PRIMARY KEY (`Bill No`)
);

CREATE TABLE `Blood Bank Records` (
	`Date issued` DATETIME NOT NULL,
	`Blood Group` varchar(3) NOT NULL,
	`Pints available` INT NOT NULL,
	PRIMARY KEY (`Blood Group`)
);

CREATE TABLE `Patient Diagnosis` (
	`Date` DATETIME NOT NULL,
	`Diagnosis details` varchar(300) NOT NULL,
	`Remarks` varchar(300) NOT NULL,
	`Prescription` varchar(300) NOT NULL,
	`Insurance Policy No` varchar(100) NOT NULL,
	`Patient Id` INT NOT NULL,
	PRIMARY KEY (`Date`)
);

CREATE TABLE `Patient's Medical Records` (
	`Record No` INT NOT NULL AUTO_INCREMENT,
	`Date` DATETIME NOT NULL,
	`Patient Id` INT NOT NULL,
	`Patient Name` varchar(255) NOT NULL,
	`Doctor Id` INT NOT NULL,
	`Doctor Name` varchar(255) NOT NULL,
	`Diagnosis details` varchar(300) NOT NULL,
	`Remarks` varchar(300) NOT NULL,
	`Presciption` varchar(300) NOT NULL,
	PRIMARY KEY (`Record No`)
);

ALTER TABLE `Doctor Table` ADD CONSTRAINT `Doctor Table_fk0` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Table`(`Patient Id`);

ALTER TABLE `Nurse Table` ADD CONSTRAINT `Nurse Table_fk0` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Table`(`Patient Id`);

ALTER TABLE `Appointment Table` ADD CONSTRAINT `Appointment Table_fk0` FOREIGN KEY (`Patient Name`) REFERENCES `Patient Table`(`Patient Name`);

ALTER TABLE `Appointment Table` ADD CONSTRAINT `Appointment Table_fk1` FOREIGN KEY (`Patient Contact No`) REFERENCES `Patient Table`(`Patient Contact No`);

ALTER TABLE `Appointment Table` ADD CONSTRAINT `Appointment Table_fk2` FOREIGN KEY (`Doctor Id`) REFERENCES `Doctor Table`(`Doctor Id`);

ALTER TABLE `Appointment Table` ADD CONSTRAINT `Appointment Table_fk3` FOREIGN KEY (`Doctor Name`) REFERENCES `Doctor Table`(`Doctor Name`);

ALTER TABLE `Appointment Table` ADD CONSTRAINT `Appointment Table_fk4` FOREIGN KEY (`Room No`) REFERENCES `Room Table`(`Room No`);

ALTER TABLE `Billing` ADD CONSTRAINT `Billing_fk0` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Table`(`Patient Id`);

ALTER TABLE `Billing` ADD CONSTRAINT `Billing_fk1` FOREIGN KEY (`Patient Name`) REFERENCES `Patient Table`(`Patient Id`);

ALTER TABLE `Billing` ADD CONSTRAINT `Billing_fk2` FOREIGN KEY (`Doctor Id`) REFERENCES `Doctor Table`(`Doctor Id`);

ALTER TABLE `Billing` ADD CONSTRAINT `Billing_fk3` FOREIGN KEY (`Doctor's fees`) REFERENCES `Doctor Table`(`Doctor's fees`);

ALTER TABLE `Patient Diagnosis` ADD CONSTRAINT `Patient Diagnosis_fk0` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Table`(`Patient Id`);

ALTER TABLE `Patient's Medical Records` ADD CONSTRAINT `Patient's Medical Records_fk0` FOREIGN KEY (`Date`) REFERENCES `Patient Diagnosis`(`Date`);

ALTER TABLE `Patient's Medical Records` ADD CONSTRAINT `Patient's Medical Records_fk1` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Table`(`Patient Id`);

ALTER TABLE `Patient's Medical Records` ADD CONSTRAINT `Patient's Medical Records_fk2` FOREIGN KEY (`Patient Name`) REFERENCES `Patient Table`(`Patient Name`);

ALTER TABLE `Patient's Medical Records` ADD CONSTRAINT `Patient's Medical Records_fk3` FOREIGN KEY (`Doctor Id`) REFERENCES `Doctor Table`(`Doctor Id`);

ALTER TABLE `Patient's Medical Records` ADD CONSTRAINT `Patient's Medical Records_fk4` FOREIGN KEY (`Doctor Name`) REFERENCES `Doctor Table`(`Doctor Name`);

ALTER TABLE `Patient's Medical Records` ADD CONSTRAINT `Patient's Medical Records_fk5` FOREIGN KEY (`Diagnosis details`) REFERENCES `Patient Diagnosis`(`Diagnosis details`);

ALTER TABLE `Patient's Medical Records` ADD CONSTRAINT `Patient's Medical Records_fk6` FOREIGN KEY (`Remarks`) REFERENCES `Patient Diagnosis`(`Remarks`);

ALTER TABLE `Patient's Medical Records` ADD CONSTRAINT `Patient's Medical Records_fk7` FOREIGN KEY (`Presciption`) REFERENCES `Patient Diagnosis`(`Prescription`);

