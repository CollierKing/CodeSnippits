create or replace function my_func
return varchar2
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



declare

v_name_job  varchar2(40);

begin

v_name_job := my_func();

dbms_output.put_line(v_name_job);

end;
/