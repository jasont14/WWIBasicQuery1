--Connect to Database
USE WideWorldImporters;

--Select StockItem with value between $100 and $200
SELECT	A.StockItemName
,		A.Brand
,		A.UnitPrice
,		A.Barcode
FROM Warehouse.StockItems AS A
WHERE A.UnitPrice BETWEEN 100 AND 200;