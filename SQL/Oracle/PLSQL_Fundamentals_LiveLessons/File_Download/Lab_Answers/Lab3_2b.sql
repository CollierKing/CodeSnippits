DECLARE

emp_rec  emp%ROWTYPE;
v_number NUMBER := 7369;

BEGIN

select *
into emp_rec
from emp
where empno = v_number;

dbms_output.put_line('New Salary for  ' || emp_rec.ename || ' is ' || emp_rec.sal * 1.1);

END;
/