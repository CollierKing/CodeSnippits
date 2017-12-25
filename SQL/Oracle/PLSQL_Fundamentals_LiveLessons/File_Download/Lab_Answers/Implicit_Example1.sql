DECLARE

v_row_count  NUMBER(3) := 0;

BEGIN

UPDATE emp
   set sal = sal * 1.1
   where deptno = 10;

IF SQL%FOUND THEN
   v_row_count := SQL%ROWCOUNT;
   dbms_output.put_line('Number of Employees updated: ' || v_row_count);
END IF;

IF SQL%NOTFOUND THEN
   dbms_output.put_line('No Employees were updated');
END IF;

COMMIT;

END;
/