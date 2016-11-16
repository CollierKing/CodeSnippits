/*
Select count(distinct customerid), month(OrderDate)
from sales.SalesOrderHeader
group by month(OrderDate)
order by month(orderDate)
*/

WITH Monthly_Usage as (

SELECT CustomerID,
DATEDIFF(month, '2005-01-01', OrderDate) as Time_Period
FROM Sales.SalesOrderHeader
WHERE SalesOrderID IS NOT NULL
Group by CustomerID, DATEDIFF(month, '2005-01-01', OrderDate))

--SELECT * FROM Monthly_Usage

,

Lag_lead as (
SELECT CustomerID, Time_Period,
	LAG(time_period,1) OVER(PARTITION BY CustomerID ORDER BY CustomerID, Time_Period) as LAG1,
	LEAD(time_period,1) OVER(PARTITION BY CustomerID ORDER BY CustomerID, Time_Period) As LEAD1
FROM Monthly_Usage)

,

Lag_lead_diffs as (
SELECT CustomerID, Time_Period, LAG1, LEAD1,
time_period-LAG1 as lag_size,
LEAD1-time_period as lead_size
from lag_lead)

,

calculated as (SELECT Time_Period,
	CASE when LAG1 is null then 'new'
		WHEN lag_size = 1 THEN 'active'
		WHEN lag_size > 1 THEN 'return'
	END as this_month_value,

	CASE WHEN (lead_size > 1 OR lead_size IS NULL) THEN 'churn'
		ELSE NULL
	END as next_month_churn,

	count(distinct CustomerID)as CountED
		FROM Lag_lead_diffs
		GROUP BY Lag_lead_diffs.Time_Period, Lag_lead_diffs.LAG1, Lag_lead_diffs.lag_size, Lag_lead_diffs.lead_size
	)


SELECT time_period, this_month_value, sum(CountED)
from calculated 
group by Time_Period, this_month_value
UNION
select time_period+1, 'CHURN', CountED
	FROM calculated where next_month_churn IS NOT NULL
ORDER BY 1