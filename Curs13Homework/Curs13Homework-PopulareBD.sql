
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('De veghe in lanul de secara',2016,17);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Fluturi',2016,13);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Proza',2011,8);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Portretul lui Dorian Grey',2013,18);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Urzeala tronurilor',2017,30);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Numele vantului',2017,35);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Cartea vietii',2017,24);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Chimista',2016,33);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Baltagul',2014,22);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Harry Potter vol. 5',2017,64);
INSERT INTO Book(Title, YearOfPublish, Price) VALUES ('Puterea armelor',2017,35);

--select * from Book;

INSERT INTO Category(NameOfCategory) VALUES ('Clasici');
INSERT INTO Category(NameOfCategory) VALUES ('Fictiune');
INSERT INTO Category(NameOfCategory) VALUES ('Fantasy');
INSERT INTO Category(NameOfCategory) VALUES ('Thriller');
INSERT INTO Category(NameOfCategory) VALUES ('Aventura');

--select * from Book;
--select * from Category;

INSERT INTO BookCategory(BookID, CategoryID) VALUES (1,1);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (2,2);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (3,1);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (4,1);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (5,3);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (6,3);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (7,3);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (8,4);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (9,1);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (10,5);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (11,5);

--select * from BookCategory;

INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('J.D.','Salinger','1919-01-01');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('Irina','Binder','1975-12-08');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('Mihai','Eminescu','1850-01-15');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('Oscar','Wilde','1854-10-16');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('George R.R.','Martin','1948-09-20');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('Patrick','Rothfuss','1973-06-06');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('Deborah','Harkness','1965-04-05');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('Stephanie','Meyer','1973-12-24');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('Mihail','Sadoveanu','1880-11-05');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('J.K.','Rowling','1965-07-31');
INSERT INTO Author(FirstName, LastName, BirthDate) VALUES ('Joe','Abercrombie','1974-12-31');

--select * from Author;

INSERT INTO BookAuthor(BookID, AuthorID) VALUES (1,1);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (2,2);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (3,3);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (4,4);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (5,5);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (6,6);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (7,7);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (8,8);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (9,9);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (10,10);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (11,11);

--select * from BookAuthor;

INSERT INTO AddressNomenclator(Street, City, PostalCode, County) 
	VALUES ('Pacurari nr.4','Iasi',700511,'Iasi');
INSERT INTO AddressNomenclator(Street, City, PostalCode, County) 
	VALUES ('Petre Tutea nr.9','Iasi',700693,'Iasi');
INSERT INTO AddressNomenclator(Street, City, PostalCode, County) 
	VALUES ('Clinicilor nr.2','Cluj Napoca',400006,'Cluj');
INSERT INTO AddressNomenclator(Street, BuildingName, BuildingNumber, EntranceNumber, FloorNumber, ApartmentNumber, City, PostalCode, County) 
	VALUES ('Pacurari 4B','Bloc',581,'B',2,12,'Iasi',700511,'Iasi');
INSERT INTO AddressNomenclator(Street, BuildingName, BuildingNumber, EntranceNumber, FloorNumber, ApartmentNumber, City, PostalCode, County) 
	VALUES ('Independentei nr.2','Bloc',128,'A',1,5,'Iasi',700106,'Iasi');

--select * from AddressNomenclator;

INSERT INTO Member(FirstName,LastName,AddressID,Gender,PhoneNumber,EmailAddress) VALUES ('Daniel','Ionescu',4,'Male','0728 406394','daniel.popescu@gmail.com');
INSERT INTO Member(FirstName,LastName,AddressID,Gender,PhoneNumber,EmailAddress) VALUES ('Mihai','Popescu',5,'Male','0749 281504','mihai.popescu@yahoo.com');

--select * from Member;
--select * from Book;

INSERT INTO Request(MemberID,BookID,DateRequested,DateReturned) VALUES (1,2,'2017-05-15','2017-05-21');
INSERT INTO Request(MemberID,BookID,DateRequested,DateReturned) VALUES (1,6,'2017-09-21','2017-09-30');
INSERT INTO Request(MemberID,BookID,DateRequested) VALUES (1,8,'2017-12-18');
INSERT INTO Request(MemberID,BookID,DateRequested) VALUES (2,5,'2017-03-11');
INSERT INTO Request(MemberID,BookID,DateRequested,DateReturned) VALUES (2,8,'2017-06-14','2017-06-24');
INSERT INTO Request(MemberID,BookID,DateRequested,DateReturned) VALUES (1,11,'2017-08-12','2017-08-21');
INSERT INTO Request(MemberID,BookID,DateRequested) VALUES (1,9,'2017-10-13');

--select * from Request;

INSERT INTO LibraryNomenclator(NameOfLibrary,AddressID) VALUES ('Biblioteca Centrala Mihai Eminescu',1);
INSERT INTO LibraryNomenclator(NameOfLibrary,AddressID) VALUES ('Biblioteca Gheorghe Asachi',2);
INSERT INTO LibraryNomenclator(NameOfLibrary,AddressID) VALUES ('Biblioteca Centrala Universitara',3);

--select * from LibraryNomenclator;
--select * from Book;

INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,1,5);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,2,3);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,3,10);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,4,6);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,5,25);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,6,10);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,7,4);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,8,2);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (2,9,5);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (2,10,8);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (2,11,4);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (2,2,14);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (2,3,7);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (3,11,3);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (3,2,5);

--select * from BookLibrary;