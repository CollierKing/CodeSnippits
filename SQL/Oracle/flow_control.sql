--IF STATEMENTS
--------------------------------------------
set serveroutput on

declare

v_hours_worked number(3) := &Hours_Worked;

begin

if v_hours_worked > 40 then
    dbms_output.put_line('You worked overtime');
elsif v_hours_worked = 40 then
    dbms_output.put_line('you worked a full week');
elsif v_hours_worked between 20 and 40 then
    dbms_output.put_line('have you been sick?');
elsif v_hours_worked < 20 then
    dbms_output.put_line('you are part-time help');
end if;
    
end;
/

--CASE STATEMENT
--------------------------------------------
declare

v_hours_worked number(3) := &Hours_Worked;
v_message varchar2(50); 

begin

v_message := -- ":=" calls a function

case
    when v_hours_worked > 40 then 'You worked overtime'
    when v_hours_worked = 40 then 'You worked a full week'
    when v_hours_worked between 20 and 40 then 'have you been sick?'
    when v_hours_worked < 20 then 'you are part-time help'
    else 'you did not enter a valid number of hours'
end;

dbms_output.put_line(v_message);

end;


--LOOPS (Loop, while, for)
--------------------------------------------
--LOOP example (print name 5 times)
declare 

v_count number(3) := 0;

begin

loop
    dbms_output.put_line('Collier King');
    v_count := v_count + 1;
    if v_count = 5 then
        exit;
    end if;
end loop;

end;

--WHILE example (print name 5 times)
declare 

v_count number(3) := 0;

begin

while v_count < 5
loop
    dbms_output.put_line('Collier King');
    v_count := v_count + 1;
end loop;

end;

--FOR example (print name 5 times)
declare

v_count number(3) := 0;

begin

for v_count in 1 .. 5
loop
    dbms_output.put_line('Collier King');
end loop;

end;