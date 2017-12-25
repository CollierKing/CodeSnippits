DECLARE

v_count  NUMBER(3) := 0;

BEGIN

WHILE v_count < 5
LOOP
   dbms_output.put_line('Dan Hotka');
   v_count := v_count + 1;
END LOOP;

END;
/
