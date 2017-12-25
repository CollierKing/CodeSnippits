/**********************************************************************
 * File:	Lab11_Q2.sql
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


rem set FEEDBACK OFF
rem set VERIFY OFF
rem set TERMOUT OFF
rem set ECHO OFF
set PAGESIZE 55
set LINESIZE 80

column JOB format a16 Heading 'Job'
column ENAME format a10 Heading 'Employee|Name'
column SAL format $999,999 Heading 'Salary'

break on JOB skip 2 on report skip 2
 
compute sum label 'Sub Total' of SAL on JOB
compute sum label 'Report Total' of SAL on report

ttitle "My Report"

SET MARKUP HTML ON
spool c:\temp\myrpt.htm

select job, ename, sal
from emp
order by job;

spool off

SET MARKUP HTML OFF

rem exit