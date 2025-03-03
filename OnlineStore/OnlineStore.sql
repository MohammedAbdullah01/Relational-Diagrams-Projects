create database  OnlineStore_Database ;
go 

use OnlineStore_Database;

create table ProductCategories
(
	id int primary key identity (1,1),
	categoryName nvarchar(100) not null 
)
go

create table Products
(
	id int primary key identity (1,1),
	name nvarchar(100) not null ,
	description nvarchar(max) not null,
	price smallmoney not null,
	quantityInStock smallint not null,
	categotyID int not null,

	constraint FK_Product_Category foreign key (categotyID) references ProductCategories (id)
)
go

create table ProductImages
(
	id int primary key identity (1,1),
	imageUrl nvarchar(max) not null ,
	imageOrder smallint not null,
	productID int not null,

	constraint FK_ProductImage_Product foreign key (productID) references Products (id)
)
go

create table Customers
(
	id int primary key identity (1,1),
	name nvarchar(100) not null ,
	email nvarchar(100) not null,
	phone nvarchar(20) not null,
	address nvarchar(255) not null,
	username nvarchar(50) not null,
	password nvarchar(100) not null,
)
go

create table Orders
(
	id int primary key identity (1,1),
	orderNumber nvarchar(100) not null ,
	orderDate datetime not null,
	price smallmoney not null,
	status smallint not null,
	customerID int not null,

	constraint FK_Order_Customer foreign key (customerID) references  Customers (id)
)
go

create table OrderItems
(
	quantity tinyint not null ,
	price smallmoney not null,
	totalItemsPrice smallmoney not null,
	orderID int not null,
	productID int not null,

	constraint PK_Order_Product primary key (orderID , productID),
	constraint FK_OrderItem_Order foreign key (orderID) references  Orders (id),
	constraint FK_OrderItem_Product foreign key (productID) references  Products (id)
)
go

create table Payments
(
	id int primary key identity (1,1),
	transactionID nvarchar(100) not null ,
	paymentAmount decimal(10,2) not null,
	paymentMethod nvarchar(100) not null,
	PaymentDateTime timestamp not null,
	orderID int not null,

	constraint FK_Payment_Order foreign key (orderID) references  Orders (id)
)
go

create table Shippings
(
	id int primary key identity (1,1),
	carrierName nvarchar(100) not null ,
	trackingNumber nvarchar(50) not null,
	shippingStatus smallint not null,
	estimatedDeliveryDate datetime not null,
	actualDeliveryDate timestamp not null,
	orderID int not null,

	constraint FK_Shipping_Order foreign key (orderID) references Orders (id)
)
go

create table ReviewsRatings
(
	id int primary key identity (1,1),
	reviewText nvarchar(max) not null ,
	ratingScore decimal(1,1) not null,
	created_at timestamp not null,
	estimatedDeliveryDate datetime not null,
	productID int not null,
	customerID int not null,

	constraint FK_ReviewRating_Product foreign key (productID) references Products (id),
	constraint FK_ReviewRating_Customer foreign key (customerID) references Customers (id)
)
go