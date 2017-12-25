/**********************************************************************
 * File:        profiler_rpt.sql
 * Type:        SQL*Plus script
 * Author:      Dan Hotka
 * Date:        04-16-2009
 *
 * Description:
 *      SQL*Plus script to display the output from the PL/SQL Profiler.
 *      This script displays output and saves the output in profiler_rpt.txt
 *
 * Modifications:
 *	
 *********************************************************************/

SET TERMOUT OFF
CLEAR SCREEN 
SET LINESIZE 100
SET FEEDBACK OFF
SET VERIFY OFF
SET ECHO OFF
SET PAGESIZE 20
REM
SET TERMOUT ON
REM
PROMPT
PROMPT PL/SQL Profiler Report
PROMPT =========================================================================
PROMPT
PROMPT Enter the RunID from the list below when prompted 
PROMPT

REM -------------------------------------------------------------------------

REM SET TERMOUT OFF

column run_owner format a15
column run_comment format a25 wrap

SET TERMOUT ON

select runid, run_owner, run_date, 
round(run_total_time / 100000000000000,5) RUN_TIME, run_comment
from plsql_profiler_runs;

ACCEPT rpt_runid PROMPT 'Enter RunID from list above : ' 

SET TERMOUT ON

PROMPT
PROMPT =========================================================================
PROMPT
PROMPT Enter the Unit Number from the list below when prompted 
PROMPT

SET TERMOUT Off

column unit_name format a15
column unit_type format a15
column unit_owner format a15

SET TERMOUT ON

select runid, unit_number, unit_type, unit_owner, unit_name, unit_timestamp
from plsql_profiler_units
where unit_owner <> '<anonymous>'
and runid = &rpt_runid;

ACCEPT rpt_unitid PROMPT 'Enter Unit Number from list above : ' 

SET TERMOUT OFF

column text format a45 wrap;

SET TERMOUT ON


select pu.unit_name, pd.line#, pd.total_occur passes, 
round(pd.total_time / 10000000000,5) total_time, us.text text
from plsql_profiler_data pd, plsql_profiler_units pu, user_source us
where pd.runid = &rpt_runid
and pd.unit_number = &rpt_unitid
and pd.runid = pu.runid
and pd.unit_number = pu.unit_number
and us.name = pu.unit_name
and us.line = pd.line#
and us.type in ('PACKAGE BODY','PROCEDURE','FUNCTION');

SET TERMOUT OFF
spool profiler_rpt.txt

select '                          PL/SQL Profiler Output    Date: ' || sysdate from dual;

SET HEADING ON

select runid, run_owner, run_date, 
round(run_total_time / 10000000000,5) RUN_TIME, run_comment
from plsql_profiler_runs;

select runid, unit_number, unit_type, unit_owner, unit_name, unit_timestamp
from plsql_profiler_units
where unit_owner <> '<anonymous>'
and runid = &rpt_runid;

select pu.unit_name, pd.line#, pd.total_occur passes, 
round(pd.total_time / 10000000000,5) total_time,us.text text
from plsql_profiler_data pd, plsql_profiler_units pu, user_source us
where pd.runid = &rpt_runid
and pd.unit_number = &rpt_unitid
and pd.runid = pu.runid
and pd.unit_number = pu.unit_number
and us.name = pu.unit_name
and us.line = pd.line#
and us.type in ('PACKAGE BODY','PROCEDURE','FUNCTION');

spool off


