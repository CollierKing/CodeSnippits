Use AdventureWorks2012;

--we’re going to compute day-over-day changes with one hand tied behind our back — without window functions.
--Let’s start with a handy group-and-count of revenue:
-------------------------

--select 
--cast(OrderDate as datetime) as dtt,
--sum(subtotal)

--from sales.SalesOrderHeader
--group by cast(OrderDate as datetime)
--order by 1

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--To start, let’s put our revenue calculation in a with clause so we can reuse it:
-------------------------

--WITH daily_revenue as (
--	select cast(orderdate as datetime) as d, sum(subtotal) as rev
--	from sales.SalesOrderHeader
--	group by cast(OrderDate as datetime)
--) 
--select
--	today_revenue.d,
--	today_revenue.rev,
--	yest_revenue.rev as prev_rev
--from daily_revenue as today_revenue
--left join daily_revenue as yest_revenue
--	on yest_revenue.d = today_revenue.d - 1
--	order by d

--The magic happens with on yesterday_revenue.d = today_revenue.d - 1. 
--This specifies that the second copy of daily_revenue — the copy named yesterday_revenue — 
--should be behind today_revenue by one day.

--Also, notice the left join: This includes the first day in the results. Otherwise, since it has no “yesterday”, 
--it would fail the join condition and get excluded!

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--Putting It All Together
--Now that we have daily revenue and the previous day’s revenue together in each row, 
--calculating growth is a simple matter of calculating the difference, 
--and dividing that difference by the previous day’s revenue!
-------------------------

WITH daily_revenue as (
	select cast(orderdate as datetime) as d, sum(subtotal) as rev
	from sales.SalesOrderHeader
	group by cast(OrderDate as datetime)
) 
select
	d,
	rev,
	prev_rev,
	(rev - prev_rev)/ prev_rev as growth_rate
from (
select
	today_revenue.d,
	today_revenue.rev,
	yest_revenue.rev as prev_rev
from daily_revenue as today_revenue
left join daily_revenue as yest_revenue
	on yest_revenue.d = today_revenue.d - 1
) revenue_by_day
order by d

-----------------------------------------------------------
-----------------------------------------------------------
----DAILY COUNT

WITH daily_count as (
	select cast(orderdate as datetime) as d, count(*) as rev
	from sales.SalesOrderHeader
	group by cast(OrderDate as datetime)
) 
select
	d,
	rev,
	prev_rev,
	round( 100.0 *
	(rev - prev_rev)/ prev_rev, 2) as growth_rate
from (
select
	today_revenue.d,
	today_revenue.rev,
	yest_revenue.rev as prev_rev
from daily_count as today_revenue
left join daily_count as yest_revenue
	on yest_revenue.d = today_revenue.d - 1
) revenue_by_day
order by d