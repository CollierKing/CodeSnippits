define my_location = &1

set FEEDBACK OFF
set VERIFY OFF
set TERMOUT OFF
set ECHO OFF

set PAGESIZE 55
set LINESIZE 54

ttitle 'Report for Location &my_location'
btitle off
break on job skip 2 on report skip 2

compute sum label 'Sub Total' of salary on job
compute sum label 'Report Total' of salary on report

column job format a20 heading 'Job|Title'
column ename format a20 heading 'Employee|Name'
column SALARY format $999,999.00 heading 'Salary'

spool my_rpt.html

prompt <title>Location Report</title>
prompt <body bgcolor="#FFF101">
prompt <a href="String_Functions.txt">String Functions</href>

set markup html on

select job, ename, salary
from ab_hr
where loc_id = &my_location
order by job
/

spool off

EXIT
