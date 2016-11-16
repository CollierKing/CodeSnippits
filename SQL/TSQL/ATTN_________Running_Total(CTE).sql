Use AdventureWorks2012;

--------------------------------------------------
-------------------------------------------------
------------RE EXAMINE: NOT CUMULATIVE---------------



--here’s a simple query that computes total sales by salesperson over time:
/*
Select month(OrderDate),
SalesPersonID,
sum(subtotal)

from Sales.SalesOrderHeader
Group by month(OrderDate), SalesPersonID
order by 1, 3 desc
*/
--This is a great graph for measuring salesperson performance, but it makes you work hard to figure out whether the overall business is growing. There ought to be a way to see both the individual and total performance from the same query in the same graph.

--With individual_performance as (
--	select 
--		month(OrderDate) m,
--		SalesPersonID,
--		sum(subtotal) revenue
--	from sales.SalesOrderHeader
--	group by month(OrderDate), SalesPersonID
--)
--select m, salespersonid, revenue
--from individual_performance
--order by 1

--For now, this will give the same results. Note that we’ve named each column and made sure they’re selected in a certain order. That’ll matter as we proceed to the next step.
--Now let’s add in the totals:

With individual_performance as (
	select 
		month(OrderDate) m,
		SalesPersonID,
		sum(subtotal) revenue
	from sales.SalesOrderHeader
	where SalesPersonID IS null
	group by month(OrderDate), SalesPersonID
)
select m, salespersonid, revenue
from individual_performance
UNION ALL
	select
		m,
		SalesPersonID,
		sum(revenue)
	FROM individual_performance
	group by m, SalesPersonID
	order by 1, 3 desc

--The last line goes back to our individual_performance CTE a second time, and this time selects the sum of the revenue each month. Using union all, we append that to the end of the resulting table.
--note the 2 grand total lines returned at the top (1 came with table, the other we calculated)