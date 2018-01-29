--Connect to Database
USE WideWorldImporters;

SELECT COUNT(B.LineProfit) AS [Total Lint Count], MIN(B.LineProfit) AS Minimum, MAX(B.LineProfit) AS Maximum, AVG(B.LineProfit) AS Average, C.CustomerName, E.CustomerCategoryName, D.FullName
FROM Sales.Invoices AS A 
	INNER JOIN Sales.InvoiceLines AS B ON A.InvoiceID = B.InvoiceID
	INNER JOIN Sales.Customers AS C ON A.CustomerID = C.CustomerID
	INNER JOIN Application.People D ON A.SalespersonPersonID = D.PersonID
	INNER JOIN sales.CustomerCategories AS E ON C.CustomerCategoryID = E.CustomerCategoryID
GROUP BY GROUPING SETS (
 (E.CustomerCategoryName,C.CustomerName)
 ,(E.CustomerCategoryName)
 ,(C.CustomerName,D.FullName)
 ,(D.FullName)
 )
ORDER BY C.CustomerName,E.CustomerCategoryName, D.FullName
--HAVING MAX(B.LineProfit) > 5000


