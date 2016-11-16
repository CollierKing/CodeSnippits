Use AdventureWorks2012;

----Daily trailing average---change between " " precedeing to set trail distance
---Distinct User Count



SELECT
OrderDate,
sum(subtotal) as Day_Rev,
avg(sum(subtotal)) over (
	order by OrderDate
	rows between 7 preceding and current row 
) as trail_rev
from Sales.SalesOrderHeader
group by OrderDate


SELECT
OrderDate,
count(distinct CustomerID) as day_cnt,
avg(count(distinct CustomerID)) over (
	order by OrderDate
	rows between 30 preceding and current row
) as trail_avg_cnt
from Sales.SalesOrderHeader
group by OrderDate



-------------------------------
-----Without Windowing (CTE only)-----Running Revenue Total of SalesREps Divided by 12 for yearly average

With individual_performance as (
	select 
		month(OrderDate) m,
		SalesPersonID,
		sum(subtotal) revenue,
		sum(subtotal) / 12 as avg
	from sales.SalesOrderHeader
	where SalesPersonID is NULL
	and OrderDate like '%2007%'
	group by month(OrderDate), SalesPersonID
)
select m, salespersonid, revenue, avg
from individual_performance  --dont need the union necessarily
UNION ALL
select
	m,
	SalesPersonID,
	sum(revenue),
	avg
FROM individual_performance
group by m, SalesPersonID, avg
order by 1, 3 desc