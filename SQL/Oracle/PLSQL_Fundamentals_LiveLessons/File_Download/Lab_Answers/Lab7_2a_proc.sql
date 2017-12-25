CREATE or REPLACE PROCEDURE Lab7_2_proc (v_ename IN varchar2) 
is

cursor emp_cur is
   select ename, deptno
   from emp;
   
v_dname dept.dname%TYPE;

BEGIN

select Lab7_func(deptno)
into v_dname
from emp
where ename = v_ename;

dbms_output.put_line('Employee ' || v_ename || ' works in dept ' || v_dname);


EXCEPTION

when NO_DATA_FOUND then
   dbms_output.put_line('No Data Found');
when OTHERS then
   dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);

END;
/


