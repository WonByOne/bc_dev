-- employee_id 가 201번인 사람이 퇴사하기 전까지 같은 부서에 근무한 직원들의 
-- 사번 이름 부서 입사일을 출력한다. 
select * from job_history;

select employee_id 사번, last_name 성, department_id 이름, hire_date 입사일
    from employees
    where hire_date >= (select start_date from job_history where employee_id = 201)
        -- 입사일을 job_history 안에 있는 정보와 비교
        and hire_date < (select end_date from job_history where employee_id = 201)
        and department_id = 
            (select department_id from job_history where employee_id =201)
        and employee_id != 201;

--- on account 'joeun'
select * from tabs;

drop table test;
drop table test1;

--copy from hr/'Reccos@52525'@db202203302133_high:xe create test using select * from empolyees; --
copy from HR/hr@locahost create test using select * from empolyees; --

create table emp(
no number(4),
name varchar2(30),
sal number(8,2),
deno number(4)
);

desc emp;
select * from emp;
insert into emp values(300,'홍길동',5000,50);
insert into emp values(301,'이순신');  -- error : insufficient columns
    -- null 명시하는 방법
insert into emp values(301,'이순신',null,null);
    -- 순서나 개수가 다르면 컬럼명을 명시
insert into emp (name, no) values('김유신', 302);

create table test as select * from employees; -- employee 테이블 복사

-- insert into emp select * from test;
insert into emp select employee_id, last_name, salary, department_id from test;

-- update : 내용 수정
update emp set sal=9000 where no = 300; 
select * from emp;
update emp set sal=5000 where sal is null;

update emp set (sal, deno)
    = (select salary, department_id from test where last_name = 'Seo')
    where no in(300, 301, 302);

update emp set sal=5000, deno=90 where name='홍길동';

-- delete : 내용 지움
-- delete emp; -- from 생략 가능
delete from emp where name='홍길동';
select * from emp;
delete from emp where no in (select employee_id from test);

-- 트랜잭션

select * from tabs;
select * from emp;

create table te(
    no number(3),
    name varchar2(10)
);

select * from te;
insert into te values(1,'A'); -- 다른 DB connection(같은 계정)에서는 확인 불가
commit; -- 다른 접속(console 또는 SQL developer)으로 확인 해볼것

delete from te;
insert into te values(2, 'B');
savepoint b;
insert into te values(3, 'C');
savepoint c;
insert into te values(4, 'D');
savepoint d;

commit;

rollback b; 
rollback c;

commit; -- commit 하면 savepoint는 삭제

select * from te;
delete from te;
rollback;   -- 최종 commit 지점까지

drop table te;
rollback;   -- drop은 rollback 안됨

-- Constraints
create table te(
    id varchar2(30) constraint te_id_pk primary key,        -- id가 primary
    passwd varchar2(30) constraint te_passwd_nn not null,   -- password는 공백 불허
    tel varchar2(30) constraint te_tel_uk unique,           -- 전화번호 중복 불가    
    age number(3) constraint te_age_ch check(age between 0 and 150),-- 나이 범위
    address varchar2(100)
);

-- contraint 확인
select * from user_constraints; -- 모든 테이블
select * from user_constraints where table_name='TE'; -- TE 대문자로 할 것

-- not null
insert into te(tel, age, address) values('1111-2222', 30, '서울시'); -- id
insert into te(id, tel, age, address) values('aaa', '1111-2222', 30, '서울시'); -- passwd
insert into te(id, passwd) values ('aaa', '111');   -- available
select * from te;

-- primary key
insert into te(id, passwd) values('aaa', '222');    -- unique const. violated
insert into te(id, passwd) values('bbb', '111');    -- available

-- unique
select * from te;
insert into te(id, passwd, tel) values('ccc', '111', '1111-2222');
insert into te(id, passwd, tel) values('ddd', '111', '1111-2222'); -- violated

-- check
insert into te(id, passwd, tel, age)
    values('eee', '111', '2222-1111', 200); -- check const. violated
insert into te(id, passwd, tel, age)
    values('eee', '111', '2222-1111', -20); -- check const. violated
insert into te(id, passwd, tel, age)
    values('eee', '111', '2222-1111', 100); -- check available
select * from te;

desc te;

insert into te values('홍길동동홍길동홍길동홍길동', '111', '2222-3333', 20, '서울시');
    -- type size
insert into te values('홍길동', '111', '2222-3333', 1000, '서울시');
    -- type size : check 이전에 먼저 걸림
    
-- modify contraints
commit;
select * from te;

alter table te add address constraint te_address_nn not null; -- not add
alter table te modify address constraint te_address_nn not null; -- null values exist

update te set address='서울시';    -- change values to address
alter table te modify address constraint te_address_nn not null; -- now available

select * from user_constraints where table_name='TE';

insert into te values('fff', '111', '2222-2222', 30, null); -- cannot insert null

alter table te drop constraint te_address_nn;   -- remove constraint from address
insert into te values('fff', '111', '2222-2222', 30, null); -- now available

alter table te add(depart number(3) constraint te_depart_pk primary key);   
-- primary key exist

alter table te drop constraint te_id_pk;    -- remove pramary key
insert into te values('fff', '111', '2222-5555', 40, '수원시'); -- same id availabe

select * from te;
alter table te add constraint te_id_pk primary key(id); -- primary key violated


alter table te modify check(age between 0 and 90); -- check const. violated
alter table te modify check(age between 0 and 130);-- available


alter table te drop constraint te_age_ch; -- 이름이 바뀜 
select * from user_constraints where table_name='TE'; -- 확인
alter table te drop constraint sys_c0022074;

insert into te values('ggg', '111', '3333-1111', 200, '안산시'); -- check const.
alter table te add constraint te_age_ck check(age between 0 and 200);

alter table te drop constraint te_tel_uk;
alter table te add constraint te_tel_uk unique(tel);

-- 참조 무결성 제약조건
create table depart(
    deno number(3) primary key,
    dename varchar2(20) not null
);
insert into depart values(10, '경리부');
insert into depart values(20, '인사부');
insert into depart values(30, '관리부');
insert into depart values(40, '영업부');

select * from depart;
select * from te;

alter table te add(deno number(3) constraint te_deno_fk references depart(deno));
-- adding reference
update te set deno=50 where id='aaa';   -- integrity const. violated - parent key not found
update te set deno=10 where id='aaa';   -- available
update te set deno=20 where id='bbb';

insert into depart values(50, '생산부'); -- add parent key
update te set deno=50 where id='ccc';   
select * from te;

select * from user_constraints where table_name='TE';
alter table te drop constraint te_deno_fk; -- remove const.
update te set deno=100 where id='eee';      -- available : regardless from depart

alter table te add constraint te_deno_fk foreign key(deno) references depart(deno);
-- cannot validate : child record
update te set deno=50 where id='eee';
alter table te add constraint te_deno_fk foreign key(deno) references depart(deno);
-- now avaliable

drop table depart; -- unable due to constraint
drop table depart cascade constraint;   -- forced delete
select * from user_constraints where table_name='TE'; -- constraint가 남는다
purge recyclebin;   -- 남은 constraint 지우기
show recyclebin;

-- Sequence
select * from te;
alter table te drop column deno;
alter table te drop column age;
alter table te add (no number(3));

select * from user_sequences;
create sequence te_seq
    start with 1
    maxvalue 999999
    increment by 1
    nocycle -- maxvalue 이후 끝
    nocache;
    
select te_seq.nextval from dual; -- 다음 value 보여주고 하나 증가
select te_seq.currval from dual; -- 처음부터 실행하면 error

select * from te;
insert into te values('ddd', '111', '1111-3333', '서울시', te_seq.nextval);
insert into te values('ddd', '111', '1111-7777', '서울시', te_seq.nextval);

alter sequence te_seq   -- 한 번 사용한 sequence는 재정의, 수정할 수 없음
    start with 100
    maxvalue 999999
    increment by 10
    nocycle
    nocache;
    
-- 동의어 synonym
create synonym t for te;  -- insuff. privilege : 권한 없음

-- on system account
grant create synonym to joeun;

-- on account joeun
create synonym t for te; -- now available
select * from user_synonyms; -- check
drop synonym t;             -- remove


-- on system account
select dbms_xdb.gethttpport() from dual; --  port 확인
exec dbms_xdb.sethttpport(9000);        -- port 변경

select * from tabs;
drop table test;
drop table emp;
drop table te;

create table dep(
    deno number(3) primary key,
    dename varchar2(30) not null
);

insert into dep values(10, '인사부');
insert into dep values(20, '경리부');
insert into dep values(30, '영업부');
insert into dep values(40, '관리부');

select * from dep;

create table emp(
    id varchar2(30) primary key,
    name varchar2(30) not null,
    tel varchar2(20) not null,
    address varchar2(100),
    deno number(3) references dep(deno)
);

insert into emp values('aaa', '홍길동', '1111-2222', '서울시', 10);
insert into emp values('bbb', '김유신', '1111-2222', '수원시', 20);
insert into emp values('ccc', '이순신', '1111-2222', '안산시', 30);
insert into emp values('ddd', '강감찬', '1111-2222', '인천시', 10);

select * from emp;
select * from dep;

create table te 
as
select e.id 아이디, e.name 이름, e.tel 전화번호, d.dename 부서명
    from emp e, dep d
    where e.deno = d.deno;
    
select * from te;
select 아이디, 이름 from te;

create or replace view ve -- view 만들기
as
select e.id 아이디, e.name 이름, e.tel 전화번호, d.dename 부서명
from emp e, dep d
where e.deno = d.deno;

select * from user_views;
select * from ve;
select 아이디, 이름 from ve;

select * from emp;
select * from ve;

update ve set address='수원시' where 아이디='aaa'; -- view에 address 가 없다
update ve set 전화번호='9999-9999' where 아이디='aaa';
-- view를 통해 업데이트 하면 emp까지 바뀐다

delete from ve where 아이디='aaa'; -- 원본이 지워지

drop view ve;
select * from user_views;

show recyclebin;
purge recyclebin;

