declare
cursor emp_cur is
select ename, sal
from emp;
begin

for emp_rec in emp_cur
loop
    dbms_output.put_line('Employee ' || emp_rec.ename || ' makes ' || emp_rec.sal);
end loop;

end;
/