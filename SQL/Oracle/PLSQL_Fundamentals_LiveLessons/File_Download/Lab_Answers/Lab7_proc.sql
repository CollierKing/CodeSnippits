CREATE or REPLACE PROCEDURE Lab7_proc 
is

cursor emp_cur is
   select ename, deptno
   from emp;
   
v_deptno emp.deptno%TYPE;
v_dname dept.dname%TYPE;

BEGIN

for emp_rec in emp_cur
loop
   v_dname := Lab7_func(emp_rec.deptno);
   dbms_output.put_line('Employee ' || emp_rec.ename || ' works in dept ' || v_dname);
end loop;


EXCEPTION

when NO_DATA_FOUND then
   dbms_output.put_line('No Data Found');
when OTHERS then
   dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);

END;
/


