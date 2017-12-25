/**********************************************************************
 * File:	Lab7_Q1.sql
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


create table EMP10 as 
  select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
  from EMP
  where DEPTNO = 10;

create table EMP20 as 
  select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
  from EMP
  where DEPTNO = 20;
  
  create table EMP30 as 
    select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
    from EMP
  where DEPTNO = 30;