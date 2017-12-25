DECLARE

v_row_count NUMBER(3) := 0;

BEGIN

UPDATE emp
    set sal = sal * 1.1
    where deptno = 10;

IF SQL%FOUND THEN
   dbms_output.put_line('Updated Rows: ' || SQL%ROWCOUNT);
END IF;

IF SQL%NOTFOUND THEN
   dbms_output.put_line('No Rows Updated');
END IF;

End;
/
