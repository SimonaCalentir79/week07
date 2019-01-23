CREATE OR ALTER TRIGGER trg_after_insert_update_OrderProduct ON OrderProduct
AFTER UPDATE, INSERT
AS BEGIN
	UPDATE OrderProduct 
	SET ValueOnOrder = i.Quantity * i.SellingPrice 
	FROM inserted i INNER JOIN OrderProduct op ON i.OrderID=op.OrderID
	WHERE op.OrderID=i.OrderID AND op.ProductID=i.ProductID;

	DECLARE @ValueOfOrder DECIMAL(10,2)

	SELECT @ValueOfOrder = SUM(OP.ValueOnOrder) 
	FROM OrderProduct op INNER JOIN inserted i ON i.OrderID=op.OrderID
	WHERE op.OrderID=i.OrderID
	
	UPDATE Orders
	SET TotalValue = @ValueOfOrder, StatusDate=CURRENT_TIMESTAMP
	FROM inserted op RIGHT JOIN Orders o ON op.OrderID=o.OrderID
	WHERE o.OrderID=op.OrderID AND OrderStatus='approved'
END
GO

CREATE OR ALTER TRIGGER trg_after_delete_OrderProduct ON OrderProduct
AFTER DELETE
AS BEGIN	
	UPDATE Orders
	SET TotalValue = 0, StatusDate=NULL
	FROM deleted d INNER JOIN Orders o ON d.OrderID=o.OrderID
	WHERE o.OrderID=d.OrderID
END
GO

CREATE OR ALTER TRIGGER trg_after_update_Order ON Orders
AFTER UPDATE
AS BEGIN
	DECLARE @ValueOfOrder DECIMAL(10,2)

	SELECT @ValueOfOrder = SUM(op.ValueOnOrder) 
	FROM OrderProduct op INNER JOIN inserted i ON i.OrderID=op.OrderID
	WHERE op.OrderID=i.OrderID
	
	UPDATE Orders
	SET TotalValue = @ValueOfOrder, StatusDate=CURRENT_TIMESTAMP
	FROM inserted i RIGHT JOIN Orders o ON i.OrderID=o.OrderID
	WHERE o.OrderID=i.OrderID AND i.OrderStatus='approved'
END
GO

--SELECT * FROM ORDERS;
--UPDATE ORDERS SET ORDERSTATUS='approved' where orderid=4;