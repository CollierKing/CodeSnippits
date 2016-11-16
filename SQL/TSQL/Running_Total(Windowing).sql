Use AdventureWorks2012;

----------Cumulative Metrics---------------
---------------Window Functions------------
--Here we’ll compute a running sum of all revenue.

SELECT
	day,
	sum(spend) over (
		order by day asc
		rows between unbounded preceding and current row
)
FROM (
	SELECT
		OrderDate as day,
		sum(subtotal) as spend
	FROM Sales.SalesOrderHeader
	GROUP BY OrderDate
) daily_revenue

--The inner query defines a simply daily sum of all revenue. 
--The outer query makes it cumulative, summing all the values between the first day and the current day.
--That’s accomplished with rows between unbounded preceding and current row. 
--For each row, unbounded preceding begins the sum at the beginning of the table, 
--and current row halts the sum at, well, the current row.