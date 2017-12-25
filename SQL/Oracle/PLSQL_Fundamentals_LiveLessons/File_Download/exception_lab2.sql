DECLARE
   v_ename varchar2(20);
   
   my_too_many_rows EXCEPTION;
   PRAGMA EXCEPTION_INIT(my_too_many_rows, -1422);
BEGIN
   SELECT ename
   into V_ENAME
   FROM emp;
--   where empno = 2000;
 DBMS_OUTPUT.PUT_LINE('Employee: ' || v_ename);
EXCEPTION
when NO_DATA_FOUND then
   dbms_output.put_line('No Data Found');
when my_too_many_rows then
   dbms_output.put_line('My too many rows Encountered...');
when OTHERS then
   dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);
END;
/
