--DROP TABLE LibraryMember;
--DROP TABLE Publisher;

CREATE TABLE Publisher
(
	PublisherID INT IDENTITY(1,1) PRIMARY KEY,
	NameOfPublisher VARCHAR(100) NOT NULL
)

ALTER TABLE Book ADD PublisherID INT;

ALTER TABLE Book ADD CONSTRAINT FK_Book_PublisherID FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID);

ALTER TABLE Book ADD HardCover CHAR(3);

CREATE TABLE LibraryMember
(
	--LibraryMemberID INT IDENTITY(1,1) PRIMARY KEY,
	LibraryID INT NOT NULL,
	MemberID INT NOT NULL,
	CONSTRAINT PK_LibraryMember PRIMARY KEY (LibraryID, MemberID),
	CONSTRAINT FK_LibraryMember_LibraryID FOREIGN KEY (LibraryID) REFERENCES LibraryNomenclator(LibraryID),
	CONSTRAINT FK_LibraryMember_MemberID FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
)

ALTER TABLE LibraryMember ADD PermitNumber VARCHAR(30) UNIQUE;

INSERT INTO LibraryMember VALUES (1,1,'AGX-40194');
INSERT INTO LibraryMember VALUES (1,2,'BCS-40329');
INSERT INTO LibraryMember VALUES (2,1,'FME-23043');

ALTER TABLE Member DROP COLUMN PermitNumber;

ALTER TABLE Request ADD LibraryID INT;

ALTER TABLE Request ADD CONSTRAINT FK_Request_LibraryID FOREIGN KEY (LibraryID) REFERENCES LibraryNomenclator(LibraryID); 

UPDATE Request SET LibraryID=1 where RequestID=1;
UPDATE Request SET LibraryID=1 where RequestID=2;
UPDATE Request SET LibraryID=1 where RequestID=3;
UPDATE Request SET LibraryID=1 where RequestID=4;
UPDATE Request SET LibraryID=1 where RequestID=5;
UPDATE Request SET LibraryID=2 where RequestID=6;
UPDATE Request SET LibraryID=2 where RequestID=7;