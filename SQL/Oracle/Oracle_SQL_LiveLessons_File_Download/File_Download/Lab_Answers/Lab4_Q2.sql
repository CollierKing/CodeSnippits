/**********************************************************************
 * File:	Lab4_Q2.sql
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


select ENAME, LOC
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
order by LOC, ENAME;