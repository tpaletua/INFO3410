-- Write an IIF so that if a publisher has two or fewer titles they are labeled "Small Publisher", otherwise they are labeled "Large Publisher". Display the PubName, the number of titles, and the label
SELECT p.PubName, COUNT(b.ISBN) AS NumTitles, 
	IIF(COUNT(b.ISBN) <= 2,'Small Publisher', 'Large Publisher') AS PubSize
FROM Publishers p JOIN Books b
ON p.PubID = b.PubID
GROUP BY p.PubName;

--Write a query that evaluates the number of titles a seller offers. If a seller offers more than 12 titles, they are "Huge". If a seller offers between 8 and 12 titles, they are "Big". If a seller offers between 4 and 7 titles, they are "Medium". Otherwise, the seller is "Small". Display *ALL* book sellers, the count of titles (even if it's zero), and their size label.
SELECT s.SellerName, COUNT(bs.ISBN) AS NumTitles,
	CASE
		WHEN COUNT(bs.ISBN) > 12 THEN 'Huge'
		WHEN COUNT(bs.ISBN) >= 8 THEN 'Large'
		WHEN COUNT(bs.ISBN) >= 4 THEN 'Medium'
		ELSE 'Small'
	END AS SellerSize
FROM Sellers s LEFT JOIN BookSellers bs
ON s.SellerID = bs.SellerID
GROUP BY s.SellerName;

SELECT s.SellerName, COUNT(bs.ISBN) AS NumTitles,
IIF(COUNT(bs.ISBN) > 12, 'Huge',
	IIF(COUNT(bs.ISBN) >= 8, 'Large',
		IIF(COUNT(bs.ISBN) >= 4, 'Medium', 'Small'))) AS SellerSize
FROM Sellers s LEFT JOIN BookSellers bs
ON s.SellerID = bs.SellerID
GROUP BY s.SellerName;

--Relational Algebra, how many pages have I read, if I've read 50%, 75% or 100% of a book?
SELECT BookTitle, FLOOR(NumPages*0.5) AS FiftyPct,
	NumPages*0.75 AS SeventyFivePct,
	NumPages AS HundredPct
FROM Books;

SELECT getDate();
SELECT CURRENT_TIMESTAMP;

SELECT MONTH(getDate());




