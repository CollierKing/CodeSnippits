/**********************************************************************
 * File:	Analytical_SQL7.sql
 * Type:	SQL*Plus script
 * Author:	Dan Hotka (www.DanHotka.com)
 * Date:	April 2015
 *
 * Description:
 *	Sample SQL for Pearson LiveLessons.
 *
 *
 * Modifications:
 *********************************************************************/

select distinct sales_name,  
       sum(sales_amount) OVER(PARTITION by sales_name) as "Total Sales", 
       min(sales_amount) OVER(PARTITION by sales_name) as Cheapest,
       max(sales_amount) OVER(PARTITION by sales_name) as Expensive
from company_sales;

