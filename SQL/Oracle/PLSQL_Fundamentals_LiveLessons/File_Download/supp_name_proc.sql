create or replace procedure supp_name (v_name_in IN varchar2,
                                       v_name_out OUT varchar2)
is
begin

select supplier_name
into v_name_out
from product
where product_name = v_name_in;

exception
  when others then
  v_name_out := ' no data dummy ';
  raise;

end;
/
