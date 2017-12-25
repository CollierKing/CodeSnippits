CREATE or REPLACE PROCEDURE Lab7_proc 
is

cursor emp_cur is
   select ename, deptno
   from emp;
   
v_deptno emp.deptno%TYPE;
v_dname dept.dname%TYPE;


BEGIN


   
   *** put the necessary code here ***
   



EXCEPTION

when NO_DATA_FOUND then
   dbms_output.put_line('No Data Found');

when OTHERS then
   dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);


END;
/


