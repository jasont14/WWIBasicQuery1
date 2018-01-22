--Connect to database
USE WideWorldImporters;

--Select Name of all those who have last name like "Cart"
SELECT	A.FullName
,		A.PreferredName
,		A.LogonName
,		A.EmailAddress
FROM Application.People AS A
WHERE A.FullName LIKE '% Cart%'; --Assume last name is separated by a space between first name