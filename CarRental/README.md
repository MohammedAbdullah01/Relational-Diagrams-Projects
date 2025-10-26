## 🚗 Car Rental System  

### Overview  
A database system designed to manage all aspects of a car rental company including customers, vehicles, bookings, payments, and returns.  

### Features  
- **Customer Management**: Store customer personal and license information.  
- **Vehicle Inventory**: Track vehicles’ details (make, model, mileage, rental rate, plate number, fuel type, category).  
- **Booking Management**: Record rental duration, pickup/dropoff locations, and booking statuses.  
- **Transaction Handling**: Record initial and final payment details per booking.  
- **Vehicle Return Management**: Calculate additional charges and refunds upon vehicle return.  
- **Mileage Tracking**: Track distance driven during each rental period.  

### Entity Relationships  
- Each customer can have multiple bookings.  
- Each vehicle can be booked multiple times (not simultaneously).  
- Each booking is linked to one transaction and one vehicle return record.  
