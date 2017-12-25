/**********************************************************************
 * File:	Analytical_SQL14.sql
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
    ROWS BETWEEN UNBOUNDED PRECEDING and CURRENT ROW) as ROWS_SALES,
 sum(sales_amount) OVER(ORDER BY sales_amount
    RANGE BETWEEN UNBOUNDED PRECEDING and CURRENT ROW) as RANGE_SALES
from company_sales;

