declare
cursor emp_cur is
select ename
from emp;

emp_rec emp_cur%ROWTYPE;

begin

open emp_cur;

fetch emp_cur into emp_rec;

while emp_cur%FOUND
loop
   dbms_output.put_line(' ename = ' || emp_rec.ename);
   fetch emp_cur into emp_rec;
end loop;

close emp_cur;

end;
/