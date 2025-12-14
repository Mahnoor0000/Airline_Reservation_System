USE [AIR-LINE]
GO


drop table if exists Client,Staff, Flight, Reservation, Payment ;
-- ===========================
--   CLIENT TABLE
-- ===========================
CREATE TABLE Client (
    client_id      INT PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    email          VARCHAR(150) UNIQUE,
    phone          VARCHAR(20),
    passport       VARCHAR(50)
);

-- ===========================
--   STAFF TABLE
-- ===========================
CREATE TABLE Staff (
    staff_id   INT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    role       VARCHAR(50),
    contact    VARCHAR(50)
);

-- ===========================
--   FLIGHT TABLE
-- ===========================
CREATE TABLE Flight (
    flight_id        INT PRIMARY KEY,
    origin           VARCHAR(100) NOT NULL,
    destination      VARCHAR(100) NOT NULL,
    flight_date      DATE NOT NULL,
    flight_time      TIME NOT NULL,
    available_seats  INT,
    managed_by       INT,
    
    CONSTRAINT FK_Flight_Staff 
    FOREIGN KEY (managed_by) REFERENCES Staff(staff_id)
);

-- ===========================
--   RESERVATION TABLE
-- ===========================
CREATE TABLE Reservation (
    reservation_id     INT PRIMARY KEY,
    reservation_date   DATE NOT NULL,
    seat_no            VARCHAR(10),
    client_id          INT NOT NULL,
    flight_id          INT NOT NULL,

    CONSTRAINT FK_Reservation_Client 
        FOREIGN KEY (client_id) REFERENCES Client(client_id),

    CONSTRAINT FK_Reservation_Flight 
        FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

-- ===========================
--   PAYMENT TABLE
-- ===========================
CREATE TABLE Payment (
    payment_id      INT PRIMARY KEY,
    amount          DECIMAL(10,2) NOT NULL,
    method          VARCHAR(50),
    status          VARCHAR(50),
    reservation_id  INT UNIQUE,

    CONSTRAINT FK_Payment_Reservation 
        FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
);



------------------------------------

-- INSERTING SAMPLE DATA

------------------------------------


------------------------------------
-- INSERT DATA INTO CLIENT
------------------------------------
INSERT INTO Client (client_id, name, email, phone, passport) VALUES
(1, 'Ayesha Khan', 'ayesha.khan@gmail.com', '0301-5551234', 'PK9876543'),
(2, 'John Matthews', 'john.matthews@gmail.com', '0302-4449988', 'US5567891'),
(3, 'Sara Malik', 'sara.malik@gmail.com', '0311-2223344', 'PK1122334'),
(4, 'Omar Farooq', 'omar.farooq@gmail.com', '0321-9988776', 'PK7788990'),
(5, 'Emily Watson', 'emily.watson@gmail.com', '0333-8899221', 'UK3344552'),
(6, 'Raza Hussain', 'raza.hussain@gmail.com', '0307-5566778', 'PK2233445'),
(7, 'Maria Lopez', 'maria.lopez@gmail.com', '0345-2211990', 'SP8899001'),
(8, 'Bilal Ahmed', 'bilal.ahmed@gmail.com', '0324-6622554', 'PK6677881'),
(9, 'Hina Shah', 'hina.shah@gmail.com', '0331-7788002', 'PK4466772'),
(10,'David Smith', 'david.smith@gmail.com', '0304-5522441', 'US9988773');


------------------------------------
-- INSERT DATA INTO STAFF
------------------------------------
INSERT INTO Staff (staff_id, name, role, contact) VALUES
(1, 'Captain Imran Qureshi', 'Pilot', 'imran.qureshi@airline.com'),
(2, 'Sarah Johnson', 'Co-Pilot', 'sarah.johnson@airline.com'),
(3, 'Ali Raza', 'Cabin Crew', 'ali.raza@airline.com'),
(4, 'Nadia Sheikh', 'Cabin Crew', 'nadia.sheikh@airline.com'),
(5, 'Michael Brown', 'Ground Staff', 'michael.brown@airline.com'),
(6, 'Zainab Malik', 'Flight Manager', 'zainab.malik@airline.com'),
(7, 'Hassan Tariq', 'Pilot', 'hassan.tariq@airline.com'),
(8, 'Rachel Green', 'Co-Pilot', 'rachel.green@airline.com'),
(9, 'Farah Aziz', 'Ground Staff', 'farah.aziz@airline.com'),
(10,'Adnan Aslam', 'Flight Manager', 'adnan.aslam@airline.com');


------------------------------------
-- INSERT DATA INTO FLIGHT
------------------------------------
INSERT INTO Flight (flight_id, origin, destination, flight_date, flight_time, available_seats, managed_by) VALUES
(1, 'Karachi', 'Lahore', '2025-12-15', '08:30', 45, 6),
(2, 'Lahore', 'Islamabad', '2025-12-16', '14:20', 30, 10),
(3, 'Islamabad', 'Dubai', '2025-12-17', '21:10', 50, 6),
(4, 'Karachi', 'Doha', '2025-12-18', '09:15', 60, 10),
(5, 'Dubai', 'London', '2025-12-19', '02:45', 15, 6),
(6, 'Lahore', 'Jeddah', '2025-12-20', '06:00', 55, 10),
(7, 'Islamabad', 'Karachi', '2025-12-21', '18:30', 40, 6),
(8, 'Doha', 'Karachi', '2025-12-22', '11:25', 52, 10),
(9, 'London', 'Dubai', '2025-12-23', '16:00', 35, 6),
(10,'Karachi', 'Muscat', '2025-12-24', '13:40', 48, 10);


------------------------------------
-- INSERT DATA INTO RESERVATION
------------------------------------
INSERT INTO Reservation (reservation_id, reservation_date, seat_no, client_id, flight_id) VALUES
(1, '2025-12-01', 'A12', 1, 1),
(2, '2025-12-02', 'B07', 2, 2),
(3, '2025-12-02', 'C03', 3, 3),
(4, '2025-12-03', 'A10', 4, 4),
(5, '2025-12-04', 'D15', 5, 5),
(6, '2025-12-05', 'B14', 6, 6),
(7, '2025-12-06', 'F09', 7, 7),
(8, '2025-12-07', 'E01', 8, 8),
(9, '2025-12-08', 'C11', 9, 9),
(10,'2025-12-09', 'A01', 10, 10),
(11,'2025-12-10', 'B02', 1, 3),
(12,'2025-12-11', 'D05', 4, 1);


------------------------------------
-- INSERT DATA INTO PAYMENT
------------------------------------
INSERT INTO Payment (payment_id, amount, method, status, reservation_id) VALUES
(1, 15000.00, 'Credit Card', 'Paid', 1),
(2, 12000.00, 'Cash', 'Paid', 2),
(3, 98000.00, 'Debit Card', 'Paid', 3),
(4, 115000.00, 'Bank Transfer', 'Pending', 4),
(5, 220000.00, 'Credit Card', 'Paid', 5),
(6, 45000.00, 'Cash', 'Paid', 6),
(7, 38000.00, 'Debit Card', 'Paid', 7),
(8, 42000.00, 'Credit Card', 'Paid', 8),
(9, 150000.00, 'Bank Transfer', 'Failed', 9),
(10, 32000.00, 'Cash', 'Paid', 10),
(11, 45000.00, 'Debit Card', 'Paid', 11),
(12, 16000.00, 'Credit Card', 'Paid', 12);


---------------------------
-- READING INSERTED DATA
---------------------------

SELECT * FROM Client;
SELECT * FROM Staff;
SELECT * FROM Reservation;
SELECT * FROM Flight;
SELECT * FROM Payment;




------------------------
-- CREATING PROCEDURES
------------------------

-- ADDING A NEW CLIENT

CREATE PROCEDURE AddClient
    @client_id INT,
    @name VARCHAR(100),
    @email VARCHAR(150),
    @phone VARCHAR(20),
    @passport VARCHAR(50)
AS
BEGIN
    INSERT INTO Client (client_id, name, email, phone, passport)
    VALUES (@client_id, @name, @email, @phone, @passport);
END;




--  Add Reservation + Automatically Check Seat Availability

CREATE PROCEDURE AddReservation
    @reservation_id INT,
    @reservation_date DATE,
    @seat_no VARCHAR(10),
    @client_id INT,
    @flight_id INT
AS
BEGIN
    -- Check seat availability
    IF (SELECT available_seats FROM Flight WHERE flight_id = @flight_id) <= 0
    BEGIN
        RAISERROR ('No seats available on this flight.', 16, 1);
        RETURN;
    END;

    -- Insert reservation
    INSERT INTO Reservation (reservation_id, reservation_date, seat_no, client_id, flight_id)
    VALUES (@reservation_id, @reservation_date, @seat_no, @client_id, @flight_id);

    -- Reduce seat count
    UPDATE Flight
    SET available_seats = available_seats - 1
    WHERE flight_id = @flight_id;
END;



-- Add Payment for a Reservation

CREATE PROCEDURE AddPayment
    @payment_id INT,
    @amount DECIMAL(10,2),
    @method VARCHAR(50),
    @status VARCHAR(50),
    @reservation_id INT
AS
BEGIN
    INSERT INTO Payment (payment_id, amount, method, status, reservation_id)
    VALUES (@payment_id, @amount, @method, @status, @reservation_id);
END;



-- Assign Staff to Manage a Flight

CREATE PROCEDURE AssignStaffToFlight
    @flight_id INT,
    @staff_id INT
AS
BEGIN
    UPDATE Flight
    SET managed_by = @staff_id
    WHERE flight_id = @flight_id;
END;
GO



------------------------------
-- TESTING STORED PROCEDURES
------------------------------

EXEC AddClient 
    @client_id = 12,
    @name = 'Test User',
    @email = 'test12@user.com',
    @phone = '0300-0000000',
    @passport = 'PK000001';



SELECT * FROM Client;


EXEC AddReservation 
    @reservation_id = 13,
    @reservation_date = '2025-12-12',
    @seat_no = 'A05',
    @client_id = 3,
    @flight_id = 2;


SELECT * FROM Reservation;



SELECT * FROM FLIGHT WHERE flight_id = 2;



EXEC AddPayment
    @payment_id = 20,
    @amount = 120000.00,
    @method = 'Credit Card',
    @status = 'Paid',
    @reservation_id = 20;


SELECT * FROM Payment;


EXEC AssignStaffToFlight
    @flight_id = 5,
    @staff_id = 1;



SELECT * FROM FLIGHT;



------------------------------
-- Cancelling reservation
------------------------------

CREATE PROCEDURE CancelReservation
    @reservation_id INT
AS
BEGIN
    DECLARE @flight_id INT;

    SELECT @flight_id = flight_id FROM Reservation WHERE reservation_id = @reservation_id;

    DELETE FROM Reservation WHERE reservation_id = @reservation_id;

    UPDATE Flight
    SET available_seats = available_seats + 1
    WHERE flight_id = @flight_id;
END;


-- ADDING A NEW ATTRIBUTE

ALTER TABLE Reservation
ADD status VARCHAR(20) DEFAULT 'Active';


ALTER PROCEDURE CancelReservation
    @reservation_id INT
AS
BEGIN
    DECLARE @flight_id INT;

    -- Find the flight for this reservation
    SELECT @flight_id = flight_id
    FROM Reservation
    WHERE reservation_id = @reservation_id;

    -- If reservation does not exist
    IF @flight_id IS NULL
    BEGIN
        RAISERROR ('Reservation does not exist.', 16, 1);
        RETURN;
    END;

    -- 1) Mark payment as Refunded
    UPDATE Payment
    SET status = 'Refunded'
    WHERE reservation_id = @reservation_id;

    -- 2) Mark reservation as Cancelled
    UPDATE Reservation
    SET status = 'Cancelled'
    WHERE reservation_id = @reservation_id;

    -- 3) Restore seat count for that flight
    UPDATE Flight
    SET available_seats = available_seats + 1
    WHERE flight_id = @flight_id;
END;



-- Before
SELECT * FROM Reservation WHERE reservation_id = 6;
SELECT * FROM Payment    WHERE reservation_id = 6;
SELECT available_seats FROM Flight WHERE flight_id = 6;

EXEC CancelReservation @reservation_id = 6;

-- After
SELECT * FROM Reservation WHERE reservation_id = 6;   -- status should be 'Cancelled'
SELECT * FROM Payment    WHERE reservation_id = 6;    -- status should be 'Refunded'
SELECT available_seats FROM Flight WHERE flight_id = 6; -- should be +1

----------------------------------
-- Get Passenger List for a Flight
----------------------------------
CREATE PROCEDURE GetPassengersForFlight
    @flight_id INT
AS
BEGIN
    SELECT 
        c.client_id,
        c.name,
        c.passport,
        r.seat_no
    FROM Reservation r
    JOIN Client c ON r.client_id = c.client_id
    WHERE r.flight_id = @flight_id
      AND r.status = 'Active';
END;

SELECT * FROM Reservation;

UPDATE Reservation
SET status = 'Active'
WHERE status IS NULL;

SELECT * FROM Reservation;


SELECT r.reservation_id, r.seat_no, r.client_id, c.name, c.passport
FROM Reservation r
JOIN Client c ON r.client_id = c.client_id
WHERE r.flight_id = 3;


EXEC GetPassengersForFlight @flight_id = 3;

EXEC GetPassengersForFlight @flight_id = 10;




---------------------------
-- Chnging seat number
---------------------------

CREATE PROCEDURE ChangeSeat
    @reservation_id INT,
    @new_seat_no VARCHAR(10)
AS
BEGIN
    UPDATE Reservation
    SET seat_no = @new_seat_no
    WHERE reservation_id = @reservation_id;
END;

SELECT * FROM Reservation;

SELECT reservation_id, seat_no
FROM Reservation
WHERE reservation_id = 3;

EXEC ChangeSeat 
    @reservation_id = 3,
    @new_seat_no = 'A12';


SELECT reservation_id, seat_no
FROM Reservation
WHERE reservation_id = 3;


ALTER PROCEDURE ChangeSeat
    @reservation_id INT,
    @new_seat_no VARCHAR(10)
AS
BEGIN
    DECLARE @flight_id INT;

    -- Step 1: Get the flight of this reservation
    SELECT @flight_id = flight_id 
    FROM Reservation
    WHERE reservation_id = @reservation_id;

    IF @flight_id IS NULL
    BEGIN
        RAISERROR ('Reservation does not exist.', 16, 1);
        RETURN;
    END;

    -- Step 2: Check if the new seat is already taken by someone else
    IF EXISTS (
        SELECT 1
        FROM Reservation
        WHERE flight_id = @flight_id
          AND seat_no = @new_seat_no
          AND reservation_id <> @reservation_id
          AND status = 'Active'
    )
    BEGIN
        RAISERROR ('Seat already taken by another passenger on this flight.', 16, 1);
        RETURN;
    END;

    -- Step 3: Update seat
    UPDATE Reservation
    SET seat_no = @new_seat_no
    WHERE reservation_id = @reservation_id;

END;


SELECT * FROM Reservation;



EXEC ChangeSeat @reservation_id = 4, @new_seat_no = 'A01';
SELECT * FROM Reservation;





---------------------------------------

--              TRIGGERS

---------------------------------------


-- Prevent Overbooking
CREATE TRIGGER trg_PreventOverbooking
ON Reservation
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @flight_id INT;

    SELECT @flight_id = flight_id FROM inserted;

    IF (SELECT available_seats FROM Flight WHERE flight_id = @flight_id) <= 0
    BEGIN
        RAISERROR ('Cannot book reservation. Flight is fully booked.', 16, 1);
        RETURN;
    END

    -- If seats available → insert reservation
    INSERT INTO Reservation (reservation_id, reservation_date, seat_no, client_id, flight_id, status)
    SELECT reservation_id, reservation_date, seat_no, client_id, flight_id, status
    FROM inserted;

    -- Reduce seats
    UPDATE Flight
    SET available_seats = available_seats - 1
    WHERE flight_id = @flight_id;
END;




-- Auto-increase seats when reservation is cancelled

CREATE TRIGGER trg_IncreaseSeatsOnCancel
ON Reservation
AFTER UPDATE
AS
BEGIN
    IF UPDATE(status)
    BEGIN
        UPDATE Flight
        SET available_seats = available_seats + 1
        WHERE flight_id IN (
            SELECT flight_id
            FROM inserted
            WHERE status = 'Cancelled'
        );
    END
END;





-- Prevent Duplicate Seat Assignment on Same Flight

CREATE TRIGGER trg_PreventDuplicateSeat
ON Reservation
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Reservation r
        JOIN inserted i 
          ON r.flight_id = i.flight_id
         AND r.seat_no = i.seat_no
         AND r.reservation_id <> i.reservation_id
         AND r.status = 'Active'
    )
    BEGIN
        RAISERROR ('This seat is already assigned to another passenger on this flight.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;


-- Auto-set Reservation Status to Active


CREATE TRIGGER trg_DefaultReservationStatus
ON Reservation
AFTER INSERT
AS
BEGIN
    UPDATE Reservation
    SET status = 'Active'
    WHERE reservation_id IN (SELECT reservation_id FROM inserted)
      AND status IS NULL;
END;



-- Prevent Deleting a Reservation With a Payment

CREATE TRIGGER trg_NoDeletePaidReservation
ON Reservation
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deleted d
        JOIN Payment p ON p.reservation_id = d.reservation_id
    )
    BEGIN
        RAISERROR ('Cannot delete reservation with a payment record. Use CANCEL instead.', 16, 1);
        RETURN;
    END

    DELETE FROM Reservation
    WHERE reservation_id IN (SELECT reservation_id FROM deleted);
END;





---------------------------------------------------
-- Trigger Name: trg_PreventOverbooking
-- Purpose: Prevent booking when flight is full
---------------------------------------------------

UPDATE Flight SET available_seats = 0 WHERE flight_id = 1;
INSERT INTO Reservation (reservation_id, reservation_date, seat_no, client_id, flight_id)
VALUES (999, '2025-12-10', 'Z10', 1, 1);




-----------------------------------------------------------------
-- Trigger Name: trg_IncreaseSeatsOnCancel
-- Purpose: Auto-increase seats when reservation is cancelled
-----------------------------------------------------------------

SELECT available_seats FROM Flight WHERE flight_id = 3;
EXEC CancelReservation @reservation_id = 3;
SELECT available_seats FROM Flight WHERE flight_id = 3;


-----------------------------------------------------------------------------------------
-- Trigger Name: trg_PreventDuplicateSeat
-- Purpose: Prevent assigning the SAME SEAT to two active passengers on the SAME flight
-----------------------------------------------------------------------------------------

UPDATE Reservation
SET seat_no = 'A12'
WHERE reservation_id = 12;


-----------------------------------------------------------------------------
-- Trigger Name: trg_DefaultReservationStatus
-- Purpose: Auto-assign “Active” if status is NULL during insert
-----------------------------------------------------------------------------

INSERT INTO Reservation (reservation_id, reservation_date, seat_no, client_id, flight_id, status)
VALUES (998, '2025-12-10', 'F20', 2, 3, NULL);

SELECT reservation_id, status
FROM Reservation
WHERE reservation_id = 998;



----------------------------------------------------------------------------
-- Trigger Name: trg_NoDeletePaidReservation
-- Purpose: Prevent deletion of reservation if a payment exists
----------------------------------------------------------------------------

DELETE FROM Reservation WHERE reservation_id = 1;
SELECT * FROM Payment WHERE reservation_id = 1;











--------------------------------------
-- TRANSACTION BASED PROCEDURE
--------------------------------------

---------------------------------------------------
-- TRANSACTION PROCEDURE: BookReservationTxn
-- Books a seat + creates payment atomically
---------------------------------------------------
CREATE PROCEDURE BookReservationTxn
    @reservation_id   INT,
    @reservation_date DATE,
    @seat_no          VARCHAR(10),
    @client_id        INT,
    @flight_id        INT,
    @payment_id       INT,
    @amount           DECIMAL(10,2),
    @method           VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        -- Insert reservation (triggers will fire here)
        INSERT INTO Reservation (reservation_id, reservation_date, seat_no, client_id, flight_id, status)
        VALUES (@reservation_id, @reservation_date, @seat_no, @client_id, @flight_id, NULL);
        -- trg_PreventOverbooking, trg_PreventDuplicateSeat, trg_DefaultReservationStatus
        -- will run automatically. If they RAISERROR, control goes to CATCH and we ROLLBACK.

        -- Insert payment
        INSERT INTO Payment (payment_id, amount, method, status, reservation_id)
        VALUES (@payment_id, @amount, @method, 'Paid', @reservation_id);

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRAN;

        DECLARE @msg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@msg, 16, 1);
    END CATCH
END;



USE [AIR-LINE];
GO

-- Create database users
CREATE USER BookingUser1 FOR LOGIN BookingUser1;
CREATE USER BookingUser2 FOR LOGIN BookingUser2;

-- Create a role for booking operations
CREATE ROLE BookingRole;
GO

-- Add both users into the role
EXEC sp_addrolemember 'BookingRole', 'BookingUser1';
EXEC sp_addrolemember 'BookingRole', 'BookingUser2';
GO

-- Permissions for role
GRANT SELECT ON Flight       TO BookingRole;
GRANT SELECT ON Reservation  TO BookingRole;
GRANT SELECT ON Payment      TO BookingRole;
GRANT EXECUTE ON BookReservationTxn TO BookingRole;

UPDATE Flight SET available_seats = 5 WHERE flight_id = 1;
SELECT * FROM Reservation
WHERE flight_id = 1 AND seat_no = 'Z99';




EXEC BookReservationTxn
    @reservation_id   = 1001,
    @reservation_date = '2025-12-15',
    @seat_no          = 'Z99',      -- seat we are testing
    @client_id        = 1,
    @flight_id        = 1,
    @payment_id       = 1001,
    @amount           = 15000.00,
    @method           = 'Credit Card';




    ---------------------------------------------

    -- TRANSACTIONS 

    ---------------------------------------------

-- TRANSACTION WITH ROLLBACK


BEGIN TRAN;

INSERT INTO Reservation (reservation_id, reservation_date, seat_no, client_id, flight_id, status)
VALUES (2002, '2025-12-20', 'K02', 1, 2, 'Active');

-- Invalid reservation_id in Payment (should cause FK error)
INSERT INTO Payment (payment_id, amount, method, status, reservation_id)
VALUES (2002, 50000, 'Cash', 'Paid', 9999);  -- Does NOT exist

ROLLBACK;



-- TRANSACTION WITH COMMIT

BEGIN TRAN;

INSERT INTO Reservation (reservation_id, reservation_date, seat_no, client_id, flight_id, status)
VALUES (2001, '2025-12-20', 'K01', 3, 2, 'Active');

INSERT INTO Payment (payment_id, amount, method, status, reservation_id)
VALUES (2001, 50000, 'Credit Card', 'Paid', 2001);

COMMIT;

-- TEST CASE
EXEC BookReservationTxn
    @reservation_id   = 3001,
    @reservation_date = '2025-12-22',
    @seat_no          = 'M01',
    @client_id        = 1,
    @flight_id        = 1,
    @payment_id       = 3001,
    @amount           = 75000,
    @method           = 'Credit Card';


    SELECT * FROM Reservation;




-- TEST CASE

EXEC BookReservationTxn
    @reservation_id   = 3002,
    @reservation_date = '2025-12-22',
    @seat_no          = 'A12', -- already taken
    @client_id        = 2,
    @flight_id        = 1,
    @payment_id       = 3002,
    @amount           = 75000,
    @method           = 'Cash';


EXEC BookReservationTxn
    4002, '2025-12-30', 'X01', 1, 1, 4002, 12000, 'Card';



SELECT * FROM Reservation WHERE reservation_id IN ( 4001, 4002) ;



USE [AIR-LINE];
DROP USER IF EXISTS BookingUserA;
DROP USER IF EXISTS BookingUserB;
DROP ROLE IF EXISTS BookingAppRole;
GO


CREATE USER BookingUserA WITHOUT LOGIN;
CREATE USER BookingUserB WITHOUT LOGIN;


CREATE ROLE BookingAppRole;


EXEC sp_addrolemember 'BookingAppRole', 'BookingUserA';
EXEC sp_addrolemember 'BookingAppRole', 'BookingUserB';




-- Basic read permissions
GRANT SELECT ON Flight       TO BookingAppRole;
GRANT SELECT ON Reservation  TO BookingAppRole;
GRANT SELECT ON Payment      TO BookingAppRole;

-- Allow reservation & payment creation
GRANT INSERT ON Reservation TO BookingAppRole;
GRANT INSERT ON Payment     TO BookingAppRole;

-- Allow changing reservations (e.g., seat change)
GRANT UPDATE ON Reservation TO BookingAppRole;

-- Allow transaction-based booking procedure
GRANT EXECUTE ON BookReservationTxn TO BookingAppRole;
GO



EXECUTE AS USER = 'BookingUserA';
SELECT USER_NAME() AS CurrentUser;

-- Try allowed actions:
SELECT * FROM Flight;             -- Allowed
SELECT * FROM Reservation;        -- Allowed

-- Try booking using the stored procedure
EXEC BookReservationTxn
     @reservation_id   = 9001,
     @reservation_date = '2025-12-25',
     @seat_no          = 'Q10',
     @client_id        = 1,
     @flight_id        = 1,
     @payment_id       = 9001,
     @amount           = 90000,
     @method           = 'Credit Card';

-- Exit simulation
REVERT;


EXECUTE AS USER = 'BookingUserB';
SELECT USER_NAME() AS CurrentUser;

INSERT INTO Reservation (reservation_id, reservation_date, seat_no, client_id, flight_id, status)
VALUES (9002, '2025-12-26', 'Q11', 2, 1, 'Active');  -- Allowed

REVERT;


EXECUTE AS USER = 'BookingUserA';
SELECT USER_NAME() AS CurrentUser;

-- Try deleting a reservation (should FAIL)
DELETE FROM Reservation WHERE reservation_id = 1;

REVERT;
