/**********************************************************************
 * File:	Lab3_Q7.sql
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


select ENAME, JOB, SAL
from EMP
where JOB = 'MANAGER' or JOB = 'PRESIDENT';