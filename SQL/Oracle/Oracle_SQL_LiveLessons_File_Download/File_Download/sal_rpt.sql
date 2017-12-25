rem 
rem Simple example to show REPHEADER and REPFOOTER
rem
column ename heading 'Name'
column sal heading 'Salary'
column deptno heading 'Department'
compute sum of sal on report
compute sum of sal on deptno
break on deptno skip 2 on report skip 2
ttitle 'Employee Salary Report'
btitle 'Company Confidential'
repheader center 'Repheader: Beginning of Data'
repfooter center 'Repfooter: Ending of Data'
spool sal_rpt.out
select ename,deptno,sal
from emp
order by deptno,sal
/
spool off
rem exit
