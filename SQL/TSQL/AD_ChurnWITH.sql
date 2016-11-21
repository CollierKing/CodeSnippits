Use AdventureWorks2012;
/*
SELECT
 
 --convert(varchar(10),(g1.OrderDate),101) as dt,
year(g1.OrderDate) as dt,
 g1.CustomerID,
 g2.CustomerID
FROM Sales.SalesOrderHeader as g1
LEFT JOIN Sales.SalesOrderHeader as g2
ON g1.CustomerID = g2.CustomerID
AND year(g1.OrderDate) = dateadd(year,-1,g2.OrderDate)
order by 1


SELECT
 
 --convert(varchar(10),(g1.OrderDate),101) as dt,
year(g1.OrderDate) as dt,
round(100 * count(distinct g2.CustomerID) /
 count(distinct g1.CustomerID), 2) as Retention
FROM Sales.SalesOrderHeader as g1
LEFT JOIN Sales.SalesOrderHeader as g2
ON g1.CustomerID = g2.CustomerID
AND year(g1.OrderDate) = dateadd(year,-1,g2.OrderDate)
group by year(g1.OrderDate)
order by 1


With Monthly_Activity as (
	SELECT distinct month(OrderDate) as month1,
	CustomerID
	from Sales.SalesOrderHeader
)
SELECT this_month.month1,
	count(distinct this_month.CustomerID)
FROM Monthly_Activity last_month
--JOIN Monthly_Activity this_month                       --1st
LEFT JOIN Monthly_Activity this_month                   --2nd
	ON this_month.CustomerID = last_month.CustomerID
	and this_month.month1 = last_month.month1 - 1
where this_month.CustomerID is null
Group by this_month.month1
--order by this_month.month1 */