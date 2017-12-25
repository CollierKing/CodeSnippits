/**********************************************************************
 * File:	Analytical_SQL11.sql
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

select sales_name, sales_amount,
 sum(sales_amount) OVER(ORDER BY sales_amount
 RANGE BETWEEN 5 PRECEDING and 5 FOLLOWING) as SLIDING_SALES
from company_sales;

