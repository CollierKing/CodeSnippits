/**********************************************************************
 * File:	Lab4_Q3.sql
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


select E.ENAME, E.SAL
from EMP E, EMP M
where  E.SAL > M.SAL
and E.MGR = M.EMPNO;