
create table test(id number(10), name VARCHAR2(50),start_date DATE);
desc test;
alter table test  Add job_desc VARCHAR2(200);
alter table test  drop COLUMN  job_desc ;
--# rename column name
alter table test  rename  COLUMN  name to first_name; 
--# alter table name
alter table test  rename  to  test_md; 
--# drop a table from databse
drop table test_md;

--# insert  one by into table
insert into test(id,name,start_date) values (1,'jitendra','04-JAN-2007');
insert into test(id,name,start_date) values (2,'manviya','04-02-2007');
insert into test(id,name,start_date) values (3,'mayra','04/03/2007');

--# insert  all values at onces, we need one dummy statment 
insert all
into test(id,name,start_date) values (4,'jitendra_1','04-JAN-2007')
 into test(id,name,start_date) values (5,'manviya_1','04-02-2007')
 into test(id,name,start_date) values (6,'mayra_1','04/03/2007')
 select * from dual;
 
 --# dummy select stattment to test 
 select * from dual;
select * from test;
select * from test_md;

