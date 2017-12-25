DECLARE
   emp_rec emp%ROWTYPE;
BEGIN
   SELECT *
   into EMP_REC
   FROM EMP
   where empno = 7934;

DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_rec.ename);

END;
/


