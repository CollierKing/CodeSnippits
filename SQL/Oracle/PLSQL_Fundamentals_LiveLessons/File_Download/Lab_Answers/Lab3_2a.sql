DECLARE

v_number NUMBER := 7369;
v_sal    emp.sal%TYPE;

BEGIN

select sal
into v_sal
from emp
where empno = v_number;

v_sal := v_sal * 1.1;

dbms_output.put_line('Employee ' || v_number || ' New Sal ' || v_sal);

END;
/