DECLARE

v_number NUMBER := 7369;
v_sal    emp.sal%TYPE;
v_ename  ename%TYPE;

BEGIN

select ename, sal * 1.1
into v_ename, v_sal
from emp
where empno = v_number


dbms_output.put_line('Employee ' || v_name || ' New Sal ' || v_sal);

END;
/