create database  Airline_Database ;
go 

use Airline_Database;

create table Airlines  
(
	id	int primary key identity,
	name nvarchar(50) not null ,
	address	nvarchar(100) not null,
	contactPerson	nvarchar(50) not null
)
go

create table Aircrafts  
(
	id	int primary key identity,
	capacity nvarchar(50) not null ,
	model nvarchar(50) not null,
	ajorPilot nvarchar(50) not null, 
	assistant varchar(50) not null,
	host_1 varchar(50) not null,
	host_2 varchar(50) not null , 
	airlineID int not null,

	constraint FK_Aircraft_Airline foreign key (airlineID) references Airlines(id)
)
go

create table Routes  
(
	id	int primary key identity,
	origin nvarchar(100) not null ,
	destination nvarchar(100) not null,
	distance decimal(10 , 2) not null, 
	classification bit not null
)
go

create table AircraftRoutes  
(
	numberOfPassengers smallint not null ,
	arrival bit not null,
	departure bit not null, 
	airlineID int not null,
	routeID int not null,

	constraint FK_AircraftRoute_Airline foreign key (airlineID) references Airlines(id),
	constraint FK_AircraftRoute_Route foreign key (routeID) references Routes(id)
)
go

create table AirlinePhones  
(
	id	int primary key identity,
	phone nvarchar(20) not null ,
	airlineID int not null,

	constraint FK_AirlinePhone_Airline foreign key (airlineID) references Airlines(id)
)
go

create table Transactions  
(
	id	int primary key identity,
	description nvarchar(255) not null ,
	amount smallmoney not null,
	transactionDate datetime not null, 
	airlineID int not null,

	constraint FK_Transaction_Airline foreign key (airlineID) references Airlines(id)
)
go

create table Employees  
(
	id	int primary key identity,
	name nvarchar(50) not null ,
	address nvarchar(50) not null,
	gender nchar(1) not null, 
	position nvarchar(50) not null, 
	BDYear nchar(4) not null,
	DBMonth nvarchar(10) not null,
	DBDay nvarchar(10) not null , 
	airlineID int not null,

	constraint FK_Employee_Airline foreign key (airlineID) references Airlines(id)
)
go

create table EmployeeQualifications  
(
	id	int primary key identity,
	qualification varchar(100) not null ,
	employeeID int not null,

	constraint FK_Qualification_Employee foreign key (employeeID) references Employees(id)
)
go

