--1. Add “Reliable Trucking” to the list of carrier names.
SELECT * FROM Carriers; --view carriers table

INSERT INTO Carriers
VALUES ('Reliable Trucking');
GO

--2. Change “Simon” to be “Simon Trucking”.
SELECT * FROM Carriers; --view carriers table

UPDATE Carriers --Changing the carriers table
SET CarrierName = 'Simon Trucking' --the new name  
WHERE CarrierName = 'Simon'; --what name you are wanting to change
GO

--3. Any shipments now scheduled, or that may be scheduled in the future, originating at SFC in San Francisco and ending in New York (NYC) after October of this year have been cancelled. Write SQL that will remove any shipments that match this criteria, ensuring that your SQL will not only work to remove the correct shipment(s) now, but would also remove any shipments added later between these two terminals after October. In other words, every time your SQL query is run now or in the future, it should remove any shipments from SFC to NYC if they are scheduled to occur after October of this year. Your SQL should not remove shipments from San Francisco to New York that have already been completed, if any.
SELECT * FROM Shipments; --view carriers table

DELETE FROM Shipments --what table you want to delete from
WHERE DepartCode = 'SFC' --what column to find the 
	

--???

--4. List each carrier name with a count of the number of shipments (past, present or future), even if the carrier doesn't have any shipments in the database. Sort from most shipments to fewest. Alias the count column as "Shipment Count".

select 