--Contect to database
USE WideWorldImporters

--Get Sales by customer by month where year = 2015
SELECT SC.CustomerName, 
DATEPART(QUARTER,(SI.InvoiceDate)) AS QuarterDate,
MONTH(SI.InvoiceDate) AS [Invoice Month], 
FORMAT(SUM(IL.LineProfit),'C') AS [Total Profit For Month], SC.CustomerName

FROM Sales.Invoices AS SI
	INNER JOIN Sales.Customers AS SC ON SI.CustomerID = SC.CustomerID
	INNER JOIN Sales.InvoiceLines AS IL ON SI.InvoiceID = SI.InvoiceID

WHERE YEAR(SI.InvoiceDate) = '2016'
GROUP BY 
SC.CustomerName
, MONTH(SI.InvoiceDate)
, DATEPART(QUARTER,(SI.InvoiceDate))
ORDER BY 
SC.CustomerName,
[Invoice Month]


