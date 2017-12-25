DECLARE
   emp_rec emp%ROWTYPE;

   my_too_many_rows EXCEPTION;
   PRAGMA EXCEPTION_INIT(my_too_many_rows, -1422);

BEGIN
   SELECT *
   into EMP_REC
   FROM EMP;
--   where empno = 2000;

DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_rec.ename);

EXCEPTION

when my_too_many_rows then
   dbms_output.put_line('My too many rows Encountered...');
when NO_DATA_FOUND then
   dbms_output.put_line('No Data Found');
when OTHERS then
   dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);
END;
/


