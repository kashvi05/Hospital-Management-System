CREATE TABLE `Patient Table` (
	`Patient Id` VARCHAR(255) NOT NULL,
	`Patient Name` VARCHAR(255) NOT NULL,
	`Gender` VARCHAR(255) NOT NULL,
	`Age` INT NOT NULL,
	`Contact No` INT(10) NOT NULL,
	`Email ID` VARCHAR(255) NOT NULL,
	`Appointment Date` DATETIME NOT NULL,
	`Purpose` varchar(255) NOT NULL,
	`Room No` INT NOT NULL,
	`Prescription` varchar(255) NOT NULL,
	`Emergency Number` INT(10) NOT NULL,
	`Address` varchar(255) NOT NULL,
	`Insurance Policy No` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`Patient Id`)
);

CREATE TABLE `Doctor Table` (
	`Doctor Id` VARCHAR(255) NOT NULL,
	`Doctor Name` VARCHAR(255) NOT NULL,
	`Age` INT NOT NULL,
	`Speciality` VARCHAR(255) NOT NULL,
	`Email id` VARCHAR(255) NOT NULL,
	`Contact No` INT(10) NOT NULL,
	`Office Room No` varchar(10) NOT NULL,
	`Visiting hours` TIMESTAMP NOT NULL,
	`Home Address` varchar(255) NOT NULL,
	`Salary` FLOAT NOT NULL,
	`Patient Id` FLOAT NOT NULL,
	PRIMARY KEY (`Doctor Id`)
);

CREATE TABLE `Nurse Table` (
	`Nurse Id` VARCHAR(255) NOT NULL,
	`Nurse Name` VARCHAR(255) NOT NULL,
	`Gender` VARCHAR(255) NOT NULL,
	`Age` INT NOT NULL,
	`Phone Number` INT(10) NOT NULL,
	`Joining Date` DATETIME NOT NULL,
	`Shift Days` DATETIME NOT NULL,
	`Shift timing` TIMESTAMP NOT NULL,
	`Position` VARCHAR(255) NOT NULL,
	`Salary` FLOAT NOT NULL,
	PRIMARY KEY (`Nurse Id`)
);

CREATE TABLE `Room Table` (
	`Room No` INT NOT NULL,
	`Room type` VARCHAR(255) NOT NULL,
	`Number of bed` INT NOT NULL,
	`Availibility Status` INT NOT NULL
);

CREATE TABLE `Appointment Table` (
	`Appointment Date` DATETIME NOT NULL,
	`Time` TIMESTAMP NOT NULL,
	`Patient Id` VARCHAR(255) NOT NULL,
	`Patient Name` VARCHAR(255) NOT NULL,
	`Doctor Id` VARCHAR(255) NOT NULL,
	`Doctor Name` VARCHAR(255) NOT NULL,
	`Contact No` VARCHAR(255) NOT NULL,
	`Purpose` VARCHAR(255) NOT NULL
);

CREATE TABLE `Billing` (
	`Bill Date` DATETIME NOT NULL,
	`Patient Id` VARCHAR(255) NOT NULL,
	`Patient Name` VARCHAR(255) NOT NULL,
	`Doctor Id` VARCHAR(255) NOT NULL,
	`Doctor's fees` FLOAT NOT NULL,
	`Room Charges` FLOAT NOT NULL,
	`Tests Charges` FLOAT NOT NULL,
	`Tax` FLOAT NOT NULL,
	`Total Amount` FLOAT NOT NULL
);

CREATE TABLE `Patient Doctor Nurse` (
	`Patient Id` VARCHAR(255) NOT NULL,
	`Doctor Id` VARCHAR(255) NOT NULL,
	`Doctor Name` VARCHAR(255) NOT NULL,
	`Nurse Id` VARCHAR(255) NOT NULL,
	`Nurse Name` VARCHAR(255) NOT NULL,
	`Room No` INT NOT NULL
);

CREATE TABLE `Blood Bank Records` (
	`Date issued` DATETIME NOT NULL,
	`Blood Type` VARCHAR(255) NOT NULL,
	`Pints available` VARCHAR(255) NOT NULL
);

CREATE TABLE `Admitting Table` (
	`Room No` INT NOT NULL,
	`Patient Id` VARCHAR(255) NOT NULL,
	`Doctor Id` VARCHAR(255) NOT NULL,
	`Nurse Id` VARCHAR(255) NOT NULL,
	`Admitting Date` DATETIME NOT NULL
);

ALTER TABLE `Doctor Table` ADD CONSTRAINT `Doctor Table_fk0` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Table`(`Patient Id`);

ALTER TABLE `Admitting Table` ADD CONSTRAINT `Admitting Table_fk0` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Table`(`Patient Id`);

ALTER TABLE `Admitting Table` ADD CONSTRAINT `Admitting Table_fk1` FOREIGN KEY (`Doctor Id`) REFERENCES `Doctor Table`(`Doctor Id`);
