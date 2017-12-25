/**********************************************************************
 * File:	Lab5_Q4.sql
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


select ENAME, SAL, SAL * 1.1 NEW_SAL, HIREDATE, ADD_MONTHS(HIREDATE,6) REVIEW_DATE
from EMP;
