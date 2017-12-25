CREATE OR REPLACE PACKAGE overload2 IS
   PROCEDURE esal (IN_Number number); 
   PROCEDURE esal (IN_Name varchar2);
END;
/

CREATE or REPLACE PACKAGE BODY overload2 IS

PROCEDURE esal (IN_Number number)
IS
v_ename  emp.ename%TYPE;
v_sal    emp.sal%TYPE;

BEGIN

select ename, sal
into v_ename, v_sal
from emp
where empno = IN_Number;

dbms_output.put_line('Employee ' || v_ename || ' Makes ' || v_sal);

END;

PROCEDURE esal (IN_Name varchar2)
IS
v_sal    emp.sal%TYPE;

BEGIN

select sal
into v_sal
from emp
where ename = IN_Name;

dbms_output.put_line('Employee ' || IN_Name || ' Makes ' || v_sal);

END;

END overload2;
/

