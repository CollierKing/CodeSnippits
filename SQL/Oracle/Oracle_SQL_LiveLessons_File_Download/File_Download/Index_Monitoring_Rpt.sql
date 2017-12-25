SET TERMOUT OFF
rem CLEAR SCREEN 
SET LINESIZE 100
SET FEEDBACK OFF
SET VERIFY OFF
SET ECHO OFF
SET PAGESIZE 20
SET HEADING OFF
REM


/**********************************************************************
 * File:        Index_Monitoring_Rpt.sql
 * Type:        SQL*Plus script
 * Author:      Dan Hotka
 * Date:        04-16-2009
 *
 * Description:
 *      SQL*Plus script to display counts from v$object_usage for index monitoring.
 *          this script creates the Index_Monitoring_Rpt.txt file
 *
 * Modifications:
 *	
 *********************************************************************/


REM
SET TERMOUT ON
REM
PROMPT
PROMPT Index Monitoring Report
PROMPT =========================================================================
PROMPT


select to_char(sysdate,'mm/dd/yy hh:mi:ss') Date_Time from dual;
select 'Table Count = ' || count(*) from user_tables;
select 'Index Count = ' || count(*) from v$object_usage;
Select 'Indexes Used = ' || count(*) from v$object_usage where USED = 'YES';
select 'Indexes NOT Used = ' || count(*) from v$object_usage where USED = 'NO';



SET TERMOUT OFF
spool index_monitoring_rpt.txt

select '                          Index Monitoring Report    Date: ' || 
to_char(sysdate,'mm/dd/yy hh:mi:ss') from dual;

select 'Table Count = ' || count(*) from user_tables;
select 'Index Count = ' || count(*) from v$object_usage; 
Select 'Indexes Used = ' || count(*) from v$object_usage where USED = 'YES'
   and MONITORING = 'YES';
select 'Indexes NOT Used = ' || count(*) from v$object_usage where USED = 'NO'
   and MONITORING = 'YES';

spool off

SET HEADING ON FEEDBACK ON ECHO ON VERIFY ON  PAGESIZE 20 TERMOUT On


