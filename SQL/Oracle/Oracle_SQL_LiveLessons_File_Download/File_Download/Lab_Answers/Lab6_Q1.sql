/**********************************************************************
 * File:	Lab6_Q1.sql
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


select ENAME 
from EMP
where SAL < (select SAL * .30
             from EMP
	     where JOB = 'PRESIDENT');
