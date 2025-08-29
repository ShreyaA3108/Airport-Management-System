-- ===========================================
-- Insert data into CITY table
-- ===========================================
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES
('DEL', 'Delhi', 'India'),
('BOM', 'Maharashtra', 'India'),
('BLR', 'Karnataka', 'India');

-- ===========================================
-- Insert data into AIRPORT table
-- ===========================================
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES
('Indira Gandhi International', 'Delhi', 'India', 'DEL'),
('Chhatrapati Shivaji International', 'Maharashtra', 'India', 'BOM'),
('Kempegowda International', 'Karnataka', 'India', 'BLR');

-- ===========================================
-- Insert data into AIRLINE table
-- ===========================================
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES
('AI', 'Air India', 'AIC'),
('6E', 'IndiGo', 'IGO');

-- ===========================================
-- Insert data into CONTAINS table
-- ===========================================
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES
('AI', 'Indira Gandhi International'),
('AI', 'Chhatrapati Shivaji International'),
('6E', 'Kempegowda International');

-- ===========================================
-- Insert data into FLIGHT table
-- ===========================================
INSERT INTO FLIGHT (FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID) VALUES
('AI101', 'DEL', 'BOM', '10:30', '08:00', 'OnTime', '2h30m', 'Domestic', 'None', 0, 'AI'),
('AI102', 'DEL', 'BLR', '12:00', '09:00', 'OnTime', '3h', 'Domestic', 'None', 0, 'AI'),
('6E201', 'BOM', 'BLR', '15:30', '13:00', 'Delayed', '2h30m', 'Domestic', 'None', 0, '6E');

-- ===========================================
-- Insert data into PASSENGER1 and PASSENGER2 tables
-- ===========================================
INSERT INTO PASSENGER1 (PID, PASSPORTNO) VALUES
(1, 'P123456'),
(2, 'P234567'),
(3, 'P345678');

INSERT INTO PASSENGER2 (PASSPORTNO, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX) VALUES
('P123456', 'John', 'M', 'Doe', 'Delhi, India', 9876543210, 30, 'M'),
('P234567', 'Alice', 'F', 'Smith', 'Mumbai, India', 9876543211, 28, 'F'),
('P345678', 'David', 'M', 'Brown', 'Bangalore, India', 9876543212, 45, 'M');

-- ===========================================
-- Insert data into PASSENGER3 (flights per passenger)
-- ===========================================
INSERT INTO PASSENGER3 (PID, FLIGHT_CODE) VALUES
(1, 'AI101'),
(2, 'AI101'),
(3, '6E201');

-- ===========================================
-- Insert data into EMPLOYEE1 and EMPLOYEE2
-- ===========================================
INSERT INTO EMPLOYEE1 (SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME) VALUES
(101, 'Rahul', 'M', 'Sharma', 'Delhi', 9123456780, 35, 'M', 'Pilot', 'Domestic', 'FullTime', 'Morning', 'Captain', 'Indira Gandhi International'),
(102, 'Sneha', 'F', 'Gupta', 'Mumbai', 9123456781, 30, 'F', 'GroundStaff', 'Domestic', 'FullTime', 'Evening', 'Manager', 'Chhatrapati Shivaji International');

INSERT INTO EMPLOYEE2 (JOBTYPE, SALARY) VALUES
('Pilot', 150000),
('GroundStaff', 70000);

-- ===========================================
-- Insert data into SERVES table (employee-passenger mapping)
-- ===========================================
INSERT INTO SERVES (SSN, PID, PASSPORTNO) VALUES
(101, 1, 'P123456'),
(101, 2, 'P234567'),
(102, 3, 'P345678');

-- ===========================================
-- Insert data into TICKET1, TICKET2, TICKET3, TICKET_PRICE_HISTORY
-- ===========================================
INSERT INTO TICKET1 (TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_TRAVEL, SEATNO, CLASS, DATE_OF_CANCELLATION, PID, PASSPORTNO) VALUES
(1001, 'DEL', 'BOM', TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-10','YYYY-MM-DD'), '12A', 'Economy', NULL, 1, 'P123456'),
(1002, 'DEL', 'BOM', TO_DATE('2025-09-02','YYYY-MM-DD'), TO_DATE('2025-09-10','YYYY-MM-DD'), '12B', 'Economy', NULL, 2, 'P234567');

INSERT INTO TICKET2 (DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) VALUES
(TO_DATE('2025-09-01','YYYY-MM-DD'), 'DEL', 'BOM', 'Economy', 5000),
(TO_DATE('2025-09-02','YYYY-MM-DD'), 'DEL', 'BOM', 'Economy', 5000);

INSERT INTO TICKET3 (DATE_OF_CANCELLATION, SURCHARGE) VALUES
(TO_DATE('2025-09-05','YYYY-MM-DD'), 500);
