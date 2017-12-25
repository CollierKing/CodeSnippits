Declare
   TYPE t_emp IS TABLE OF emp%rowtype;
    g_emp t_emp;
Begin
    g_emp := t_emp();
  FOR i IN (SELECT *
            FROM   emp)
  LOOP
    g_emp.extend;
    g_emp(g_emp.last) := i;
  END LOOP;

For cnt IN g_emp.FIRST..g_emp.LAST 
LOOP
    dbms_output.put_line(g_emp(cnt).ename || ' makes ' || g_emp(cnt).sal);
END LOOP;
END;

