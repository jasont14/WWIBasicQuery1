--Connect to database
USE WideWorldImporters

--Sample Data for Products Not Picked.
--Select Customer Name, PO, and Contact Information, Order Date, Expected Delivery Date to allow quick report and call to customer
SELECT	B.CustomerName AS [Customer Name]
,		A.CustomerPurchaseOrderNumber AS [Customer PO]
,		C.FullName AS [Customer Contact]
,		C.PhoneNumber AS [Contact Phone]
,		C.EmailAddress AS [Contact eMail]
,		A.OrderDate AS [Order Date]
,		A.ExpectedDeliveryDate AS [Expected ON]

FROM	Sales.Orders AS A 
		INNER JOIN Sales.Customers as B ON A.CustomerID = B.CustomerID
		INNER JOIN Application.People as C ON B.PrimaryContactPersonID = C.PersonID

WHERE	A.OrderID IN (SELECT SA.OrderID  --This nested query returns a list of OrderID's where product had not been recorded as picked.
						FROM Sales.Orders as SA
						WHERE SA.PickingCompletedWhen IS NULL) AND 
		A.ExpectedDeliveryDate < '1/25/2014' --Would use GETDATE(), Could declare this as a variable @CurrentDate = GETDATE()

ORDER BY B.CustomerName, A.ExpectedDeliveryDate;  --Sort by customer name. One could provide intel all at once.
