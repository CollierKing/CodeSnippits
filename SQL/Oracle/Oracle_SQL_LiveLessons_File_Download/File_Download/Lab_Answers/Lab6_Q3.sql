/**********************************************************************
 * File:	Lab6_Q3.sql
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
      order by SAL desc)
where ROWNUM < 5;
