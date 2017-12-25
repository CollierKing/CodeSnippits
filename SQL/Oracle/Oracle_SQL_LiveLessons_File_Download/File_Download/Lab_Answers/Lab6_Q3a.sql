/**********************************************************************
 * File:	Lab6_Q3a.sql
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


select ENAME, JOB, SAL
from (select ENAME, JOB, SAL
      from emp
	  where JOB not in ('PRESIDENT','SALESMAN')
	  order by SAL desc)
where ROWNUM < 5;
