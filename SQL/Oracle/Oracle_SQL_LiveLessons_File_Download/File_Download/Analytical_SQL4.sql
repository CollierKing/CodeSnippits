/**********************************************************************
 * File:	Analytical_SQL4.sql
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

select * from
   (select cc.cust_name, sum(cs.sales_amount),
    RANK() OVER (order by sum(cs.sales_amount) desc) as RANK_ID
    from company_sales cs, company_customers cc
    where cs.cust_id = cc.cust_id
    group by cc.cust_name)
order by RANK_ID;

