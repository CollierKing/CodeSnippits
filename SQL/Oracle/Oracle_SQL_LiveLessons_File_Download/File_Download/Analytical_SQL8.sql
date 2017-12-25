/**********************************************************************
 * File:	Analytical_SQL8.sql
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

set pagesize 20
compute sum of sales_amount on sales_name;
compute sum of AVG_SALE on sales_name;
compute sum of DIFFERENCE on sales_name;
break on sales_name skip 2
select sales_name, sales_amount,
   round(avg(sales_amount) OVER()) as AVG_SALE,
   sales_amount - round(avg(sales_amount) OVER()) as Difference
from company_sales
order by sales_name;

