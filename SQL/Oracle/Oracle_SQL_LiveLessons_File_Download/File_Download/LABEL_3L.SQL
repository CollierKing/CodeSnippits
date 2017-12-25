set serveroutput on size 100000

set linesize 91;
set pagesize 60;
set echo off;
set termout off;
spool label_3L.out	 

DECLARE
cursor c_addr is
select substr(rtrim(first_name) || ' ' || rtrim(last_name),1,26), 
   substr(addr1,1,26),
   substr(addr2,1,26), 
   substr(rtrim(city) || ', ' || state || ' ' || rtrim(zip),1,26),
   substr(country,1,25)
from members
where good95 LIKE 'Y%' and addr2 is null
order by last_name;

full_name  char(26);
addr1      char(26);
addr2      char(26);
city_st_zip char(26);
country    char(25);
label_cnt  number(2) := 0;

line1      varchar2(90) := '   ';
line2      varchar2(90) := '   ';
line3      varchar2(90) := '   ';
line4      varchar2(90) := '.   ';
line5      varchar2(90) := '.   ';
line6      varchar2(90) := '.   ';

BEGIN

open c_addr;

loop
fetch c_addr into full_name, addr1, addr2, city_st_zip, country;
exit when c_addr%notfound;

label_cnt := label_cnt + 1;
if label_cnt = 4 then
   DBMS_OUTPUT.PUT_LINE (line1);
   DBMS_OUTPUT.PUT_LINE (line2);
   DBMS_OUTPUT.PUT_LINE (line3);
   DBMS_OUTPUT.PUT_LINE (line4);
   DBMS_OUTPUT.PUT_LINE (line5);
   DBMS_OUTPUT.PUT_LINE (line6);
   line1 := '   ';
   line2 := '   ';
   line3 := '   ';
   line4 := '.   ';
   line5 := '.   ';
   line6 := '.   ';
   label_cnt := 1;
end if;

line1 := line1 || full_name;
line2 := line2 || addr1;
line3 := line3 || city_st_zip;
line4 := line4 || country;

if label_cnt < 3 then
   line1 := line1 || '   ';
   line2 := line2 || '   ';
   line3 := line3 || '   ';
   line4 := line4 || '   ';
end if;


end loop;

close c_addr;
DBMS_OUTPUT.PUT_LINE (line1);
DBMS_OUTPUT.PUT_LINE (line2);
DBMS_OUTPUT.PUT_LINE (line3);
DBMS_OUTPUT.PUT_LINE (line4);
DBMS_OUTPUT.PUT_LINE (line5);
DBMS_OUTPUT.PUT_LINE (line6);

end;
/
spool off
exit
