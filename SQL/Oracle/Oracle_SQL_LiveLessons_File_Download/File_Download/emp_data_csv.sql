set feedback off verify off pagesize 0 

spool c:\temp\emp_data.csv

select ename, job, sal 
from emp;

spool off

rem exit