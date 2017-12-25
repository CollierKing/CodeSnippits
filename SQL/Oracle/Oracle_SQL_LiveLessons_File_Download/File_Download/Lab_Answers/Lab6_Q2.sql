/**********************************************************************
 * File:	Lab6_Q2.sql
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


select DEPTNO, ENAME, HIREDATE
from EMP
where (DEPTNO, HIREDATE) in (select DEPTNO, max(HIREDATE)
                             from EMP
			     group by DEPTNO);
