/**********************************************************************
 * File:        cleanup_profiler.sql
 * Type:        SQL*Plus script
 * Author:      Dan Hotka
 * Date:        04-16-20109
 *
 * Description:
 *      SQL*Plus script to clean out the 3 profiler tables
 *
 * Modifications:
 *	
 *********************************************************************/


delete from plsql_profiler_data;
delete from plsql_profiler_units;
delete from plsql_profiler_runs;
commit;


