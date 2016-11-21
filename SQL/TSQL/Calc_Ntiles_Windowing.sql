Use AdventureWorks2012;

-------------Calculating NTiles------------------
--------Windowing Functions--------------
--The inner query gives us a table of spend per user. 
--The middle query annotates each row with the quartile — ntile(4) — of spend. 
--Finally, the outer query aggregates the rows into just the min and max of each quartile.

Select
	quartile,
	min(spend) as min,
	max(spend) as max
from (
	select
		spend,
		ntile(4) over (order by spend asc) quartile
	from (
		select CustomerID, sum(SubTotal) as spend
		from Sales.SalesOrderHeader
		group by CustomerID
	) user_spend
) user_spend_quartiles
group by quartile
--order by ntile asc