-- A carrier is a commercial trucking company offering shipments from one terminal to another
SELECT * FROM Carriers;
SELECT * FROM Trucks;
SELECT * FROM Terminals;
SELECT * FROM Shipments;
GO

--Populate the Carriers table
INSERT INTO Carriers
VALUES ('CR England'),
('Swift');
GO

--	**THESE ARE NOTES FOR MYSELF TO REFERENCE**
--UPDATE Carriers 
--SET CarrierName = 'CR England'
--WHERE CarrierName = 'Yellow';

--delete FROM Carriers
--where CarrierName = 'Yellow'


--Populate the Trucks table
INSERT INTO Trucks 
(VIN, Manufacturer, Model, DatePurchased, LastServiceDate, CarrierID, HaulingCap) --columns/attributes of the table Trucks
VALUES 
(123,'Mac','Streamliner', '2016-02-23', '2022-07-14', 1, NULL),
(456,'Ford','Roadmaster','1961-12-4','2022-4-13',3, 20);
GO

--populate the Terminals table
INSERT INTO Terminals (TerminalCode, TerminalCity, TerminalState, YearOpened, NumberOfDocks) --columns/attributes of the table Terminals
VALUES
('CTC', 'Chicago', 'IL', 1946, 18),
('PIH', 'Portland', 'OR', 1940, 12);
GO

--populate the Shipments table 
INSERT INTO Shipments (VIN, CarrierID, DepartCode, ArriveCode, DepartDateTime, ArriveDateTime) --columns/attributes of the table shipments
VALUES
(456, 3, 'CTC','PIH', '2022-10-22 07:55:00', '2022-10-22 22:47:00'),
(123, 1, 'PIH', 'CTC', '2022-07-29 22:52:00', '2022-07-31 01:08:00');
GO
-------------------------------------------------------------------



--Transfer ownership of all of CR England's trucks to Swift:
UPDATE Trucks 
SET CarrierID = 3 --Swift ID
WHERE CarrierID = 1; --CR England ID

--SELECT * (checking to see if the transfered occured)
--FROM Trucks
--WHERE CarrierID = 3;

--Transfer ownership of all CR England's shipments to Swift.
UPDATE Shipments
SET CarrierID = 3   -- Swift carrierID
WHERE CarrierID = 1; -- CR England carrierID

--Write a SQL statement to remove CR England from your database, as if it never existed. Place a descriptive comment above this query.

DELETE FROM Shipments --This deletes carrierID 1 whihch is CR England from the Shipments table
WHERE CarrierID = 1;

DELETE FROM Trucks --This deletes carrierID 1 which is CR England from the table Trucks
WHERE CarrierID = 1;