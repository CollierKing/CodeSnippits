CREATE or REPLACE FUNCTION Lab7_func (v_DEPTNO NUMBER)
return varchar2
is

v_dname dept.dname%TYPE;


begin

**Insert necessary code here **

EXCEPTION

when NO_DATA_FOUND then
   return('No Data Found');

when OTHERS then
   return('Oracle Error: ' || SQLCODE);

end;
/
