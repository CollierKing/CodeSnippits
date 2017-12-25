/**********************************************************************
 * File:	Lab4_Q1.sql
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


select ENAME, EMPNO
from EMP
where JOB = 'MANAGER'
and SAL > 2600;