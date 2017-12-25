DECLARE
   emp_rec emp%ROWTYPE;

BEGIN
   SELECT *
   into EMP_REC
   FROM EMP;
--   where empno = 2000;

DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_rec.ename);

EXCEPTION

when TOO_MANY_ROWS then
   dbms_output.put_line('Too many rows found');
when NO_DATA_FOUND then
   dbms_output.put_line('No Data Found');
when OTHERS then
   dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);

END;
/


