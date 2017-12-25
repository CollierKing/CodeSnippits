
create or replace function mgr_name_func (v_empno_in IN emp.empno%TYPE)
RETURN varchar2
is

v_name_out   varchar2(30);

begin

select m.ename
into v_name_out
from emp e, emp m
where e.empno = v_empno_in
and e.mgr = m.empno;

return v_name_out;

exception
when NO_DATA_FOUND then
  return ' no data found ';

when others then
  return(' no data found ');

end;
/




variable v_mngr_name varchar2(10);

v_mngr_name := mgr_name('KING');

print v_mngr_name;
