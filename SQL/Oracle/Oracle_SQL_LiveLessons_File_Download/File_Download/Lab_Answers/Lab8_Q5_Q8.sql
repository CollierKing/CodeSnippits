/**********************************************************************
 * File:	Lab8_Q5_Q8.sql
 * Type:	SQL*Plus script
 * Author:	Dan Hotka (www.DanHotka.com)
 * Date:	April 2015
 *
 * Description:
 *	Lab SQL for Pearson LiveLessons.
 *
 *
 * Modifications:
 *********************************************************************/


create view user0_emp10 as 
    select deptno, ename, sal
    from emp
    where deptno = 10;

grant select on user0_emp10 to scott;

create public synonym user0_emp10 for user0.user0_emp10;

select * from user0_emp10;

connect scott/tiger  --> should be able to select * from user0_emp10; and select * from user0.user0_emp10;