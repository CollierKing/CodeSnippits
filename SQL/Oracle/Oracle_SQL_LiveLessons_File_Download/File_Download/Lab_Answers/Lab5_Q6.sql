/**********************************************************************
 * File:	Lab5_Q6.sql
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


select initcap(ENAME) Name, DEPTNO Dept, SAL Salary, 
decode(DEPTNO,10,SAL * 1.1,
              20,SAL * 1.2,
			     SAL * 1.15) NEW_Salary
from EMP;
