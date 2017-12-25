DECLARE

v_hours_worked  NUMBER(3) := &Hours_Worked;

BEGIN

CASE
  WHEN v_hours_worked > 40 THEN 
     dbms_output.put_line('You worked overtime');
  WHEN v_hours_worked = 40 THEN 
     dbms_output.put_line('you worked a full week');
  WHEN v_hours_worked BETWEEN 20 and 40 THEN 
     dbms_output.put_line('have you been sick?');
  WHEN v_hours_worked < 20 THEN 
     dbms_output.put_line('you are part-time help');
  ELSE 
     dbms_output.put_line('You did not enter a valid number of hours');
END CASE;

END;
/