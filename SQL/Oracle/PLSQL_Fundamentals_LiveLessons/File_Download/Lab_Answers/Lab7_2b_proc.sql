CREATE or REPLACE PROCEDURE Lab7_2b_proc (v_ename IN varchar2) 
is

v_deptno emp.deptno%TYPE;
v_dname dept.dname%TYPE;

BEGIN

select deptno
into v_deptno
from emp
where ename = v_ename;

v_dname := Lab7_func(v_deptno);

dbms_output.put_line('Employee ' || v_ename || ' works in dept ' || v_dname);

EXCEPTION

when NO_DATA_FOUND then
   dbms_output.put_line('No Data Found');
when OTHERS then
   dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);


END;
/


