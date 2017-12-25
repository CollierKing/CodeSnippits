/**********************************************************************
 * File:	Lab3_Q1.sql
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


select EMPNO, ENAME, JOB, HIREDATE
from EMP
where DEPTNO = 10;