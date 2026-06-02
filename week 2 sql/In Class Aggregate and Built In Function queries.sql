--Some common aggregate functions
SELECT COUNT(ISBN) AS NumberOfBooks,
		AVG(NumPages) AS AverageBookLength,
		AVG(BookPrice) AS AverageBookPrice,
		MIN(BookPrice) AS LeastExpensiveBook,
		MAX(BookPrice) AS MostExpensiveBook,
		MIN(NumPages) AS ShortestBook,
		MAX(NumPages) AS LongestBook,
		STDEV(BookPrice) AS BookPriceDeviation,
		ROUND(AVG(BookPrice), 2) AS RoundedAvgBookPrice
FROM Books;

--Relational algebra
--Calculate the sales tax and the price plus tax
SELECT *, BookPrice AS TheBookPrice, 
	Round(BookPrice*0.0685, 2) AS SalesTaxAmt,
	--Calculating the total price the "bad way"
	Round(BookPrice + (BookPrice*0.0685), 2) AS TotalPrice,
	--Calculating the total price the "good way"
	Cast(Round(BookPrice*1.0685,2) as float) AS AltTotalPrice,
	CEILING(BookPrice*1.0685) AS RaisedPrice,
	FLOOR(BookPrice*1.0685) AS LoweredPrice
FROM Books;

--Conditional Logic
SELECT BookTitle, NumPages, 
	IIF(NumPages >= 500, 'Long Book', 'Short Book') AS BLen 
FROM Books;

--Nested IIF example
SELECT BookTitle, NumPages, 
	IIF(NumPages >= 600, 'Long Book', IIF(NumPages >= 400, 'Medium Book', 'Short Book')) AS BLen 
FROM Books;

-- A conditional logic CASE statement to classify books into five categories. 1-200, 201-400, 401-600, 601-800, 801+
SELECT BookTitle, NumPages,
	CASE
		WHEN NumPages <= 200 THEN 'Very Short Book'
		WHEN NumPages <= 400 THEN 'Short Book'
		WHEN NumPages <= 600 THEN 'Medium Book'
		WHEN NumPages <= 800 THEN 'Long Book'
		ELSE 'Very Long Book'
	END AS 'Book Length'
FROM Books;

--Write a query using a case statement such that books under $10 are "Inexpensive", books that are $10 to $19.99 are "Affordable", books that are $20 to $39.99 are "More Expensive", books that are $40 or more are "Very Expensive".
SELECT *, 
	CASE
		WHEN BookPrice >= 40 THEN 'Very Expensive'
		WHEN BookPrice >= 20 THEN 'More Expensive'
		WHEN BookPrice >= 10 THEN 'Affordable'
		ELSE 'Inexpensive'
	END AS 'Price Category'
FROM Books;