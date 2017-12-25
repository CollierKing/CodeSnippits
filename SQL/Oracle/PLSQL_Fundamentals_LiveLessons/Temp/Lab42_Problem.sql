DECLARE

v_hours_worked  NUMBER(3) := &Hours_Worked;
v_message       VARCHAR2(40);

BEGIN

v_message :=
CASE
  WHEN v_hours_worked > 40 THEN 'You worked overtime'
  WHEN v_hours_worked = 40 THEN 'you worked a full week'
  WHEN v_hours_worked BETWEEN 20 and 40 THEN 'have you been sick?'
  WHEN v_hours_worked BETWEEN 1 and 20 THEN 'you are part-time help'
  ELSE 'You did not enter a valid number of hours'
END;

dbms_output.put_line(v_message);

END;
/
