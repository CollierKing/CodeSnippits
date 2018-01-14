--LAB1
DECLARE
v_name varchar2(20) := 'Collier King';
BEGIN
dbms_output.put_line(v_name);
END;
/

--LAB2
--EXAMPLE 1 (1 variable)
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

--EXAMPLE 2 (2 variables)

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

--EXAMPLE 3 (3 variables)

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

--EXAMPLE 4 (Problems)
DECLARE

v_number NUMBER := 7369;
v_sal    emp.sal%TYPE;
v_ename  emp.ename%TYPE;

BEGIN

select ename, sal * 1.1
into v_ename, v_sal
from emp
where empno = v_number;


dbms_output.put_line('Employee ' || v_ename || ' New Sal ' || v_sal);

END;
/



missing ';' on select, misspelled v_name, missing emp. on v_ename %type
