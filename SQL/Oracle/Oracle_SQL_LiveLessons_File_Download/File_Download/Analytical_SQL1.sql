/**********************************************************************
 * File:	Analytical_SQL1.sql
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

select sales_name, sum(sales_amount),
RANK() OVER (order by sum(sales_amount) desc) as RANK
from company_sales 
group by sales_name;

