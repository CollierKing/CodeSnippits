define RPT_DATE = &1
set FEEDBACK OFF
set VERIFY OFF
set TERMOUT OFF
set ECHO OFF
column JOB               format a10    heading 'Employee'
column DEPT10            format 999999 heading 'Dept 10'
column DEPT20            format 999999 heading 'Dept 20'
column DEPT30            format 999999 heading 'Dept 30'
column DEPT40            format 999999 heading 'Dept 40'
column TOTALS            format 999999 heading 'Totals'
break on report skip 2
compute sum of DEPT10 on report
compute sum of DEPT20 on report
compute sum of DEPT30 on report
compute sum of DEPT40 on report
compute sum of TOTALS on report
ttitle left '&&RPT_DATE' center 'Department Totals' RIGHT 'Page: ' format 999 -
    SQL.PNO skip CENTER ' by Job '
spool Example1.OUT
select JOB,
    sum(decode(DEPTNO,10,SAL,0)) DEPT10,
    sum(decode(DEPTNO,20,SAL,0)) DEPT20,
    sum(decode(DEPTNO,30,SAL,0)) DEPT30,
    sum(decode(DEPTNO,40,SAL,0)) DEPT40,
    sum(SAL) TOTALS
from EMP
group by JOB
/
spool off
rem exit
