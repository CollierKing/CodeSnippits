DECLARE

v_count  NUMBER(3) := 0;

BEGIN

LOOP
   dbms_output.put_line('Dan Hotka');
   v_count := v_count + 1;
   IF v_count = 5 THEN
      EXIT;
   END IF;
END LOOP;

END;
/
