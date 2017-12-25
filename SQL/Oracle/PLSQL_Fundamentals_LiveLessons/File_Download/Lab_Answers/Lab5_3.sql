declare
cursor emp_cur is
select rowid, ename, sal, job
from emp;

begin

for emp_rec in emp_cur
loop
   dbms_output.put_line('Employee ' || emp_rec.ename || ' makes ' || emp_rec.sal);
   IF emp_rec.job = 'MANAGER' THEN
      dbms_output.put_line('   ' || emp_rec.ename || ' is a manager and now makes ' || emp_rec.sal * 1.1);
      update emp set sal = sal * 1.1 where rowid = emp_rec.rowid;
      commit;
   END IF;
end loop;
end;
/