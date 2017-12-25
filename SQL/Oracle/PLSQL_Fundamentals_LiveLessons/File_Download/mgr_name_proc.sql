create or replace procedure mgr_name (v_name_in IN varchar2,
                                       v_name_out OUT varchar2)
is
begin

select m.ename
into v_name_out
from emp e, emp m
where e.ename = v_name_in
and nvl(e.mgr,0) = m.empno;

exception
when NO_DATA_FOUND then
  v_name_out := ' no data found ';
  raise;
when others then
  v_name_out := ' no data found ';
  raise;

end;
/


declare
v_name_in  emp.ename%TYPE;
v_name_out emp.ename%TYPE;

begin

v_name_in := 'SMITH';
mgr_name(v_name_in, v_name_out);

dbms_output.put_line(v_name_in || ' reports to ' || v_name_out );
end;
/

variable v_mngr_name varchar2(10);

execute mgr_name('KING',v_mngr_name);

print v_mngr_name;