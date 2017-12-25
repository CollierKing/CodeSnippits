column INSTANCE_ID new_value INST_ID noprint
select HOST_NAME || ':' || INSTANCE_NAME || ':' || USER || '> ' INSTANCE_ID
from sys.v_$instance
/
set SQLPROMPT &&INST_ID

