USE ADVENTUREWORKS2012

SELECT 
C.CustomerID
,Title
,FirstName
,LastName
,convert(varchar(10),SH.OrderDate,101)
,SUM(OrderQty) 'TOTAL SHORTS ORDERED'

FROM Sales.Customer C
	INNER JOIN Person.Person P ON C.PersonID = P.BusinessEntityID	
	INNER JOIN Sales.SalesTerritory ST ON C.TerritoryID = ST.TerritoryID
	INNER JOIN Person.CountryRegion CR ON ST.CountryRegionCode = CR.CountryRegionCode
	INNER JOIN Sales.SalesOrderHeader SH ON C.CustomerID = SH.CustomerID
	INNER JOIN Sales.SalesOrderDetail SD ON SD.SalesOrderID = SH.SalesOrderID
	INNER JOIN Production.Product PROD ON PROD.ProductID = SD.ProductID

WHERE CR.Name = 'United States'
	AND SH.OrderDate > DATEADD(MONTH, -12, '1/01/2006')
	AND SH.OrderDate < '10/01/2010'
	AND PROD.Name LIKE 'Men''s Sports Shorts, %'
GROUP BY C.CustomerID, Title, FirstName, LastName, SH.OrderDate
HAVING SUM(OrderQty) >= 10;