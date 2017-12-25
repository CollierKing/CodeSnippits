/**********************************************************************
 * File:	Lab4_Q4.sql
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


select D.DEPTNO, D.LOC, E.ENAME
from EMP E, DEPT D
where D.DEPTNO = E.DEPTNO(+);