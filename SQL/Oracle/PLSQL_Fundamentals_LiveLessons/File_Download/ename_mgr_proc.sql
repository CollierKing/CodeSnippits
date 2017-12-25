create or replace procedure ename_mgr
is

v_out varchar2(30);

cursor mgr_cur
is
select empno, ename 
from emp;

begin

for mgr_rec in mgr_cur
  loop
     mgr_name_proc(mgr_rec.empno,v_out);
     dbms_output.put_line(mgr_rec.ename || ' reports to ' || v_out);
   end loop;
end;
/
