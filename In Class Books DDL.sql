-- Creation of an in class books database
CREATE DATABASE INFO3410_HW_TP;
GO

-- Using the in database created above
USE INFO3410_HW_TP;
GO

--Creating the publishers table in the books database
CREATE TABLE Publishers
	(PubID INT IDENTITY(1000, 100) PRIMARY KEY,
	 PubName VARCHAR(20)
	);
GO 

--Creating the authors table
CREATE TABLE Authors
	(AuID INT IDENTITY(1, 1) PRIMARY KEY,
	 AuFName VARCHAR(15),
	 AuLName VARCHAR(20)
	);
GO


--Creating the sellers table
CREATE TABLE Sellers
	(SellerID INT IDENTITY(100,10) PRIMARY KEY,
	 SellerName VARCHAR(25)
	);
GO

--Creating the Books table
CREATE TABLE Books
	(ISBN CHAR(14) PRIMARY KEY,
	 BookTitle VARCHAR(100),
	 BookPrice MONEY,
	 PubDate DATE,
	 NumPages INT,
	 PubID INT REFERENCES Publishers(PubID)
	);
GO

--Creating the BookAuthors table
CREATE TABLE BookAuthors
	(ISBN CHAR(14) REFERENCES Books(ISBN),
	 AuID INT REFERENCES Authors(AuID),
	 PRIMARY KEY (ISBN, AuID)
	);
GO

--Creating the BookSellers table
CREATE TABLE BookSellers
	(ISBN CHAR(14) REFERENCES Books(ISBN),
	 SellerID INT REFERENCES Sellers(SellerID),
	 PRIMARY KEY (ISBN, SellerID)
	);
GO

--SELECT * FROM Sellers; (view different tables)

