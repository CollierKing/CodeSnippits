DECLARE
   v_ename varchar2(20);
   v_sal   number(6);
   MAKES_TOO_MUCH EXCEPTION;
BEGIN
   SELECT ename, sal
   into V_ENAME, V_SAL
   FROM emp
   where empno = &empno;

DBMS_OUTPUT.PUT_LINE('Employee: ' || v_ename || ' makes ' || v_sal);

IF v_sal > 2500 then
   RAISE MAKES_TOO_MUCH;
END IF;

EXCEPTION
when MAKES_TOO_MUCH then
   dbms_output.put_line('This person is overpaid!');
when NO_DATA_FOUND then
   dbms_output.put_line('No Data Found');
  
END;
/
