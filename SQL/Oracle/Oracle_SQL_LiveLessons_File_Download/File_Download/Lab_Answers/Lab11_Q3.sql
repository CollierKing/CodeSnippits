/**********************************************************************
 * File:	Lab11_Q3.sql
 * Type:	SQL*Plus script
 * Author:	Dan Hotka (www.DanHotka.com)
 * Date:	April 2015
 *
 * Description:
 *	Lab SQL for Pearson LiveLessons.
 *
 *
 * Modifications:
 *********************************************************************/


select * from 
(select job, deptno, sal from emp)
PIVOT
(sum(sal) for deptno in (10 as Dept10, 20 as Dept20, 30 as Dept30, 40 as Dept40))
order by job;

