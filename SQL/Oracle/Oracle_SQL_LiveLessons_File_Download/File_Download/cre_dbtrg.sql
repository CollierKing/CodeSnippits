  alter table BONUS                                                             
         add (inserted_by      varchar2(10),                                    
              inserted_date        date    ,                                    
              updated_by       varchar2(10),                                    
              updated_date         date    );                                   
                                                                                
  alter table DEPT                                                              
         add (inserted_by      varchar2(10),                                    
              inserted_date        date    ,                                    
              updated_by       varchar2(10),                                    
              updated_date         date    );                                   
                                                                                
  alter table EMP                                                               
         add (inserted_by      varchar2(10),                                    
              inserted_date        date    ,                                    
              updated_by       varchar2(10),                                    
              updated_date         date    );                                   
                                                                                
  alter table SALGRADE                                                          
         add (inserted_by      varchar2(10),                                    
              inserted_date        date    ,                                    
              updated_by       varchar2(10),                                    
              updated_date         date    );                                   
                                                                                

 create trigger trg_BONUS                                                       
 before insert or update                                                        
     on BONUS                                                                   
    for each row                                                                
 begin                                                                          
  if :old.inserted_by is null then                                              
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
                                                                                
 create trigger trg_DEPT                                                        
 before insert or update                                                        
     on DEPT                                                                    
    for each row                                                                
 begin                                                                          
  if :old.inserted_by is null then                                              
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
                                                                                
 create trigger trg_EMP                                                         
 before insert or update                                                        
     on EMP                                                                     
    for each row                                                                
 begin                                                                          
  if :old.inserted_by is null then                                              
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
                                                                                
 create trigger trg_SALGRADE                                                    
 before insert or update                                                        
     on SALGRADE                                                                
    for each row                                                                
 begin                                                                          
  if :old.inserted_by is null then                                              
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
                                                                                

