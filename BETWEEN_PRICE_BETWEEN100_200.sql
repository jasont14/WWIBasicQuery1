--Connect to Database
USE WideWorldImporters;

--Select StockItem with value between $100 and $200 using BETWEEN operator
SELECT	A.StockItemName
,		A.Brand
,		A.UnitPrice
,		A.Barcode
FROM Warehouse.StockItems AS A
WHERE A.UnitPrice BETWEEN 100 AND 200;

--Select StockItem with value between $100 and $200 using between <, =, > operator
SELECT	A.StockItemName
,		A.Brand
,		A.UnitPrice
,		A.Barcode
FROM Warehouse.StockItems AS A
WHERE (A.UnitPrice >= 100
		AND A.UnitPrice <= 200);
