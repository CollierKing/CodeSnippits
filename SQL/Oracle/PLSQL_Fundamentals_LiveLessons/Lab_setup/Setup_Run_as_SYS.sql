

connect system/manager@xe


create or replace directory TEMPDIR as 'C:\Temp';

grant read, write on directory tempdir to public;

create public synonym PLAN_TABLE for sys.plan_table$;

create user user0 identified by user0 
default tablespace users temporary tablespace temp profile default;
grant select any table to user0;
grant create session  to user0;
grant resource, dba to user0;
grant connect to user0;



grant debug connect session to public;
grant debug any procedure to public;

alter profile default limit failed_Login_attempts unlimited password_lifetime unlimited;

noaudit all;

delete from sys.aud$;

connect sys/manager@xe as sysdba;


-- edit this line to point to <oracle_home>/rdbms/admin --
-- ONLY DO THIS for Oracle9i --> start profload.sql

GRANT EXECUTE ON DBMS_ALERT TO user0;
GRANT CONNECT, RESOURCE,  QUERY REWRITE TO user0;
GRANT CREATE JOB TO user0;
GRANT CREATE TYPE TO user0; 
GRANT CREATE SESSION TO user0;
GRANT SELECT_CATALOG_ROLE TO user0;
GRANT EXECUTE ON UTL_FILE TO user0;
GRANT EXECUTE ON UTL_HTTP TO user0;
GRANT EXECUTE ON UTL_TCP TO user0;
GRANT EXECUTE ON DBMS_ALERT TO user0;
GRANT EXECUTE ON DBMS_DDL TO user0;
GRANT EXECUTE ON DBMS_JOB TO user0;
GRANT EXECUTE ON DBMS_LOB TO user0;
GRANT EXECUTE ON DBMS_LOCK TO user0;
GRANT EXECUTE ON DBMS_OUTPUT TO user0;
GRANT EXECUTE ON DBMS_PIPE TO user0;
GRANT EXECUTE ON DBMS_RANDOM TO user0;
GRANT EXECUTE ON DBMS_REFRESH TO user0;
GRANT EXECUTE ON DBMS_SESSION TO user0;
GRANT EXECUTE ON DBMS_SNAPSHOT TO user0;
GRANT EXECUTE ON DBMS_SQL TO user0;
GRANT EXECUTE ON DBMS_STATS TO user0;
GRANT EXECUTE ON DBMS_UTILITY TO user0;
GRANT ALTER SESSION to user0;
grant create any table to user0;

grant unlimited tablespace to user0;

alter user user0 profile default;




spool off;

exit;
