/**********************************************************************
 * File:	Lab5_Q1.sql
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


select count(*) 
from EMP, DEPT
where emp.deptno = dept.deptno
and LOC = 'NEW YORK';