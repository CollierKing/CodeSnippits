drop table emp;
drop table dept;

CREATE TABLE DEPT (
 DEPTNO              NUMBER(2) NOT NULL,
 DNAME               VARCHAR2(14),
 LOC                 VARCHAR2(13),
 CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY (DEPTNO));

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4),
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) NOT NULL,
 CONSTRAINT EMP_FOREIGN_KEY FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
 CONSTRAINT EMP_PRIMARY_KEY PRIMARY KEY (EMPNO));

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'1-MAY-81',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'9-JUN-81',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'2-APR-81',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'8-SEP-81',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'3-DEC-81',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'3-DEC-81',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'09-DEC-82',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'12-JAN-83',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10);


drop table company_customers;
drop table company_sales;
create table company_customers 
   (cust_id number, 
    cust_name varchar2(10), 
    cust_city varchar2(10));
create table company_sales 
   (cust_id number, 
    sales_name varchar2(10), 
    sales_amount number(6), 
    sales_date date);
insert into company_customers values (10,'Dan','Des Moines');
insert into company_customers values (20,'Libby', 'Atlanta');
insert into company_customers values (30,'Janet','Woodland');
insert into company_customers values (40,'Emily','Omaha');
insert into company_customers values (50,'Thom','Windsor');
insert into company_customers values (60,'Robin','Denver');
insert into company_sales values (10,'Greg',13500,'01-JUL-12');
insert into company_sales values (20,'Matt',800,'01-JUL-12');
insert into company_sales values (10,'Greg',12500,'01-JUL-12');
insert into company_sales values (20,'Matt',9000,'01-JUN-12');
insert into company_sales values (30,'Greg',7000,'01-MAY-12');
insert into company_sales values (40,'Greg',3500,'01-APR-12');
insert into company_sales values (50,'Jeff',11000,'01-MAR-12');
insert into company_sales values (60,'Stan',11500,'01-FEB-12');
insert into company_sales values (10,'Greg',12500,'01-APR-12');
insert into company_sales values (40,'Jeff',1250,'01-APR-12');
insert into company_sales values (10,'Kevin',12500,'01-JUL-12');
insert into company_sales values (20,'Jeff',800,'01-JUL-12');
insert into company_sales values (10,'Greg',15000,'01-JUL-12');
insert into company_sales values (20,'Jeff',5500,'01-JUN-12');
insert into company_sales values (30,'Greg',8000,'01-MAY-12');
insert into company_sales values (40,'Greg',1500,'01-APR-12');
insert into company_sales values (50,'Matt',12000,'01-MAR-12');
insert into company_sales values (60,'Greg',6000,'01-FEB-12');
insert into company_sales values (10,'Matt',10500,'01-APR-12');
insert into company_sales values (40,'Jeff',1500,'01-APR-12');
insert into company_sales values (10,'Greg',10000,'01-JUL-12');
insert into company_sales values (20,'Jeff',1250,'01-JUL-12');
insert into company_sales values (10,'Greg',15550,'01-JUL-12');
insert into company_sales values (20,'Jeff',4000,'01-JUN-12');
insert into company_sales values (30,'Greg',9000,'01-MAY-12');
insert into company_sales values (40,'Greg',3000,'01-APR-12');
insert into company_sales values (50,'Jeff',8000,'01-MAR-12');
insert into company_sales values (60,'Greg',10500,'01-FEB-12');
insert into company_sales values (10,'Greg',10250,'01-APR-12');
insert into company_sales values (40,'Jeff',2000,'01-APR-12');

commit;


purge recyclebin;

exec dbms_stats.gather_schema_stats(USER,cascade => true);



commit;

exit; 

