/**********************************************************************
 * File:	Analytical_SQL2.sql
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
RANK() OVER (order by sum(sales_amount) desc) as RANK_ID  
from company_sales 
where RANK_ID < 4
group by sales_name;



