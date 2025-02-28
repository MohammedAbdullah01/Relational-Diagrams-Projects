

create database  Clinic_Database ;
go 

use Clinic_Database;

create table Persones 
(
	id int primary key identity(1,1),
	name nvarchar(100) not null,
	birthDate date ,
	phone nvarchar(50) not null,
	address nvarchar(50),
	email nvarchar(50),
	gender nchar(1) not null
)
go 
create table Patients 
(
	id int primary key identity(1,1),
	personeId int ,
	constraint Fk_Patient_Persone 
	foreign key (personeId) 
	references Persones (id)
)
go 
create table Doctors
(
	id int primary key identity (1,1),
	specialization nvarchar(100) not null,
	personeId int,
	constraint FK_Doctor_Persone foreign key (personeId) references persones(id)
)
go 
create table MedicalRecords
(
	id int primary key identity(1,1),
	vistDescription nvarchar(255) not null,
	diagnosis nvarchar(255) not null,
	notes nvarchar(255) not null
)
go 
create table Payments
(
	id int primary key identity(1,1),
	paymentDate date not null,
	paymentMethod nvarchar(50) not null,
	amountPaid DECIMAL(10,2) not null,
	additionalNotes nvarchar(255)
)
go 
create table Appointments
(
	id int primary key identity(1,1),
	AppointmentsStatus tinyint not null,
	AppointmentsDateTime dateTime not null,
	patientiD int ,
	doctorID int ,
	MedicalRecordID int ,
	PaymentID int ,
	constraint FK_Patient foreign key (patientiD) references Patients (id),
	constraint FK_Doctor foreign key (doctorID) references Doctors (id),
	constraint FK_MedicalRecord foreign key (MedicalRecordID) references MedicalRecords (id),
	constraint FK_Payment foreign key (PaymentID) references Payments (id)
)
go 
create table Prescriptions
(
	id int primary key identity(1,1),
	medicationName nvarchar(100) not null,
	 dosage nvarchar(50) not null,
	frequency nvarchar(50) not null,
	startDate date not null,
	endDate date not null,
	specialInstructions nvarchar(255),
	medicalRecordID int,
	
	constraint FK_Prescriptions_MedicalRecord foreign key (MedicalRecordID) references MedicalRecords (id)
)
