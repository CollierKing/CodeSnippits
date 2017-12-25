/**********************************************************************
 * File:	Lab6_Q4.sql
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


select JOB, avg(SAL), min(SAL), max(SAL)
from EMP
group by JOB
having JOB = 'CLERK' or JOB = 'MANAGER';
