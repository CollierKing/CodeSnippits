set ECHO OFF
set TERMOUT OFF
set FEEDBACK OFF
set VERIFY OFF
set PAGESIZE 0
set LINESIZE 80
set HEADING OFF
spool cre_dbtrg.sql
select 	RPAD( '  alter table ' || TABLE_NAME || null,80),
	RPAD( '         add (inserted_by      varchar2(10), ' || null,80),
	RPAD( '              inserted_date        date    , ' || null,80),
	RPAD( '              updated_by       varchar2(10), ' || null,80),
	RPAD( '              updated_date         date    ); ' || null,80)
from USER_TABLES;
select 	RPAD(' create trigger trg_' || TABLE_NAME || null,80),
	RPAD(' before insert or update ' || null,80),
	RPAD('     on ' || TABLE_NAME || null,80),
 	RPAD('    for each row ' || null,80),
	RPAD(' begin ' || null,80),
 	RPAD('  if :old.inserted_by is null then ' || null,80),
 	RPAD('    :new.inserted_by   := USER; ' || null,80),
	RPAD('    :new.inserted_date := SYSDATE; ' || null,80),
	RPAD('    :new.updated_by    := null; ' || null,80),
 	RPAD('    :new.updated_date  := null; ' || null,80),
 	RPAD('   else ' || null,80),
 	RPAD('    :new.inserted_by   := :old.inserted_by; ' || null,80),
 	RPAD('    :new.inserted_date := :old.inserted_date; ' || null,80),
 	RPAD('    :new.updated_by    := USER; ' || null,80),
 	RPAD('    :new.updated_date  := SYSDATE; ' || null,80),
 	RPAD('    end if; ' || null,80),
 	RPAD(' end; ' || null,80),
	RPAD( '/' || null,80)
from USER_TABLES;
spool off
set FEEDBACK ON
set TERMOUT ON
set VERIFY ON
set ECHO ON
spool dbtrg.log
rem start dbtrg.sql
spool off
exit
