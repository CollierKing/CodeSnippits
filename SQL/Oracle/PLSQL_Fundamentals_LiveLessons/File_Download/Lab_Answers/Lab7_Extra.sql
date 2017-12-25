CREATE or REPLACE FUNCTION Lab7_Extra (v_DEPTNO NUMBER)
return number
is

v_sum number(8);

v_oraerr number(10);
v_oramsg varchar2(1200);

begin
select sum(sal)
into v_sum
from emp
where v_deptno = deptno;

return(v_sum);

EXCEPTION

when NO_DATA_FOUND then
   return(1);
  when OTHERS then
   return(1);

end;
/
