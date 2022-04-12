select * from tabs;

-- JDBC 연습용 테이블
create table dbtest(
id varchar2(30) primary key,
passwd varchar2(30) not null,
name varchar2(30) not null,
tel varchar2(20),
logtime date default sysdate
);

insert into dbtest values('aaa', '111', '홍길동', '1111-2222', sysdate);
insert into dbtest values('bbb', '111', '김유신', '2222-2222', sysdate);
insert into dbtest values('ccc', '111', '이순신', '3333-2222', sysdate);
insert into dbtest values('ddd', '111', '강감찬', '1111-3333', sysdate);
insert into dbtest values('eee', '111', '대조영', '1111-1111', sysdate);
commit;

select * from dbtest;

