declare
cursor emp_cur is
select ename
from emp;
begin
for emp_rec in emp_cur
loop
   dbms_output.put_line(' ename = ' || emp_rec.ename);
end loop;
end;
/