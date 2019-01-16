
DROP TABLE BookLibrary;
DROP TABLE LibraryNomenclator;
DROP TABLE Request;
DROP TABLE Member;
DROP TABLE AddressNomenclator;
DROP TABLE BookAuthor;
DROP TABLE Author;
DROP TABLE BookCategory;
DROP TABLE Category;
DROP TABLE Book;


CREATE TABLE Book
(
	BookID INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(200) UNIQUE NOT NULL,
	YearOfPublish INT NOT NULL,
	Price INT
)

CREATE TABLE Category
(
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	NameOfCategory VARCHAR(100) UNIQUE NOT NULL 
)

CREATE TABLE BookCategory
(
	BookCategoryID INT IDENTITY(1,1) PRIMARY KEY,
	BookID INT NOT NULL,
	CategoryID INT NOT NULL,
	CONSTRAINT FK_BookCategory_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
	CONSTRAINT FK_BookCategory_CategoryID FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
)

CREATE TABLE Author
(
	AuthorID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	BirthDate DATE
)

CREATE TABLE BookAuthor
(
	BookAuthorID INT IDENTITY(1,1) PRIMARY KEY,
	BookID INT NOT NULL,
	AuthorID INT NOT NULL,
	CONSTRAINT FK_BookAuthor_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
	CONSTRAINT FK_BookAuthor_AuthorID FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
)

CREATE TABLE AddressNomenclator
(
	AddressID INT IDENTITY(1,1) PRIMARY KEY,
	Street VARCHAR(100) NOT NULL,
	BuildingNumber INT,
	BuildingName VARCHAR(150),
	EntranceNumber CHAR(10),
	FloorNumber INT,
	ApartmentNumber INT,
	City VARCHAR(100) NOT NULL,
	PostalCode INT NOT NULL,
	County VARCHAR(100) NOT NULL,
	OtherDetails VARCHAR(200)
)

CREATE TABLE Member
(
	MemberID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	PermitNumber VARCHAR(30),
	AddressID INT NOT NULL,
	Gender VARCHAR(20) NOT NULL,
	PhoneNumber VARCHAR(50),
	EmailAddress VARCHAR(100),
	CONSTRAINT FK_Member_AddressID FOREIGN KEY (AddressID) REFERENCES AddressNomenclator(AddressID)
)

CREATE TABLE Request
(
	RequestID INT IDENTITY(1,1) PRIMARY KEY,
	MemberID INT NOT NULL,
	BookID INT NOT NULL,
	DateRequested DATE NOT NULL,
	DateReturned DATE,
	CONSTRAINT FK_Request_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
	CONSTRAINT FK_Request_MemberID FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
)

CREATE TABLE LibraryNomenclator
(
	LibraryID INT IDENTITY(1,1) PRIMARY KEY,
	NameOfLibrary VARCHAR(200) NOT NULL,
	AddressID INT NOT NULL,
	CONSTRAINT FK_Library_AddressID FOREIGN KEY (AddressID) REFERENCES AddressNomenclator(AddressID)
)

CREATE TABLE BookLibrary
(
	BookLibrID INT IDENTITY(1,1) PRIMARY KEY,
	LibraryID INT NOT NULL,
	BookID INT NOT NULL,
	Quantity INT NOT NULL,
	CONSTRAINT FK_BookLibrary_LibraryID FOREIGN KEY (LibraryID) REFERENCES LibraryNomenclator(LibraryID),
	CONSTRAINT FK_BookLibrary_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID)
)