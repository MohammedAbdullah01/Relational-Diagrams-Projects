create database  Library_Database ;
go 

use Library_Database;
go

create table Books
(
	id int primary key identity (1,1),
	title nvarchar(100) not null,
	publicationDate date not null,
	genre nvarchar(50) not null,
	ISBN nvarchar(50) not null ,
	additionalDetails nvarchar(max)
)
go

create table Authors
(
	id int primary key identity (1,1),
	name nvarchar(50) not null
)
go 

create table BookAuthors
(
	id int primary key identity (1,1),
	bookId int not null ,
	authorId int not null ,

	constraint FK_bookId  foreign key (bookId) references books (id),
	constraint FK_authorId  foreign key (authorId) references Authors (id),
)
go

create table BookCopies
(
	id int primary key identity (1,1),
	bookId int not null ,
	availabilityStatus bit default (1) not null,

	constraint FK_BookCopie_Book foreign key (bookId) references books(id)
)
go

create table Users
(
	id int primary key identity (1,1),
	name nvarchar(100) not null ,
	contactInformation nvarchar(255) not null,
	LibararyCardNumber nvarchar(50) not null,
)
go

create table BorrowingRecords
(
	id int primary key identity (1,1),
	copieId int not null ,
	userId int not null,
	borrowingDate date not null,
	dueDate date not null,
	actualReturnDate date ,

	constraint FK_BorrowingRecord_BookCopie foreign key (copieId) references BookCopies (id),
	constraint FK_BorrowingRecord_User foreign key (userId) references Users (id),
)
go

create table Fines
(
	id int primary key identity (1,1),
	BorrowingRecordId int not null ,
	userId int not null,
	numberOfLateDays smallint not null,
	fineAmount decimal(5,2) not null,
	paymentStatus bit default (0),

	constraint FK_Fine_BorrowingRecord foreign key (BorrowingRecordId) references BorrowingRecords (id),
	constraint FK_Fine_User foreign key (userId) references Users (id),
)
go

create table Reservations
(
	id int primary key identity (1,1),
	copieId int not null ,
	userId int not null,
	reservationDate date not null,

	constraint FK_Reservation_BookCopie foreign key (copieId) references BookCopies (id),
	constraint FK_Reservation_User foreign key (userId) references Users (id),
)
go

create table Setttings
(
	DefualtBorrrowDays tinyint ,
	DefaultFinePerDay tinyint 
)
go