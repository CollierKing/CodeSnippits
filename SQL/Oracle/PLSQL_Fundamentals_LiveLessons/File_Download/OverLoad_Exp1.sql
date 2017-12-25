CREATE OR REPLACE PACKAGE overload IS
   PROCEDURE ename_7369; 
   FUNCTION ename_7369 Return Number;
END;
/

CREATE or REPLACE PACKAGE BODY overload IS

PROCEDURE ename_7369 
IS
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

FUNCTION ename_7369 Return Number
IS
v_number NUMBER := 7369;
v_sal    emp.sal%TYPE;

BEGIN

select sal
into v_sal
from emp
where empno = v_number;

v_sal := v_sal * 1.1;

Return(v_sal);

END;

END overload;
/

( IN_Temp number,IN_Type varchar2);