INSERT INTO Customer(CustomerName,CustomerEmail) VALUES ('Customer 1','customer1@wantsome.com');
INSERT INTO Customer(CustomerName,CustomerEmail) VALUES ('Customer 2','customer2@gmail.com');
INSERT INTO Customer(CustomerName,CustomerEmail) VALUES ('Customer 3','customer3@yahoo.com');
INSERT INTO Customer(CustomerName,CustomerEmail) VALUES ('Customer 4','customer4@wantsome.com');
INSERT INTO Customer(CustomerName,CustomerEmail) VALUES ('Customer 5','customer5@wantsome.com');
INSERT INTO Customer(CustomerName,CustomerEmail) VALUES ('Customer 5','customer5@email.ro');

INSERT INTO Employee(EmployeeName,EmployeeEmail) VALUES ('Employee 1','employee1@gmail.com');
INSERT INTO Employee(EmployeeName,EmployeeEmail) VALUES ('Employee 2','employee2@yahoo.com');
INSERT INTO Employee(EmployeeName,EmployeeEmail) VALUES ('Employee 3','employee3@email.com');
INSERT INTO Employee(EmployeeName,EmployeeEmail) VALUES ('Employee 4','employee4@hotmail.com');
INSERT INTO Employee(EmployeeName,EmployeeEmail) VALUES ('Employee 5','employee5@gmail.com');

INSERT INTO Category(CategoryName,EmployeeID) VALUES ('Category 1',1);
INSERT INTO Category(CategoryName,EmployeeID) VALUES ('Category 2',3);
INSERT INTO Category(CategoryName,EmployeeID) VALUES ('Category 3',2);
INSERT INTO Category(CategoryName,EmployeeID) VALUES ('Category 4',2);
INSERT INTO Category(CategoryName,EmployeeID) VALUES ('Category 5',3);

INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 01',15.25,2);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 02',17.20,1);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 03',14.00,3);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 04',10.25,4);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 05',13.83,5);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 06',19.67,1);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 07',14.83,2);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 08',17.65,3);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 09',25.57,4);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 10',12.14,4);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 11',21.41,5);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 12',27.63,1);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 13',32.85,1);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 14',10.57,3);
INSERT INTO Product(ProductName, EntryPrice, CategoryID) VALUES ('Product 15',42.00,5);

INSERT INTO Orders(OrderNumber,OrderDate,OrderStatus,CustomerID) VALUES (201901,'2019-01-01','registered',1);
INSERT INTO Orders(OrderNumber,OrderDate,OrderStatus,CustomerID) VALUES (201902,'2019-01-01','registered',2);
INSERT INTO Orders(OrderNumber,OrderDate,OrderStatus,CustomerID) VALUES (201903,'2019-01-02','registered',3);
INSERT INTO Orders(OrderNumber,OrderDate,OrderStatus,CustomerID) VALUES (201904,'2019-01-03','registered',2);
INSERT INTO Orders(OrderNumber,OrderDate,OrderStatus,CustomerID) VALUES (201905,'2019-01-03','registered',4);
INSERT INTO Orders(OrderNumber,OrderDate,OrderStatus,CustomerID) VALUES (201906,'2019-01-04','registered',2);
INSERT INTO Orders(OrderNumber,OrderDate,OrderStatus,CustomerID) VALUES (201907,'2019-01-05','approved',1);

INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (1,1,2,18.50);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (1,2,3,22.50);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (1,3,1,19.00);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (2,1,2,18.50);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (2,5,2,17.00);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (2,7,1,19.25);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (3,4,2,18.50);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (3,6,2,23.56);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (3,10,1,19.25);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (4,8,1,19.50);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (4,14,2,12.00);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (4,12,4,29.85);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (5,13,2,38.50);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (5,9,3,27.95);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (5,11,1,26.25);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (6,14,2,12.00);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (6,10,4,19.25);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (7,12,2,29.85);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (7,3,3,19.00);
INSERT INTO OrderProduct(OrderID,ProductID,Quantity,SellingPrice) VALUES (7,5,1,17.00);

--UPDATE OrderProduct SET SellingPrice=30.00 WHERE OrderID=5 AND ProductID=9;
--select * from OrderProduct;
--select * from Orders;
--delete from OrderProduct;

--select * from Customer;
--select * from Employee;
--select * from Category;
--select * from Product;