create database  CarRental_Database ;
go 

use CarRental_Database;

create table Customers
(
	id int primary key identity (1,1),
	name nvarchar(100) not null ,
	ContactInfo nvarchar(100) not null ,
	driverLicenseNumber  nvarchar(20) not null 
)
go

create table VehicleCategories
(
	id int primary key identity (1,1),
	categoryName nvarchar(50) not null ,
)
go

create table FuleTypes
(
	id int primary key identity (1,1),
	fuleType nvarchar(50) not null ,
)
go

create table Vehicles
(
	id int primary key identity (1,1),
	model nvarchar(50) not null ,
	make nvarchar(50) not null ,
	vehicleYear  smallint not null ,
	mileage decimal not null,
	rentalPricePerDay smallmoney not null,
	plateNumber nvarchar(10) unique not null,
	IsAvailableForRent bit default(1),
	vehicleCategoryID int not null,
	FuleTypeID int not null,

	constraint  FK_Vehicle_VehicleCategory foreign key (vehicleCategoryID) references VehicleCategories (id),
	constraint  FK_Vehicle_FuleType foreign key (FuleTypeID) references FuleTypes (id)
)
go

create table VehiclesBooking
(
	id int primary key identity (1,1),
	rentalStartDate datetime not null ,
	rentalEndDate datetime not null ,
	pickupLocation nvarchar(255) not null,
	dropOfLocation nvarchar(255) not null,
	InitialRentalDays tinyint not null,
	initialTotalDueAmount smallmoney not null,
	initialVehicleCheckNotes nvarchar(max) not null,
	customerID int not null,
	vehicleID int not null,

	constraint  FK_VehicleBooking_Customer foreign key (customerID) references VehicleCategories (id),
	constraint  FK_VehicleBooking_Vehicle foreign key (vehicleID) references Vehicles (id)
)
go

create table [VehiclesReturn]
(
	id int primary key identity (1,1),
	actualReturnDate datetime not null ,
	actualRentalDays tinyint not null ,
	finalVehicleCheckNote nvarchar(max) not null,
	additionalCharges smallmoney not null,
	actualFinalAmountDue smallmoney not null,
	mileage smallint not null,
	consumedMilaeage smallint not null,
)
go

create table RentalTransactions
(
	id int primary key identity (1,1),
	paymentDetails nvarchar(50) not null ,
	initialPaidAmount smallmoney not null ,
	paidInitialTotalDueAmount smallmoney not null,
	actualTotalDueAmount smallmoney ,
	totalRemaining smallmoney ,
	totalRefundedAmount smallmoney ,
	transactionDate datetime not null,
	updatedTransactionDate datetime,
	vehicleReturnId int,
	vehicleBookingId int not null,

	constraint  FK_RentalTransaction_VehicleReturn foreign key (vehicleReturnId) references [VehiclesReturn] (id),
	constraint  FK_RentalTransaction_VehicleBooking foreign key (vehicleBookingId) references VehiclesBooking (id)
)
go

create table Maintenance
(
	id int primary key identity (1,1),
	description nvarchar(255) not null ,
	maintenanceDate date not null ,
	cost smallmoney not null,
	vehicleID int not null,

	constraint  FK_Maintenance_Vehicle foreign key (vehicleID) references Vehicles (id)
)

