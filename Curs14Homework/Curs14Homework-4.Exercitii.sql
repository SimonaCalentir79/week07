--4. Afisati toate produsele.
SELECT * FROM Product;

--5. Afisati toti clientii care au in continutul email-ului @wantsome.com.
SELECT * FROM Customer WHERE CustomerEmail LIKE '%@wantsome.com';

--6. Afisati suma preturilor pentru fiecare categorie in parte.
SELECT CategoryName, SUM(EntryPrice) AS TotalValoare 
	FROM Product p LEFT JOIN Category c ON p.CategoryID=c.CategoryID
	GROUP BY CategoryName;

--7. Afisati clientii care au mai mult de 1 comenzi.
SELECT CustomerName, COUNT(OrderNumber) AS TotalComenzi
	FROM Customer c LEFT JOIN Orders o ON c.CustomerID=o.CustomerID
	GROUP BY CustomerName
	HAVING COUNT(o.OrderNumber)>1;

--8. Creati un view care va afisa toti clientii si produsele comandate de acestia.
CREATE OR ALTER VIEW CustomerProducts AS
	SELECT CustomerName, p.ProductID, ProductName, OrderDate
	FROM Product p INNER JOIN OrderProduct op ON p.ProductID=op.ProductID
				   INNER JOIN Orders o ON op.OrderID=o.OrderID
				   INNER JOIN Customer c ON o.CustomerID=c.CustomerID
	GROUP BY CustomerName, p.ProductID, ProductName, OrderDate;

SELECT CustomerName, ProductName FROM CustomerProducts;

--9. Folositi view-ul de la punctul precedent pentru a afisa:
--		- Clientii care au comandat produse in primele trei zile ale anului.

SELECT CustomerName 
	FROM CustomerProducts 
	WHERE OrderDate BETWEEN '2019-01-01' AND '2019-01-03' 
	GROUP BY CustomerName;

--		- Clientii care au comandat produse dintr-o anumita categorie.

SELECT CustomerName, CategoryName 
		FROM CustomerProducts cp 
					INNER JOIN Product p ON cp.ProductID = p.ProductID
					INNER JOIN Category c ON p.CategoryID=c.CategoryID
		WHERE CategoryName = 'Category 3';

--10. Creati o procedura care va modifica statusul unui Order.
--	  Aceasta procedura va updata si LastModifiedDate.

CREATE OR ALTER PROCEDURE AlterOrderStatus (@OrderID INT, @OrderStatus VARCHAR(50))
AS
	UPDATE Orders SET OrderStatus=@OrderStatus, StatusDate=GETDATE() WHERE OrderID=@OrderID;
GO

EXEC AlterOrderStatus @OrderID = 1, @OrderStatus = "approved"

select * from Orders;

--11. Creati un raport (select cu group by) pentru a afisa vanzarile pentru fiecare produs in parte.

SELECT ProductName, SUM(ValueOnOrder) AS SalesValue
	FROM Product p INNER JOIN OrderProduct op ON p.ProductID=op.ProductID
	GROUP BY ProductName;

--12. Creati o functie care va calcula pretul total pentru o anumita comanda.

CREATE OR ALTER FUNCTION CalculeazaValoareComanda(@orderid INT)
RETURNS DECIMAL(10,2)
AS BEGIN
	DECLARE @ValueOfOrder DECIMAL(10,2)

	SELECT @ValueOfOrder = SUM(ValueOnOrder) FROM OrderProduct
		WHERE OrderID=@orderid
		RETURN (@ValueOfOrder)
END
GO

SELECT * FROM OrderProduct WHERE OrderID=3;
SELECT dbo.CalculeazaValoareComanda(3);


--13. Order Audit Table - OrderId, CustomerId, DateTime. - insert trigger
--DROP TABLE OrderProductAudit;

CREATE TABLE OrderProductAudit
(
	AuditID INT IDENTITY(1,1) PRIMARY KEY,
	OrderID INT,
	ProductID INT,
	AddedAt DATE,
	UpdatedAt DATE
)

CREATE OR ALTER TRIGGER trg_after_insert_OrderProductAudit ON OrderProduct
AFTER INSERT
AS BEGIN	
	INSERT INTO OrderProductAudit(OrderID,ProductID,AddedAt) 
	SELECT i.OrderID, i.ProductID, GETDATE()
	FROM inserted i
END
GO

--14. Order Audit - Cand order-ul are status approved = update pe coloana approvedat in audit table. (update trigger)

CREATE OR ALTER TRIGGER trg_after_update_OrderProductAudit ON OrderProduct
AFTER UPDATE
AS BEGIN	
	UPDATE opa
	SET opa.UpdatedAt=GETDATE()
	FROM OrderProductAudit opa
	JOIN inserted i on i.OrderID=opa.OrderID AND i.ProductID=opa.ProductID
END
GO

--UPDATE OrderProduct SET SellingPrice=30.00 WHERE OrderID=5 AND ProductID=9;

SELECT * FROM OrderProductAudit;