-- ===========================================
-- File: Procedures.sql
-- Project: Airport Management System (DBMS Project)
-- Description: Contains all PL/SQL stored procedures
-- ===========================================

-- ===========================================
-- Procedure: DFWECONOMYPASSENGERS
-- Purpose: Display details of passengers in ECONOMY class
--          whose destination is DFW
-- ===========================================
CREATE OR REPLACE PROCEDURE DFWECONOMYPASSENGERS
AS
    CURSOR ECOPASSDETAILS IS
        SELECT al.AL_NAME,
               fl.FLIGHT_CODE,
               p2.FNAME,
               p2.LNAME,
               p2.PASSPORTNO,
               t.CLASS,
               t.DATE_OF_TRAVEL,
               t.DESTINATION,
               t.SOURCE,
               t.SEATNO,
               t.TICKET_NUMBER
        FROM Airline al, Flight fl, PASSENGER1 p1, PASSENGER2 p2, PASSENGER3 p3, TICKET1 t
        WHERE al.AIRLINEID = fl.AIRLINEID
          AND p1.PID = p3.PID
          AND p1.PASSPORTNO = p2.PASSPORTNO
          AND fl.FLIGHT_CODE = p3.FLIGHT_CODE
          AND t.PASSPORTNO = p2.PASSPORTNO
          AND t.CLASS = 'ECONOMY'
          AND t.DESTINATION = 'DFW';
          
    PASSDETAILS ECOPASSDETAILS%ROWTYPE;
BEGIN
    OPEN ECOPASSDETAILS;
    LOOP
        FETCH ECOPASSDETAILS INTO PASSDETAILS;
        EXIT WHEN ECOPASSDETAILS%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            PASSDETAILS.AL_NAME || '  ' ||
            PASSDETAILS.FLIGHT_CODE || '  ' ||
            PASSDETAILS.FNAME || '  ' ||
            PASSDETAILS.LNAME || '  ' ||
            PASSDETAILS.PASSPORTNO || '  ' ||
            PASSDETAILS.CLASS || '  ' ||
            PASSDETAILS.SOURCE || '  ' ||
            PASSDETAILS.SEATNO || '  ' ||
            PASSDETAILS.TICKET_NUMBER
        );
    END LOOP;
    CLOSE ECOPASSDETAILS;
END DFWECONOMYPASSENGERS;
/

-- ===========================================
-- Procedure: FLIGHTSBYSTATUS
-- Purpose: Display flights filtered by their status
-- Parameter: IN_STATUS (VARCHAR2) - flight status to filter
-- ===========================================
CREATE OR REPLACE PROCEDURE FLIGHTSBYSTATUS(IN_STATUS IN VARCHAR2)
AS
    CURSOR fSTATUS IS
        SELECT DISTINCT f.FLIGHT_CODE,
                        al.AL_NAME,
                        f.ARRIVAL,
                        f.DEPARTURE,
                        f.SOURCE,
                        f.DESTINATION,
                        f.STATUS,
                        f.FLIGHTTYPE
        FROM Airline al, Flight f
        WHERE al.AIRLINEID = f.AIRLINEID
          AND f.STATUS = IN_STATUS;
          
    FlightStatus fSTATUS%ROWTYPE;
BEGIN
    OPEN fSTATUS;
    LOOP
        FETCH fSTATUS INTO FlightStatus;
        EXIT WHEN fSTATUS%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            FlightStatus.FLIGHT_CODE || '  ' ||
            FlightStatus.AL_NAME || '  ' ||
            FlightStatus.ARRIVAL || '  ' ||
            FlightStatus.DEPARTURE || '  ' ||
            FlightStatus.SOURCE || '  ' ||
            FlightStatus.DESTINATION || '  ' ||
            FlightStatus.STATUS || '  ' ||
            FlightStatus.FLIGHTTYPE
        );
    END LOOP;
    CLOSE fSTATUS;
END FLIGHTSBYSTATUS;
/

-- Example execution:
BEGIN
    DFWECONOMYPASSENGERS;
    FLIGHTSBYSTATUS('OnTime');
END;
/

