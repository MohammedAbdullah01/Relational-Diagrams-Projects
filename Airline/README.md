### Overview
A relational database system designed to manage the operations of airline companies, including employees, aircrafts, flight routes, crews, and transactions. The system ensures structured storage of flight and operational data for improved management efficiency.

### Features  
- **Airline Information Management**: Store airline details such as name, address, contact person, and phone numbers.  
- **Employee Management**: Manage employees’ personal details, positions, qualifications, and contact information.  
- **Aircraft Management**: Track aircraft information including model, capacity, and identification numbers.  
- **Route Management**: Define routes with origin, destination, distance, and classification (domestic/international).  
- **Flight Scheduling**: Record passenger count, pricing, departure/arrival times, and travel duration.  
- **Crew Assignment**: Assign unique flight crews (major pilot, assistant pilot, two hostesses) to aircrafts.  
- **Transaction Management**: Record financial buy/sell transactions such as ticket sales and maintenance costs.  

### Entity Relationships  
- Each airline employs multiple employees.  
- Each airline owns multiple aircrafts.  
- Each aircraft can operate on multiple routes, and routes can have multiple aircrafts.  
- Each aircraft has one assigned crew.  
- Each airline records multiple financial transactions.  
