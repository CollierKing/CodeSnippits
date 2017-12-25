/**********************************************************************
 * File:	Lab8_Q9_Q12.sql
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



set autotrace on explain

select ENAME
from EMP30
where JOB = 'CLERK';


create index emp30_job on emp30 (job);

rerun the sql...