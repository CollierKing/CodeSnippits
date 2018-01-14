--SQL%FOUND
--SQL%NOTFOUND
--SQL%ROWCOUNT
--SQL%ISOPEN

--explicit cursors (use for mult rows)

--lab 1

declare
cursor emp_cur is
select ename, sal
from emp;

emp_rec emp_cur%ROWTYPE;

begin
open emp_cur;

fetch emp_cur into emp_rec;

while emp_cur%FOUND
loop
   dbms_output.put_line('Employee ' || emp_rec.ename || ' makes ' || emp_rec.sal);
   fetch emp_cur into emp_rec;
end loop;

close emp_cur;

end;

--lab 2 (more efficient)