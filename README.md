# Relational Schema Projects

This repository contains the database schemas for five different projects: Clinic Management System, Car Rental System, Karate Club Management System, Library Management System, and Online Store Management System. Each schema is designed to meet specific business requirements outlined below.

## 1. Clinic Management System

### Overview
A comprehensive database system designed to manage patient information, doctor details, appointments, medical records, prescriptions, and payment processing for a healthcare clinic.

### Features
- **Patient Management**: Store and track patient information including unique identifiers, personal details, contact information, and addresses.
- **Doctor Management**: Maintain comprehensive records of healthcare providers including specializations and contact details.
- **Appointment Scheduling**: Track appointment status through various states (Pending, Confirmed, Completed, Canceled, Rescheduled, No Show).
- **Medical Records**: Document patient visits, diagnoses, and treatments linked to specific appointments.
- **Prescription Management**: Record medication details, dosage instructions, and treatment durations.
- **Payment Processing**: Track payment information for appointments including payment methods and amounts.

### Entity Relationships
- Each patient can have multiple appointments
- Each doctor can have multiple appointments
- Each appointment is linked to exactly one medical record
- Each medical record can have up to one prescription
- Each appointment has one payment record

## 2. Car Rental System

### Overview
A database system for managing vehicle rentals, customer information, bookings, and payment transactions.

### Features
- **Customer Management**: Store personal information, contact details, and driver's license data.
- **Vehicle Inventory**: Track detailed vehicle information including make, model, year, mileage, rental rates, fuel type, plate number, and category.
- **Booking Management**: Record rental periods, pickup/dropoff locations, and initial cost estimates.
- **Transaction Processing**: Document payment details and track initial paid amounts.
- **Vehicle Return Processing**: Calculate actual rental duration, record final condition checks, determine additional charges, and manage refunds.
- **Mileage Tracking**: Monitor vehicle usage by calculating the difference between initial and final mileage.

### Entity Relationships
- Each customer can have multiple bookings
- Each vehicle can be booked multiple times (not simultaneously)
- Each booking has one transaction record
- Each booking has one vehicle return record

## 3. Karate Club Management System

### Overview
A database system designed to manage memberships, instructors, belt ranks, testing, and payment processing for a karate club.

### Features
- **Membership Management**: Store member profiles, contact information, emergency contacts, and track membership status and subscription periods.
- **Instructor Management**: Maintain instructor profiles including qualifications and training assignments.
- **Belt Rank System**: Support a comprehensive 17-level belt system from White Belt to Black Belt (10th Dan).
- **Testing Management**: Track belt test dates, results, and examining instructors.
- **Payment Processing**: Manage both membership fees and belt test fees with payment history tracking.

### Entity Relationships
- Members can train with multiple instructors
- Instructors can train multiple members
- Each member has a current belt rank
- Members participate in belt tests to advance ranks
- Members make payments for both subscriptions and tests

## 4. Library Management System

### Overview
A database system for managing book inventory, user accounts, borrowing operations, reservations, and fine collection.

### Features
- **Book Management**: Track detailed book information and maintain multiple copies with unique identifiers.
- **User Account Management**: Store user profiles and library card information.
- **Borrowing Process**: Record borrowing history, due dates, and manage the return process.
- **Reservation System**: Enable users to place holds on checked-out books with queue management.
- **Fine Management**: Calculate late return penalties, track outstanding balances, and record payment status.

### Entity Relationships
- Each book can have multiple copies
- Users can borrow multiple book copies
- Users can place multiple holds
- Each borrowed copy can have associated fines
- Each user can have multiple fine records

## 5. Online Store Management System

### Overview
A comprehensive e-commerce database system for managing product inventory, customer accounts, order processing, payments, shipping, and product reviews.

### Features
- **Product Catalog**: Store detailed product information including descriptions, pricing, stock levels, and images.
- **Customer Management**: Maintain customer profiles, contact details, shipping addresses, and login credentials.
- **Order Processing**: Track orders through multiple statuses (Pending, Processing, Shipped, Delivered, Cancelled, Refunded).
- **Payment Management**: Record transaction details, payment methods, and timestamps.
- **Shipping System**: Track shipping carriers, delivery statuses, and estimated/actual delivery dates.
- **Review System**: Store customer product ratings and reviews with timestamp tracking.

### Entity Relationships
- Customers can place multiple orders
- Orders contain multiple products
- Each order has one payment transaction
- Each order has one shipping record
- Customers can write multiple product reviews

## Installation and Setup

1. Choose a relational database management system (MySQL, PostgreSQL, SQL Server, etc.)
2. Create the database using the provided SQL scripts
3. Configure connection settings for your application
4. Implement the necessary business logic to interact with the database

## Documentation

Each project folder contains:
- Entity Relationship Diagram (ERD)
- SQL script for database creation
- Sample queries for common operations
- Data dictionary explaining each table and field

## Contributing

Please follow these steps to contribute:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request with a detailed description of your changes

## License

This project is licensed under the MIT License - see the LICENSE file for details.
