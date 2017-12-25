select ename, sal 
from (select ename, sal 
      from emp 
	  where job not in ('SALESMAN','PRESIDENT') 
	  order by sal DESC) 
where rownum < 4;




select ename, sal 
from emp 
where job not in ('SALESMAN','PRESIDENT') 
and rownum < 4 
order by sal DESC;
