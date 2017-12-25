/**********************************************************************
 * File:	Analytical_SQL10.sql
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

select sales_name
      ,PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY sales_amount) AS P_CONT
      ,PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY sales_amount) AS P_DISC
from company_sales
group by sales_name;

