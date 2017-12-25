CREATE OR REPLACE PACKAGE Lab8_pkg IS
   PROCEDURE Lab7_2_proc (v_ename IN varchar2);
   FUNCTION Lab7_func (v_DEPTNO NUMBER) return varchar2;
   
END Lab8_pkg;
/

CREATE OR REPLACE PACKAGE BODY Lab8_pkg IS

PROCEDURE Lab7_2_proc (v_ename IN varchar2) 
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

END Lab7_2_proc;

FUNCTION Lab7_func (v_DEPTNO NUMBER)
return varchar2
is

v_dname dept.dname%TYPE;

begin
select dname
into v_dname
from dept
where v_deptno = deptno;

return(v_dname);

EXCEPTION

when NO_DATA_FOUND then
   return('No Data Found');
when OTHERS then
   dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);

end Lab7_func;

END Lab8_pkg;
/

