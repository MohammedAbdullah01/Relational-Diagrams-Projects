create database  KarateClub_Database ;
go 

use KarateClub_Database;

create table Persones
(
	id int primary key identity (1,1),
	Name nvarchar(100) not null ,
	Address  nvarchar(255) not null , 
	ContactInfo nvarchar(255) not null 
)
go

create table BeltRanks 
(
	id int primary key identity (1,1),
	RankName nvarchar(100) not null,
	TestFees smallmoney not null
)

go

create table members 
(
	id int primary key identity (1,1),
	emergencyContact nvarchar(50) not null,
	isActive bit default (1),
	personeId int not null,
	lastBeltRankId int not null,

	constraint FK_Member_Persone foreign key (personeId) references Persones (id),
	constraint FK_Member_BeltRank foreign key (lastBeltRankId) references BeltRanks (id)
)
go

create table Instructors 
(
	id int primary key identity (1,1),
	ContactInfo nvarchar(255) not null,
	personeId int not null,

	constraint FK_Instructor_Persone foreign key (personeId) references Persones (id)
)
go

create table Qualifications 
(
	id int primary key identity (1,1),
	Qualification nvarchar(255) not null,
	instructorId int not null,

	constraint FK_Qualification_Instructor foreign key (instructorId) references Instructors (id)
)
go

create table MemberInstructors 
(
	instructorId int not null,
	memberId int not null,

	constraint PK_MemberInstructor_Instructor_Member primary key (instructorId , memberId),
	constraint FK_MemberInstructor_Instructor foreign key (instructorId) references Instructors (id),
	constraint FK_MemberInstructor_Member foreign key (memberId) references Members (id)
)
go

create table Payments 
(
	id int primary key identity (1,1),
	amount decimal (8,2) not null,
	dateNow datetime not null,
	memberId int not null,

	constraint FK_Payment_Member foreign key (memberId) references Members (id)
)
go

create table Subscriptios 
(
	id int primary key identity (1,1),
	startDate date not null,
	endDate date not null,
	fees smallmoney not null,
	memberID int not null,
	paymentID int not null,

	constraint FK_Subscriptio_Member foreign key (memberId) references Members (id),
	constraint FK_Subscriptio_Payment foreign key (paymentID) references Payments (id)
)
go

create table BeltTests 
(
	id int primary key identity (1,1),
	assignDate		date not null,
	Result			bit default (1),
	fees			smallmoney not null,
	memberId		int not null,
	instructorId	int not null,
	RankId			int not null,
	paymentId		int not null,

	constraint FK_BeltTest_Member foreign key (memberId) references Members (id),
	constraint FK_BeltTest_Instructor foreign key (instructorId) references Instructors (id),
	constraint FK_BeltTest_BeltRank foreign key (RankId) references BeltRanks (id),
	constraint FK_BeltTest_Payment foreign key (paymentID) references Payments (id)
)
go