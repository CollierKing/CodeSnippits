DECLARE

v_name   emp.ename%TYPE;
emp_rec  emp%ROWTYPE;
v_number NUMBER := 7369;
v_date   DATE := SYSDATE;
v_char   VARCHAR2(20);

BEGIN

select *
into emp_rec
from emp
where empno = v_number;

dbms_output.put_line('Date is: ' || v_date || ' Employee: ' || emp_rec.ename);

END;
/