create table memberjoin(
    mem_id varchar2(20) not null,
    mem_pass varchar2(20) not null,
    mem_name varchar2(50) not null,
    mem_add1 varchar2(100),
    mem_add2 varchar2(100),
    mem_hp varchar2(15),
    constraint pk_member_join primary key(mem_id)
);

SELECT mem_id, mem_pass from member;

select * from MEMBERJOIN;

delete memberjoin where mem_pass='wkdusemfla2!';

insert into memberjoin (mem_id, mem_pass, mem_name, mem_add1, mem_add2, mem_hp) values(1,1,1,1,1,1);

select * from jdbc_board;


