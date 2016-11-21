Use AdventureWorks2012;

WITH RRate AS (
Select ProductID AS Y, round(1.0 * count(distinct B.SalesOrderID)/
	count(distinct CustomerID), 2) as reorder_rate
from Sales.SalesOrderDetail A
Join Sales.SalesOrderHeader B On
	A.SalesOrderID = B.SalesOrderID
Group by ProductID)
SELECT * FROM RRate
Order by 2 desc

-----------------------------------------------------------

WITH RRate AS (
Select ProductID, round(1.0 * count(distinct B.SalesOrderID)/
	count(distinct CustomerID), 2) as reorder_rate
from Sales.SalesOrderDetail A
Join Sales.SalesOrderHeader B On
	A.SalesOrderID = B.SalesOrderID
Group by ProductID
)
,
PRODUCTS AS (
Select ProductID, Name, ListPrice
FROM Production.Product
)
Select * FROM RRate
JOIN PRODUCTS
ON RRate.ProductID=PRODUCTS.ProductID
ORDER BY 2 DESC

-------------------------------------------------------------


Select A.ProductID, round(1.0 * count(distinct B.SalesOrderID)/
	count(distinct CustomerID), 2) as reorder_rate,
	Name, ListPrice
from Sales.SalesOrderDetail A
Join Sales.SalesOrderHeader B On
	A.SalesOrderID = B.SalesOrderID
Join Production.Product P On
	P.ProductID = A.ProductID
Group by Name, ListPrice, A.ProductID
Order by 2 Desc