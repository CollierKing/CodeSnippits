/**********************************************************************
 * File:	Lab4_Q5c.sql
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
order by JOB asc, SAL desc;