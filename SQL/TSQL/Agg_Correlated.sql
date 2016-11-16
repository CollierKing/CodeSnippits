SELECT 

sales.salesorderheader.CustomerID,
count(buy_counts.ct)

FROM Sales.SalesOrderHeader
JOIN (
	SELECT distinct_buys.SalesOrderNumber,
	distinct_buys.SalesOrderNumber as ct
	FROM (
		SELECT DISTINCT SalesOrderNumber, CustomerID
		FROM Sales.SalesOrderHeader)
		AS distinct_buys
) As buy_counts
ON buy_counts.SalesOrderNumber=sales.salesorderheader.SalesOrderNumber
GROUP BY sales.salesorderheader.customerid
ORDER BY 2 desc

SELECT customerID,
count(distinct SalesOrderNumber)
from sales.SalesOrderHeader
group by customerid
order by 2 desc