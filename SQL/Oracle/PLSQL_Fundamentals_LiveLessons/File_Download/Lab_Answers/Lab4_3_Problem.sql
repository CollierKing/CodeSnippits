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


missing endif, reseerved word, missing : on := 2nd line of loop