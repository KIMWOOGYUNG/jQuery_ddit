--�÷��߰�
alter table memberjoin add mem_gender varchar(10) null;
alter table memberjoin add mem_birth varchar(20) null;
alter table memberjoin add mem_email varchar(40) null;
alter table memberjoin add mem_zipNo int null;

--�÷�����
alter table memberjoin drop column mem_birth;
alter table memberjoin drop column mem_gender;
alter table memberjoin drop column email;

select count(*) cnt from memberjoin where mem_id='kwk950807';

select * from memberjoin;

insert into memberjoin (mem_id, mem_pass, mem_name, mem_gender, mem_email, mem_birth, mem_hp) values('kwk950807',1,1,1,1,1,1);

DELETE FROM memberjoin WHERE  mem_gender= '����';
DELETE FROM memberjoin WHERE  mem_pass= 'qwe';