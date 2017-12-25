

Drop table Multi_key_Tbl1;
Drop table Multi_key_tbl2;

create table multi_key_tbl1 (
    key1    number(5),
    key2    number(5),
    key3    number(5),
    sales_tot number(7,2)
    );
    
create table multi_key_tbl2 (
    key1    number(5),
    key2    number(5),
    key3    number(5),
    ename   varchar2(20)
    ); 
    


DECLARE 
   loop_counter   NUMBER := 0;
BEGIN
   FOR rec IN (SELECT *
                 FROM emp)
   LOOP
      insert into multi_key_tbl2 values (30, 300, rec.empno, rec.ename);
      FOR key1_counter in 1 .. 50
      LOOP
         loop_counter := 0;
         FOR key2_counter in 200 .. 400
         LOOP
            loop_counter := 0;
            insert into multi_key_tbl1 values (key1_counter, key2_counter, rec.empno,
                round(rec.sal *.025) );
            commit;
         END LOOP;
      END LOOP;
   END LOOP;
   commit;
END;
/

create index Multi_key_Tbl1_key1 on multi_key_tbl1 (key1);
create index Multi_key_Tbl1_key2 on multi_key_tbl1 (key2);
create index Multi_key_Tbl1_key3 on multi_key_tbl1 (key3);
create index Multi_key_Tbl1_key123 on multi_key_tbl1 (key1,key2,key3);


