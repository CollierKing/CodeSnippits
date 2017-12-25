CREATE or REPLACE FUNCTION Lab7_func (v_DEPTNO NUMBER)
return varchar2
is

v_dname dept.dname%TYPE;

begin

select dname
into v_dname
from dept
where v_deptno = deptno;

return(v_dname);

EXCEPTION

when NO_DATA_FOUND then
   return('No Data Found');
when OTHERS then
   dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);

end;
/
