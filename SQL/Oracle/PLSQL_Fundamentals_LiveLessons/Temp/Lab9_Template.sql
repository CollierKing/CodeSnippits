
	alter table EXAMPLE_TABLE
	         add (insert_user      varchar2(10),  
	              insert_date      date    ,  
	              update_user      varchar2(10),  
	              update_date      date    ); 
	
	 create trigger DEPT_TRG
 	 before insert or update 
	     on EXAMPLE_TABLE
 	    for each row 
	 begin 
	  if :old.insert_user is null then 
 	     :new.insert_user   := USER; 
	     :new.insert_date   := SYSDATE; 
	     :new.update_user   := null; 
 	     :new.update_date   := null; 
 	   else  
	    :new.insert_user   := :old.insert_user; 
 	    :new.insert_date   := :old.insert_date; 
 	    :new.update_user   := USER; 
 	    :new.update_date   := SYSDATE; 
 	    end if; 
 	 end;  
	/
 	

