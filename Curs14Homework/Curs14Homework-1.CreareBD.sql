--DROP TABLE OrderProduct;
--DROP TABLE Orders;
--DROP TABLE Product;
--DROP TABLE Category;
--DROP TABLE Employee;
--DROP TABLE Customer;

CREATE TABLE Customer
(
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	CustomerName VARCHAR(200) NOT NULL,
	CustomerEmail VARCHAR(100) NOT NULL
)

CREATE TABLE Employee
(
	EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeName VARCHAR(200) NOT NULL,
	EmployeeEmail VARCHAR(100) NOT NULL
)

CREATE TABLE Category
(
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName VARCHAR(200) NOT NULL,
	EmployeeID INT,
	CONSTRAINT FK_Category FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
)

CREATE TABLE Product
(
	ProductID INT IDENTITY(1,1) PRIMARY KEY,
	ProductName VARCHAR(200) NOT NULL,
	EntryPrice DECIMAL(10,2),
	CategoryID INT,
	CONSTRAINT FK_Product FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
)

CREATE TABLE Orders
(
	OrderID INT IDENTITY(1,1) PRIMARY KEY,
	OrderNumber INT NOT NULL,
	OrderDate DATE NOT NULL,
	OrderStatus VARCHAR(300),
	StatusDate DATE,
	CustomerID INT,
	TotalValue DECIMAL(10,2),
	CONSTRAINT FK_Order FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	CONSTRAINT CK_Order_OrderStatus CHECK (OrderStatus IN ('registered','approved','received','delivered','cancelled'))
)

CREATE TABLE OrderProduct
(
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity DECIMAL(10,2),
	SellingPrice DECIMAL(10,2),
	ValueOnOrder DECIMAL(10,2),
	CONSTRAINT PK_OrderProduct PRIMARY KEY(OrderID,ProductID),
	CONSTRAINT FK_OrderProduct_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	CONSTRAINT FK_OrderProduct_ProductID FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
)