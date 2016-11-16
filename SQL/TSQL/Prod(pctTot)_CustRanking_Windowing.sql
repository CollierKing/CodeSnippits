Use AdventureWorks2012;

-------------------------------------------
----------WINDOWING FUNCTIONS--------------
-------------------------------------------
--Let’s start with some data from a video game company. 
--For each product, we want to know how many times a customer purchased that product,
--and what percent of all purchases that product has.

SELECT
ProductID,
count(ProductID) as purchases,
100.0 * count(ProductID) / (sum(count(ProductID)) over ()) as pct_total

FROM Sales.SalesOrderDetail
GROUP BY ProductID
order by pct_total desc


--The window function in this query is sum(count(1)) over ().

--sum(count(1)) gives us the total number of purchases. over () specifies to aggregate over all the rows without collapsing them. 
--Thus this function gives us the total number of purchases across all products.

--The count(1) in the numerator is not part of the window function, and so it applies to all rows in the group, 
--giving us a per-product count.

--------------Daily Product Percentages_____________
---------Building off of prior query	

Use AdventureWorks2012;

--When visualizing purchases by product over time — 
--a chart every multiplatform game company knows well — 
--it’s typical to start with a simple query:

SELECT
 OrderDate, 
 ProductID, 
 100.0 * count(ProductID)/ (sum(count(ProductID)) over (partition by OrderDate))

FROM Sales.SalesOrderDetail SD
JOIN Sales.SalesOrderHeader SOH
ON SD.SalesOrderID=SOH.SalesOrderID
--where OrderDate like '%2005-07-01%'
Group by OrderDate, ProductID
Order by OrderDate, 3 desc



---------------Determining Row Position-------------------
--------------Windowing Functions-------------------

--Ordering information is another useful trick window functions give us. 
--Let’s take the previous query, and also add a ranking column for which platform has the highest number of plays:

SELECT
	ProductID,
	purchases,
	100.0 * purchases / (sum(purchases) over ()) as pct_total,
	rank() over (order by purchases desc) as rank_
FROM (
	select ProductID, 
	count(ProductID) as purchases
	From Sales.SalesOrderDetail
	GROUP BY ProductID
) purch_by_prod
group by ProductID, purchases

--rank() gives the row’s number, and over (order by plays desc) specifies the order in which to apply the rank.

---------------Multiple Windows with Parition-------------------
------------------Windowing Functions------------------------
--Often we want a separate ordering for different parts of the table. 
--This is what the partition feature enables. It splits the window function, 
--applying it separately to each specified partition.
--For example, let’s find the customer with the most purchases for each platform
--Our partition by platform makes the rank() function give us a separate rank for each platform.

SELECT
	ProductID,
	cust,
	purchases,
	rank() over (partition by ProductID order by purchases desc) Cust_Rank_By_Prod
FROM  (
	select 
	ProductID,
	CustomerID as cust,
	count(ProductID) as purchases
	From Sales.SalesOrderDetail SD
	join Sales.SalesOrderHeader SH
	On SD.SalesOrderID=SH.SalesOrderID
	--where CustomerID <> '29950'
	GROUP BY CustomerID, ProductID
) purch_by_cust_and_prod
group by ProductID, cust, purchases
