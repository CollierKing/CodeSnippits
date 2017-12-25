/**********************************************************************
 * File:	Lab6_Q5.sql
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
where LENGTH(ENAME) in (select max(length(ENAME)) from EMP);