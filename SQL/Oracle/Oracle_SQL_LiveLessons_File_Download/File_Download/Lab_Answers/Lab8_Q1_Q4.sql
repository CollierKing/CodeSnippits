/**********************************************************************
 * File:	Lab8_Q1_Q4.sql
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


create sequence user0_seq
start with 200
increment by 20;


select user0_seq.nextval from dual;

select user0_seq.currval from dual;

drop sequence user0_seq;


