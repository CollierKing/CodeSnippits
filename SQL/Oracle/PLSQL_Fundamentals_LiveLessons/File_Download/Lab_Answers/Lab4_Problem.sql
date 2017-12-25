DECLARE

v_hours_worked  NUMBER(3) := &Hours_Worked;

BEGIN

IF v_hours_worked > 40 THEN
   dbms_output.put_line('You worked overtime');
ELSIF v_hours_worked < 40 THEN
    dbms_output.put_line('you worked a full week');
ELSIF v_hours_worked BETWEEN 20 and 40 THEN
    dbms_output.put_line('have you been sick?');
ELSIF v_hours_worked < 20 THEN
    dbms_output.put_line('you are part-time help');
END IF;

END;
/



< 40 to = 40  and between to 20 and 39