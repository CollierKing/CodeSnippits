DECLARE

v_count  NUMBER(3) := 0;

BEGIN

FOR v_count IN 1 .. 5
LOOP
   dbms_output.put_line('Dan Hotka');
END LOOP;

END;
/
