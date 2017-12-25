DECLARE

v_number NUMBER := 7369;
v_ename  emp.ename%TYPE;
v_sal    emp.sal%TYPE;

BEGIN

select ename, sal * 1.1
into v_ename, v_sal
from emp
where empno = v_number;

dbms_output.put_line('New Salary for  ' || n_ename || ' is ' || v_sal);

END;
/