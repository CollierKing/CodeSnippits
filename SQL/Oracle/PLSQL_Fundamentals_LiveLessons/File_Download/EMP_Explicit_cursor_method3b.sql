declare
cursor emp_cur is
select rowid, ename, sal
from emp
FOR UPDATE;
begin
for emp_rec in emp_cur
loop
   dbms_output.put_line('rowid = ' || emp_rec.rowid || ' ename = ' || emp_rec.ename);
   update emp set sal = 100 where rowid = emp_rec.rowid;
end loop;
commit;
end;
/