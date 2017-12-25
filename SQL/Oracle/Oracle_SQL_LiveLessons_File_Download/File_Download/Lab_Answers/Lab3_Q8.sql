/**********************************************************************
 * File:	Lab3_Q8.sql
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


select ENAME, JOB, SAL, COMM, DEPTNO
from EMP
where JOB = 'MANAGER'
and DEPTNO != 30;