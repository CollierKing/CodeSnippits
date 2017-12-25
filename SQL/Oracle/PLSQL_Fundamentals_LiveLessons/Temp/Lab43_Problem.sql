DECLARE

count  NUMBER(3) := 0;

BEGIN

LOOP
   dbms_output.put_line('Dan Hotka');
   count = count + 1;
   IF count = 5 THEN
      EXIT;
END LOOP;

END;
/