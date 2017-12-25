/**********************************************************************
 * File:	Analytical_SQL15.sql
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

select sales_person, sales_date, sales_amt,
  ROUND(AVG(sales_amt) OVER(ORDER BY sales_date
  RANGE BETWEEN INTERVAL '2' MONTH PRECEDING
            AND INTERVAL '2' MONTH FOLLOWING)) as MOVING_AVG
from sales
/

