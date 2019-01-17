
/*Ex.1: Names of all libraries from Iasi*/
select NameOfLibrary, City from LibraryNomenclator ln left join AddressNomenclator an on ln.AddressID=an.AddressID where City='Iasi';

/*Ex.2: Names of all members from ‘Biblioteca Centrala Mihai Eminescu’*/
select FirstName, LastName from Member where MemberID in 
	(select MemberID from LibraryMember where LibraryID in
	(select LibraryID from LibraryNomenclator where NameOfLibrary='Biblioteca Centrala Mihai Eminescu') );

/*Ex.3: Names of all fantasy books from letter ‘P’ (Title begins with ‘P’) in ‘Biblioteca Centrala Mihai Eminescu’*/
select Title from Book where BookID in
	(select BookID from BookCategory bc inner join Category c on bc.CategoryID=c.CategoryID where c.NameOfCategory='Fantasy');

/*Ex.4: Names of all books borrowed and not returned by Daniel Ionescu from ‘Biblioteca Centrala Mihai Eminescu’*/
select Title from Book b inner join Request r on b.BookID=r.BookID 
	where b.BookID in (select BookID from Request where DateReturned is null) 
	and r.MemberID in (select MemberID from Member where FirstName='Daniel' and LastName='Ionescu') 
	and r.LibraryID in (select LibraryID from LibraryNomenclator where NameOfLibrary='Biblioteca Centrala Mihai Eminescu');

/*Ex.5: Category name and number of books from each category in ‘Biblioteca Centrala Mihai Eminescu’*/
select NameOfCategory, count (BookID) as NumberOfBooks 
	from BookCategory bc 
		inner join Category c on bc.CategoryID=c.CategoryID 
	group by c.NameOfCategory;

/*Ex.6: Name author of the most expensive book borrowed by Mihai Popescu from ‘Biblioteca Centrala Mihai Eminescu’*/
select MAX(Price)/*, Title, FirstName, LastName*/
	from BookAuthor ba 
		inner join Book b on ba.BookID=b.BookID
		inner join Author a	on ba.AuthorID=a.AuthorID
	where ba.BookID in (select r.BookID from Request r inner join Member m on r.MemberID=m.MemberID 
						inner join LibraryNomenclator l on r.LibraryID=l.LibraryID 
						where m.FirstName='Mihai' and m.LastName='Popescu'
						and l.NameOfLibrary='Biblioteca Centrala Mihai Eminescu');
	/*group by Title, FirstName, LastName;*/

/*Ex.7: Total number of copies from ‘Fluturi’ in Iasi*/
select Title, SUM(Quantity) as TotalCopiesInIasi
	from BookLibrary bl
		inner join Book b on bl.BookID=b.BookID
		inner join LibraryNomenclator ln on bl.LibraryID=ln.LibraryID
	where ln.AddressID in (select AddressID from AddressNomenclator where City='Iasi')
	and b.Title='Fluturi'
	group by Title;