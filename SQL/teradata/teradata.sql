/*DATABASES*/
/*use a database*/
Database test_db;
 
/*find tables with a column*/
SELECT DatabaseName, TableName, ColumnName
FROM dbc.ColumnsV
WHERE lower(ColumnName) LIKE '%Customer_ID%'
 
/JOINS*/
 
/*inner join*/
SELECT Loc
FROM department, employee
WHERE employee.name = 'Marston A'
AND employee.deptno = department.deptno;
 
/*cross join*/
SELECT ...
FROM table_a
CROSS JOIN table_b;
 
/*outer join*/
SELECT 
offerings.course_no, 
offerings.location, 
enrollment.emp_no
FROM offerings
LEFT OUTER JOIN enrollment
ON offerings.course_no = employee.course_no;
 
/*correlated subqueries*/
SELECT *
FROM table_1 AS a
WHERE x < (SELECT AVG(table_1.x)
            FROM table_1
            WHERE table_1.n = a.n);
 
SELECT *
FROM table_1
WHERE x < (SELECT AVG(a.x)
            FROM table_1 AS a
            WHERE table_1.n = a.n);
 
 
/*DATA TYPES*/
 
/*DESCRIBE*/
 
show table order_t;
help table order_t;
 
/*CAST*/
/*decimal*/
select
 cast(extract(year from order_date)||'.'||to_char(order_date,'iw') as decimal(6,2)) as year_wk
from order_t
order by
 cast(extract(year from order_date)||'.'||to_char(order_date,'iw') as decimal(6,2))
;
 
 
 
 
/*NUMBERS*/
/*round*/
 
select round(0.23456,2);
 
/*least*/
select least(1,5);
 
/*greatest*/
select greatest(1,5);
 
/*NVL*/
 
select nvl(NULL,'hello')
 
/*DATES*/
/*dates*/
SELECT CAST('2013-02-12' AS DATE);
SELECT CAST('12/02/99' AS DATE FORMAT 'DD/MM/YY');
/*last day*/
 
select
last_day(order_date)
from order_t
;
 
/*add months*/
 
select
ADD_MONTHS(order_date,-1),
ADD_MONTHS(order_date,0),
ADD_MONTHS(order_date,1),
from order_t
 
/*MONTHS BETWEEN*/
select months_between(
cast('2019-01-01' as date),
cast('2020-01-01' as date)
)
 
 
/*yearmon  + start/end dates**/
 
with cust as (
 select * from customer_t
),
orders as (
 select * from order_t
),
comb as (
 select distinct
 cust.customer_id,
 cust.customer_name,
 
 extract(year from orders.order_date)||
 extract(month from orders.order_date) as year_mon,
 
 orders.order_id
 from cust cust
 inner join orders orders
 on cust.customer_id = orders.customer_id
)
select distinct
customer_id,
customer_name,
year_mon,
count(distinct order_id) as order_n
from comb
group by
customer_id,
customer_name,
year_mon
order by 1,2 desc
 
 
 
/*yearweek + start/end dates*/
 
select
tO_CHAR(order_date, 'iw')
from order_t
 
/*DATE EXPANSIONS*/
 
with date_range as (
 select distinct
 min(order_Date) - 100 as min_order,
 max(order_date) + 100 as max_order
 from order_t
),
rptg_periods as (
 SELECT distinct
 extract(year from BEGIN(pd))||
 extract(month from BEGIN(pd)) as year_mon
 FROM date_range
 EXPAND ON PERIOD(min_order, max_order + 30) AS pd
),
order_res as (
 SELECT
 extract(year from order_date)||
 extract(month from order_date) as year_mon,
 count(distinct customer_id) as custs,
 count(distinct order_id) as orders
 from order_t
 group by
 extract(year from order_date)||
 extract(month from order_date)
),
rptg_res as (
 select distinct
 r.year_mon,
 o.custs,
 o.orders
 from rptg_periods r
 left join order_res o
 on r.year_mon = o.year_mon
)
select * from rptg_res
 
with dates_ as (
select
CAST('2011-02-12' AS DATE) as start_,
CAST('2019-02-12' AS DATE) as end_
from order_t
)
 SELECT distinct
 extract(year from BEGIN(pd))||extract(month from BEGIN(pd)) as year_mon
from dates_
 EXPAND ON PERIOD(start_, end_ + 30) AS pd
 
 
/*CHARACTERS*/
/*LPAD*/
 
select lpad('9',2,'0');
SELECT CAST(CAST(123 AS FORMAT '9(9)') AS CHAR(9));
 
/*CONCAT*/
 
  select customer_id||customer_name as cust 
 
/*CONDITIONS*/
/*COALESCE*/
 
select coalesce(NULL,'hello');
 
/*CASE*/
 
/*MERGE*/
 
MERGE INTO t1
USING (
    SELECT a2, b2, c2
    FROM t2
    WHERE a2 = 1
) AS source (a2, b2, c2)
ON a1 = a2
WHEN MATCHED THEN
    UPDATE SET b1 = b2
WHEN NOT MATCHED THEN
    INSERT (a2, b2, c2);
 
/*CTEs*/
/*recursive*/
WITH orderable_items (product_id, quantity) AS
     ( SELECT stocked.product_id, stocked.quantity
       FROM stocked, product
       WHERE stocked.product_id = product.product_id
       AND   product.on_hand > 5
    )
SELECT product_id, quantity
     FROM orderable_items
     WHERE quantity < 10;
 
/*non recursive*/
with cust as (
 select * from customer_t
),
fcust as (
 select customer_id||customer_name as cust from cust
 where lower(customer_name) like '%euro%'
)
select * from fcust;
 
 
 
 
 
WITH multiple_orders AS (
   SELECT customer_id, COUNT(*) AS order_count
   FROM orders
   GROUP BY customer_id
   HAVING COUNT(*) > 1
),
multiple_order_totals AS (
   SELECT customer_id, SUM(total_cost) AS total_spend
   FROM orders
   WHERE customer_id IN (SELECT customer_id FROM multiple_orders) 
   GROUP BY customer_id
)
SELECT * FROM multiple_order_totals
ORDER BY total_spend DESC;
 
 
 
/*AGGREGATIONS*/
 
/*TOP N*/
 
SELECT TOP 10 *
FROM orders;
 
Select * from table_name sample 80000;
/*having*/
SELECT g, SUM(DISTINCT a), SUM(DISTINCT b)
FROM T
GROUP BY g
COUNT(DISTINCT c) > 5;
 
SELECT min(a1) as i, max(b1) as j from t1
GROUP BY c1
HAVING 30 >= (sel count(*) from t2 where t1.d1=5);
 
/*qualify*/
SELECT store, item, profit, QUANTILE(100, profit) AS percentile
FROM (SELECT items.item, SUM(sales) -
            (COUNT(sales)*items.item_cost) AS profit
    FROM daily_sales, items
    WHERE daily_sales.item = items.item
    GROUP BY items.item,items.itemcost) AS item_profit
GROUP BY store, item, profit, percentile
QUALIFY percentile = 99;
 
/*cubes*/
SELECT pid, county, SUM(sale)
FROM sales_view
GROUP BY CUBE (pid,county);
 
with c_orders as (
 /*assign date grouping col (week)*/
 select  distinct
 o.customer_id,
 to_char(order_date,'iw') as order_week,
 o.order_id,
 q.product_id,
 q.ordered_quantity,
 p.standard_price * q.ordered_quantity as revenue
 from order_t o
 inner join order_line_t q
 on o.order_id = q.order_id
 inner join product_t p
 on q.product_id = p.product_id
)
select customer_id,product_id,
sum(revenue)
from c_orders
group by cube (customer_id, product_id)
 
/*grouping sets*/
with c_orders as (
 /*assign date grouping col (week)*/
 select  distinct
 o.customer_id,
 to_char(order_date,'iw') as order_week,
 o.order_id,
 q.product_id,
 q.ordered_quantity,
 p.standard_price * q.ordered_quantity as revenue
 from order_t o
 inner join order_line_t q
 on o.order_id = q.order_id
 inner join product_t p
 on q.product_id = p.product_id
)
select customer_id,product_id,
sum(revenue)
from c_orders
group by GROUPING SETS((Customer_ID),(Product_ID),())
order by 1,2
 
/*rollups*/

with c_orders as (
 /*assign date grouping col (week)*/
 select  distinct
 o.customer_id,
 to_char(order_date,'iw') as order_week,
 o.order_id,
 q.product_id,
 q.ordered_quantity,
 p.standard_price * q.ordered_quantity as revenue
 from order_t o
 inner join order_line_t q
 on o.order_id = q.order_id
 inner join product_t p
 on q.product_id = p.product_id
),ru as (
 select customer_id,product_id,
 sum(revenue) as rev
 from c_orders
 group by ROLLUP(customer_id,product_id)
)
select * from ru where customer_id is null

/*pivot*/
select * from olympic_medal_winners   
pivot ( count(*) for medal in (   
 'Gold' gold, 'Silver' silver, 'Bronze' bronze   
))dt   
order by noc;
 
select * from rptg_res
pivot
(
 sum(nvl(orders,0))
for year_
in (2008,2009)
) as dt
 
/*WINDOW FUNCTIONS*/
 
/*rankings*/
select
customer_id,
row_number() over (order by order_date desc)
from order_t;
 
select
customer_id,
count(order_id) as tot_orders,
row_number() over (order by tot_orders desc) as order_rank
from order_t
group by 
customer_id
;
 
/*first/last value*/
select distinct
customer_id,
first_value(order_date) over (partition by customer_id order by order_date asc) as fd,
first_value(order_date) over (partition by customer_id order by order_date desc) as ld
from order_t;
 
/*running sum*/
with c_orders as (
 /*assign date grouping col (week)*/
 select  distinct
 o.customer_id,
 to_char(order_date,'iw') as order_week,
 o.order_id,
 q.product_id,
 q.ordered_quantity,
 p.standard_price * q.ordered_quantity as revenue
 from order_t o
 inner join order_line_t q
 on o.order_id = q.order_id
 inner join product_t p
 on q.product_id = p.product_id
),
grp as (
 select customer_id,
 order_week,
 count(distinct order_id) as tot_o,
 sum(ordered_quantity) as tot_q,
 sum(revenue) as tot_r
 from c_orders
 group by customer_id,
 order_week
)
select distinct
customer_id,
order_week,
count(tot_o) over (partition by customer_id order by order_week
rows between unbounded preceding and current row) as tot_o,
sum(tot_q) over (partition by customer_id order by order_week
rows between unbounded preceding and current row) as tot_q,
sum(tot_r) over (partition by customer_id order by order_week
rows between unbounded preceding and current row) as tot_r
from grp
;
 
 
/*running count*/
select
customer_id,
count(*) over (
  partition by customer_id
  order by order_date
  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) as run_tot
from order_t
 

/*lead/lag*/
select 
customer_id,
order_date,
LAG(order_date, 1) OVER (PARTITION BY customer_id ORDER BY order_date)
from order_t;

