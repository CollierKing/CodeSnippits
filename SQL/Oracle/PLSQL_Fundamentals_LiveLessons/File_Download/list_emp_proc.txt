create or replace procedure list_employee
is
v_out varchar2(30);
cursor emp_cur
is
select ename from emp;
begin
for emp_rec in emp_cur
  loop
     dbms_output.put_line('emp_rec.ename);
   end loop;
end;
/
