create or replace function my_func2 (v_Person_ID NUMBER)
return varchar2
is
first_name sales_person.first_name%TYPE;
last_name sales_person.last_name%TYPE;
whole_name varchar2(40);
begin
select first_name, last_name
into first_name,last_name
from sales_person
where sales_person_id = v_Person_ID;
return(first_name || ' ' || last_name);
end;
/
