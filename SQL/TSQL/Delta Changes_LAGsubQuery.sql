--SELECT top 10

--In most sophisticated analysis, the rate of change is at least as important as the raw values
--To start, let’s count the daily events for the last 10 days:

--convert(datetime2, OrderDate, 101) dt,
--count(1) ct

--FROM Sales.SalesOrderHeader
--Group by OrderDate
--order by 1

--we’ll use the lag() window function to add our daily_delta column. 
--lag(a, N) grabs the value in column a that is N rows below the current row. For our query we want yesterday’s ct:

--The order by dt tells the query planner how to order the rows in the window, count(1) is the count of events for each dt, 
--and the 1 says to grab one row below the current row. If you wanted to compare to the same day of the week last week, 
--just use 7 instead of 1. Here’s the full query so far:

--SELECT
--	convert(datetime2, OrderDate, 101) as dt,
--	count(1) ct,
--	lag(count(1), 1) over (order by OrderDate) as ct_yesterday

--FROM Sales.SalesOrderHeader
--Group by OrderDate
--order by 1

--Now we have ct_yesterday, yesterday’s count, in every row. But we really want the change between today and yesterday. 
--To do that, we calculate (ct - ct_yesterday) / ct_yesterday. We can simply add that to an outer query:

--SELECT
--	OrderDate,
--	ct,
--	ct_yesterday,
--	(ct - ct_yesterday) / ct_yesterday as daily_delta
--FROM (
--SELECT
--	--convert(datetime2, OrderDate, 101) as dt,
--	OrderDate,
--	count(1) ct,
--	lag(count(1), 1) over (order by OrderDate) as ct_yesterday
--FROM Sales.SalesOrderHeader
--GROUP BY OrderDate
--) t

--That gives us a decimal between 0 and 1, so we’ll multiply by 100, 
--round to two decimal places, and tack on a percent for style.

Use AdventureWorks2012

--SELECT
--	OrderDate, ct, ct_yesterday,
--	round(
--	100.0 * (ct - ct_yesterday) / ct_yesterday, 2) as daily_delta
--FROM (
--SELECT
--	OrderDate,
--	count(1) ct,
--	lag(count(1), 1) over (order by OrderDate) as ct_yesterday
--FROM Sales.SalesOrderHeader
--GROUP BY OrderDate
--) t

----WITH CAST
----Daily comparison

--SELECT
--	cast(DayBucket - 1 as datetime) as count_dt
--	, ct, ct_yesterday,
--	round(
--	100.0 * (ct - ct_yesterday) / ct_yesterday, 2) as daily_delta
--FROM (
--SELECT
--	cast(OrderDate as int) as DayBucket,
--	--convert(datetime2, OrderDate, 101) as dt,
--	count(1) ct,
--	lag(count(1), 1) over (order by OrderDate) as ct_yesterday
--FROM Sales.SalesOrderHeader
--GROUP BY OrderDate
--) t

----NEW: aggregate by month for lag comparison (Can only look at max 12 months at a time)
---You also have to define the year or you get all orders for these months (across all years)
---------------------------------------------------------------------------------
--Use AdventureWorks2012

--SELECT cohort, 
--		orders,
--		last_orders,
--		round(
--		100.0 * (orders - last_orders) / last_orders, 2) as month_chg
		
--FROM (
--	SELECT month(OrderDate) as cohort,
--		count(*) as Orders,
--		lag(count(*), 1) over (order by month(OrderDate)) as last_orders
--		from Sales.SalesOrderHeader
--		where OrderDate like '%2007%'
--		group by month(OrderDate)
--		) T

------2 month average (trailing 1 month)

-- SELECT cohort, 
		-- orders,
		-- last_orders,
		-- round(
		-- 100.0 * (orders - last_orders) / last_orders, 2) as month_chg,
		-- (Orders + last_orders) / 2 as two_mth_avg,
		-- round(
		-- 100.0 * (orders - (Orders + last_orders) / 2) / (Orders + last_orders) / 2, 2) as chng_two_mnth_avg
		
-- FROM (
	-- SELECT month(OrderDate) as cohort,
		-- count(*) as Orders,
		-- lag(count(*), 1) over (order by month(OrderDate)) as last_orders
		-- from Sales.SalesOrderHeader
		-- where OrderDate like '%2007%'
		-- group by month(OrderDate)
		-- ) T
-- GROUP BY cohort,orders,last_orders

---YEAR OVER YEAR METRICS
--https://www.periscopedata.com/blog/calculating-year-over-year-metrics.html


--SELECT
--	yrr
--	, annual.Revenue
--	, (annual.Revenue / nullif(lag(annual.revenue)
--		over(order by yrr),0))-1 as pct_chg
--FROM
--(
--SELECT 
--	YEAR(OrderDate) as yrr,
--	sum(SubTotal) as Revenue
--FROM Sales.SalesOrderHeader
--GROUP BY year(OrderDate)
--) annual

--Sometimes we want to compare exact months or even days between years. In this example, we want to be able to compare January from this year to last year. 
--We will use to_char to get the name of the month for readability. We will then have to order by the number of the month to get our data in the right orde

--Y/Y CHNG BY MONTH

--SELECT
--	yrr,
--	mnth,
--	revenue,
--	(revenue * 1.0 / lag(revenue)
--		over(partition by mnth order by yrr))
--		-1 as pct_chg
--FROM
--(
--SELECT
--	year(OrderDate) as yrr,
--	Month(OrderDate) as mnth,
--	sum(SubTotal) as Revenue
--FROM Sales.SalesOrderHeader
--GROUP BY year(OrderDate), month(OrderDate)
--) t
--Order BY mnth, yrr


----M/M CHG BY YEAR

--SELECT
--	yrr,
--	mnth,
--	revenue,
--	(revenue * 1.0 / lag(revenue)
--		over( partition by yrr order by mnth))
--		-1 as pct_chg
--FROM
--(
--SELECT
--	year(OrderDate) as yrr,
--	Month(OrderDate) as mnth,
--	sum(SubTotal) as Revenue
--FROM Sales.SalesOrderHeader
--GROUP BY year(OrderDate), month(OrderDate)
--) t
--Order BY yrr, mnth

