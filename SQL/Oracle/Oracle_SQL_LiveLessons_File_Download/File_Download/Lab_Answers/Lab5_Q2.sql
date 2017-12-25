/**********************************************************************
 * File:	Lab5_Q2.sql
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


select DEPT.DEPTNO, LOC, COUNT(ENAME) 
from EMP, DEPT
where EMP.DEPTNO(+) = DEPT.DEPTNO
group by DEPT.DEPTNO, LOC;
