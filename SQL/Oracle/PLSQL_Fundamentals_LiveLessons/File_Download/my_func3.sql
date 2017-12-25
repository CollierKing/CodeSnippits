create or replace function my_func3
return number(6)
is
v_ename emp.ename%TYPE;
v_job emp.job%TYPE;
begin
select ename, job
into v_ename,v_job
from emp
where empno = 7839;
return(v_ename || ' ' || v_job);
end;
/

