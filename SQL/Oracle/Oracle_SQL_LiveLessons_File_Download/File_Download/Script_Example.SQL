
CLEAR SCREEN 
PROMPT
PROMPT <script name> Starting
PROMPT

SET LINESIZE 80
SET FEEDBACK OFF
SET VERIFY OFF
SET PAUSE OFF
SET TERMOUT OFF
SET HEADING OFF


ACCEPT in_user PROMPT 'Enter User -->'
ACCEPT in_pwd PROMPT 'Enter Password -->' hide
ACCEPT in_connect  PROMPT  'Enter connect string -->'

-- Next routine tests the connection and exits the script if something is wrong

SET ECHO OFF
SET TERMOUT ON

CONNECT &in_user/&in_pwd@&in_connect

SET TERMOUT OFF
SET ECHO OFF
SET FEEDBACK ON


WHENEVER SQLERROR EXIT
SET ECHO OFF
SET TERMOUT OFF
SELECT * FROM DUAL;
WHENEVER SQLERROR CONTINUE

SET TERMOUT ON
PROMPT
PROMPT LOGGED IN - continue with your script tasks ...
PROMPT


PROMPT Specify Tablespace information for the Camp_src schema.
PROMPT Enter a Default and Temporary tablespace name from the following list...

COL TABLESPACE_NAME FORMAT A30 HEADING "TS Name"
COL TOTAL_MB FORMAT 999,999,999.99 HEADING "Total Mb Avail" 

SET FEEDBACK OFF
SET HEADING ON

SELECT tablespace_name, SUM(bytes)/1024/1024 Total
  FROM sys.dba_free_space
  GROUP BY tablespace_name
/

PROMPT
ACCEPT TS_NAME PROMPT 'Default tablespace [USERS] : '

SET TERMOUT OFF
COL IN_TS NOPRINT new_value OUT_TS

SELECT DECODE('&TS_NAME','','USERS','&TS_NAME') IN_TS
FROM DUAL
/

REM ---------------------------------------------------------------------
REM Check USER tablespace is valid, if not exit
   
WHENEVER SQLERROR EXIT
SET ECHO OFF
SET TERMOUT OFF

SELECT * FROM DUAL
  WHERE NOT EXISTS  (SELECT NULL
                      FROM sys.dba_tablespaces
                      WHERE tablespace_name = UPPER('&user_tablespace'))

WHENEVER SQLERROR CONTINUE

SET TERMOUT ON
PROMPT
PROMPT Tablespace Name is valid - continue with your script tasks ...
PROMPT


--
-- put your creates/drops/inserts/starts/commits/create or replace/privs/stats/etc here
--
-- spool <script_name>,log




-- spool off
PROMPT
PROMPT <script name> Complete
PROMPT

