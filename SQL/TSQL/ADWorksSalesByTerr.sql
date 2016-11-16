SELECT

YEAR(SH.ShipDate)
,ST.TerritoryID
,SH.SalesOrderID
,ST.SalesYTD
,ST.[Group]
,SH.SubTotal

FROM
	Sales.SalesOrderHeader SH
	INNER JOIN Sales.SalesTerritory ST
	ON ST.TerritoryID=SH.TerritoryID
WHERE
	SH.SubTotal >
	(
		SELECT AVG(SubTotal)
		FROM Sales.SalesOrderHeader SOH
		WHERE YEAR(SOH.ShipDate) = YEAR(SH.ShipDate)
	) 
ORDER BY 6 DESC
		