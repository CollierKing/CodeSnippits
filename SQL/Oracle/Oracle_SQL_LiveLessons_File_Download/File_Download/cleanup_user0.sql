SET HEADING OFF FEEDBACK OFF ECHO OFF VERIFY OFF SPACE 0 PAGESIZE 0 TERMOUT OFF


spool c:\temp\cleanup.sql
select 'drop table ' || table_name || ';' from user_tables;
spool off
start c:\temp\cleanup.sql
start demobld_lab_user0.sql


commit;

exit;