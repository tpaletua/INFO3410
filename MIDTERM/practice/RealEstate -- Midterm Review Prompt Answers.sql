--Write a SQL statement that will add a new homeowner to the Owners table.
INSERT INTO Owners
VALUES ('Bob Jones');

--Write a SQL statement to add a new home to the Homes table, where the owner is unknown at this time.
INSERT INTO Homes (HomeAddress, HomeCity, HomeState)
VALUES ('123 Fake Street', 'Anytown', 'MT');

--Write a query to display each home owner name, the home address, city and state. Ensure the new homeowner you just added is included in the results. Sort alphabetically by home owner name.
SELECT o.OwnerName, h.HomeAddress, h.HomeCity, h.HomeState
FROM Owners o LEFT JOIN Homes h
ON h.OID = o.OID
ORDER BY o.OwnerName;

--Modify the query above to also show the home with no owner.
SELECT o.OwnerName, h.HomeAddress, h.HomeCity, h.HomeState
FROM Owners o FULL JOIN Homes h
ON h.OID = o.OID
ORDER BY o.OwnerName;

--Write a query to list the realtor name, the name of the month (as SaleMonth), the year (as SaleYear) and the number of listings that each realtor had for that month and year. Restrict the results to not show months when a realtor only had one home listed. Only include homes listed for sale in the year 2019. Sort alphabetically be realtor name and put each realtor's best month (most listings) at the top of their list.
SELECT r.RealtorName, DATENAME(MONTH, f.ListDate) AS SaleMonth, YEAR(f.ListDate) AS SaleYear, COUNT(f.ListID) AS NumberOfListings
FROM Realtors r JOIN ForSale f
ON r.RID = f.RID
WHERE YEAR(f.ListDate) = 2019
GROUP BY r.RealtorName, DATENAME(MONTH, f.ListDate), YEAR(f.ListDate)
HAVING COUNT(f.ListID) > 1
ORDER BY r.RealtorName, COUNT(f.ListID) DESC;