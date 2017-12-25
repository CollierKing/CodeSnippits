/**********************************************************************
 * File:        start_index_monitoring.sql
 * Type:        SQL*Plus script
 * Author:      Dan Hotka
 * Date:        02-19-2010
 *
 * Description:
 *      SQL*Plus script to start index monitoring.  Use the Index_Monitor.sql script to see results.
 *      
 *
 * Modifications:
 *	
 *********************************************************************/

SET HEADING OFF FEEDBACK OFF ECHO OFF VERIFY OFF SPACE 0 PAGESIZE 0 TERMOUT OFF


spool Index_Monitor_setup.sql
select 'Alter Index ' || index_name || ' monitoring usage;' from user_indexes;

spool off
start Index_Monitor_setup.sql


SET HEADING ON FEEDBACK ON ECHO ON VERIFY ON  PAGESIZE 20 TERMOUT On

