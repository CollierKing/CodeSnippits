
	alter table DEPT
	         add (inserted_by      varchar2(10),  
	              inserted_date        date    ,  
	              updated_by       varchar2(10),  
	              updated_date         date    ); 
	
	 create or replace trigger Lab9_trg
 	 before insert or update 
	     on DEPT
 	    for each row 
	 begin 
	  if INSERTING then 
 	     :new.inserted_by   := USER; 
	     :new.inserted_date := SYSDATE; 
	     :new.updated_by    := null; 
 	     :new.updated_date  := null; 
 	   else  
	    :new.inserted_by   := :old.inserted_by; 
 	    :new.inserted_date := :old.inserted_date; 
 	    :new.updated_by    := USER; 
 	    :new.updated_date  := SYSDATE; 
 	    end if; 
 	 end;  
	/
	
	insert into dept (deptno, dname, loc) values (50,'DEV','DES MOINES');
	
	update dept set dname = 'ACCT' where deptno = 10;
	
	select * from dept;
 	

