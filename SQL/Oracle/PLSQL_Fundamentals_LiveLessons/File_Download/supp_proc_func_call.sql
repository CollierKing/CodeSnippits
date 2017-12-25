create or replace procedure supp_oh_gee2 (v_prod_num number)
is
v_out varchar2(30);
v_prod_name product.product_name%TYPE;


begin

select product_name 
into v_prod_name
from product 
where product_id = v_prod_num;

v_out := supp_name2(v_prod_name);
dbms_output.put_line('Supplier of ' || v_prod_name || ' is: ' || v_out);

exception
when no_data_found then
   dbms_output.put_line(' no rows found ');

end;
/
