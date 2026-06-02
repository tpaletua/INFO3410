-- A query to show the book title, price, number of pages and publisher ID for all books published since January 1, 2005
SELECT BookTitle, BookPrice, NumPages, PubID
FROM Books
WHERE PubDate >= '1/1/2005';
--WHERE YEAR(PubDate) >= 2005;

-- A query to show the ISBN, book title, and the name of the company that published the book
SELECT ISBN, BookTitle, PubName
FROM Books JOIN Publishers
ON Publishers.PubID = Books.PubID;

-- A query to *only* include books over $25. Show the book title, price and publication date. Put the most expensivve book at the top of the results, and name the book price column Cost of the Book
SELECT BookTitle, BookPrice AS 'Cost of the Book', PubDate
FROM Books
WHERE BookPrice > 25
ORDER BY BookPrice DESC;

-- A query to display the name of the author in Last Name, First Name format (in a single column) and the the book title for all books. Sort the results alphabetically by author.
SELECT CONCAT(a.AuLName, ', ', a.AuFName) AS 'Author Name', b.BookTitle
FROM Authors a JOIN BookAuthors ba
ON a.AuID = ba.AuID JOIN Books b
ON b.ISBN = ba.ISBN
ORDER BY 1, 2;

-- Aggregate functions
-- A query to list the name of the publisher and the number of book each has published. Sort from most to least. Label the count "Number of books"
SELECT p.PubName, COUNT(b.ISBN) AS 'Number of books'
FROM Publishers p JOIN Books b
ON p.PubID = b.PubID
GROUP BY p.PubID, p.PubName
ORDER BY 2 DESC;

--Adding an author with no books and a publisher with no books
INSERT INTO Authors
VALUES ('Dr.', 'Seuss');

INSERT INTO Publishers
VALUES ('Hallmark');

SELECT * FROM Publishers;
SELECT * FROM Books;

-- A query to display all publishers (even if they don't have any books in our database), all authors (even if they don't have any books in our database), and a count of books and average prices.
SELECT p.PubName, CONCAT(a.AuFName, ' ', a.AuLName) AS AuName, COUNT(b.ISBN) AS BookCount, AVG(b.BookPrice) AS AveragePrice
FROM Publishers p LEFT JOIN Books b
ON p.PubID = b.PubID LEFT JOIN BookAuthors ba
ON b.ISBN = ba.ISBN FULL JOIN Authors a
ON a.AuID = ba.AuID
GROUP BY p.PubName, a.AuFName, a.AuLName
ORDER BY 3;

--A query that shows the seller's name and the number of titles that they sell, but only include sellers that offer at least ten different book titles
SELECT s.SellerName, COUNT(b.ISBN) AS NumTitles
FROM Sellers s JOIN BookSellers bs
ON s.SellerID = bs.SellerID JOIN Books b
ON b.ISBN = bs.ISBN
WHERE b.BookPrice > 25
GROUP BY s.SellerName
HAVING COUNT(b.ISBN) >= 5;

--Without using a JOIN, a query to list all book data for books published by Scholastic, Disney or Tor Science Fiction (We'll call youth fiction books)
SELECT *
FROM Books
WHERE PubID IN (1500, 1100, 1000);

--Same query as above for books *not* published by YA Fiction publishers
SELECT *
FROM Books
WHERE PubID NOT IN (1500, 1100, 1000);