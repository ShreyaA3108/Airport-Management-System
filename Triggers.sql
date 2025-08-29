-- ===========================================
-- File: Triggers.sql
-- Project: Airport Management System (DBMS Project)
-- Description: Contains all PL/SQL triggers for the project
-- Author: <Your Name>
-- ===========================================

-- ===========================================
-- Trigger: DELAYEDFLIGHTS
-- Purpose: After inserting a flight, if its status is 'Delayed',
--          add it to the delayed_flights table with report_time as current time
-- ===========================================
CREATE OR REPLACE TRIGGER DELAYEDFLIGHTS
AFTER INSERT ON FLIGHT
FOR EACH ROW
BEGIN
    IF :NEW.STATUS = 'Delayed' THEN
        INSERT INTO delayed_flights (FLIGHT_CODE, SOURCE, DESTINATION, AIRLINEID, report_time)
        VALUES (:NEW.FLIGHT_CODE, :NEW.SOURCE, :NEW.DESTINATION, :NEW.AIRLINEID, SYSDATE);
    END IF;
END;
/

-- ===========================================
-- Trigger: UPDATEDSalary
-- Purpose: Automatically update salary based on JOBTYPE during insert or update
-- ===========================================
CREATE OR REPLACE TRIGGER UPDATEDSalary
BEFORE INSERT OR UPDATE OF SALARY ON EMPLOYEE2
FOR EACH ROW
BEGIN
    CASE :NEW.JOBTYPE
        WHEN 'Administrative Support' THEN
            :NEW.SALARY := :NEW.SALARY + (:NEW.SALARY * 0.10);
        WHEN 'ENGINEER' THEN
            :NEW.SALARY := :NEW.SALARY + (:NEW.SALARY * 0.05);
        WHEN 'TRAFFIC MONITOR' THEN
            :NEW.SALARY := :NEW.SALARY + (:NEW.SALARY * 0.25);
        WHEN 'AIRPORT AUTHORITY' THEN
            :NEW.SALARY := :NEW.SALARY + (:NEW.SALARY * 0.45);
    END CASE;
END;
/

-- ===========================================
-- Trigger: TICKET_PRICE_HISTORY
-- Purpose: Before updating the price in TICKET2,
--          store the old price in TICKET_PRICE_HISTORY
-- ===========================================
CREATE OR REPLACE TRIGGER TICKET_PRICE_HISTORY
BEFORE UPDATE OF PRICE ON TICKET2
FOR EACH ROW
BEGIN
    INSERT INTO TICKET_PRICE_HISTORY (DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE)
    VALUES (:OLD.DATE_OF_BOOKING, :OLD.SOURCE, :OLD.DESTINATION, :OLD.CLASS, :OLD.PRICE);
END;
/
