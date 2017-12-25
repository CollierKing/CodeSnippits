/**********************************************************************
 * File:	Lab5_Q5.sql
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


select DEPTNO, avg(SAL), max(SAL)
from EMP
group by DEPTNO
having count(*) > 2;
