--connect to database
USE WideWorldImporters;

--PurchaseOrder, Number, Date, Customer, Phone Number, FullName as Contact Person, EmailAddress As Contact Email
SELECT	A.OrderDate, B.SupplierName AS [Supplier], D.FullName AS [Supplier Contact], D.PhoneNumber
FROM	Purchasing.PurchaseOrders AS A 
		Inner Join Purchasing.Suppliers AS B ON A.SupplierID = B.SupplierID 
		Inner Join Application.People AS D ON B.SupplierID = D.PersonID
WHERE	A.OrderDate BETWEEN '1/1/2013' AND '1/31/2013'
ORDER BY OrderDate, Supplier;