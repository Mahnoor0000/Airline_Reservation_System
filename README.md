# Airline Reservation System - README

## Overview

This project represents a comprehensive **Airline Reservation System** that manages client, flight, reservation, payment, and staff data using SQL Server. It includes the structure of tables, sample data, stored procedures for common operations (like adding clients, reservations, and payments), triggers for managing overbookings and cancellations, and transaction-based procedures to handle bookings and payments atomically.

### Key Features:
- **Client Management**: Manage client details such as name, email, phone, and passport information.
- **Staff Management**: Store and manage staff information, including roles such as pilots, cabin crew, ground staff, and flight managers.
- **Flight Management**: Store flight details like flight ID, origin, destination, date, time, and seat availability.
- **Reservation Management**: Make flight reservations, check seat availability, and manage client bookings.
- **Payment Management**: Handle payment records, including payment method, amount, and reservation status.
- **Triggers**: Automatically prevent overbooking, prevent duplicate seat assignments, and handle reservation cancellations.
- **Stored Procedures**: Facilitate various operations like adding clients, making reservations, adding payments, and updating flight management.
- **Transaction Management**: Use transactions to ensure atomicity between reservations and payments.

### Tables

1. **Client**: Stores client information (ID, name, email, phone, passport number).
2. **Staff**: Stores staff details (ID, name, role, contact).
3. **Flight**: Stores flight details (flight ID, origin, destination, date, time, available seats, managed by).
4. **Reservation**: Stores reservation details (reservation ID, date, seat number, client ID, flight ID).
5. **Payment**: Stores payment information (payment ID, amount, method, status, reservation ID).

### Stored Procedures

- **AddClient**: Adds a new client to the `Client` table.
- **AddReservation**: Adds a reservation, checking if there are available seats.
- **AddPayment**: Adds a payment for a specific reservation.
- **AssignStaffToFlight**: Assigns a staff member to manage a specific flight.
- **CancelReservation**: Cancels a reservation and updates flight seat availability.
- **ChangeSeat**: Changes the seat number for a reservation while ensuring the new seat is available.
- **BookReservationTxn**: A transaction-based procedure that handles booking a reservation and creating the associated payment atomically.

### Triggers

- **trg_PreventOverbooking**: Prevents reservations when there are no available seats on the flight.
- **trg_IncreaseSeatsOnCancel**: Automatically increases available seats when a reservation is cancelled.
- **trg_PreventDuplicateSeat**: Prevents assigning the same seat to two different passengers on the same flight.
- **trg_DefaultReservationStatus**: Automatically sets a new reservation’s status to 'Active' if it is null.
- **trg_NoDeletePaidReservation**: Prevents the deletion of reservations that have an associated payment.

### Security & Roles

- **BookingRole**: A role that allows users to view flights, reservations, and payments and execute booking transactions.
- **Permissions**: Permissions for reading and inserting data into flights, reservations, and payments, and executing the `BookReservationTxn` procedure.

### Example Operations

- **Adding a Client**: `EXEC AddClient` adds a new client to the system.
- **Booking a Reservation**: `EXEC BookReservationTxn` makes a booking and creates a payment.
- **Seat Change**: `EXEC ChangeSeat` updates the seat number for an existing reservation.
- **Cancelling a Reservation**: `EXEC CancelReservation` marks a reservation as cancelled and updates the flight's available seats.
- **Get Passengers for a Flight**: `EXEC GetPassengersForFlight` fetches all active passengers on a specific flight.

### SQL Scripts for Testing

This project includes testing scripts for various operations like:
- Adding new clients and reservations.
- Managing payments for reservations.
- Assigning staff to flights.
- Handling cancellation and seat change.

### Installation

1. **Set up SQL Server**: Ensure that you have access to an instance of SQL Server.
2. **Execute SQL Script**: Run the provided SQL script on your SQL Server to create the database, tables, procedures, and triggers.
3. **Insert Sample Data**: The script includes sample data for clients, staff, flights, reservations, and payments. You can modify these as needed.
4. **Test the System**: Use the provided stored procedures to test adding clients, making reservations, processing payments, and managing flight details.

