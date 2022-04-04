select * from tabs;

-- 과제 2
select d.department_name 부서명, l.city 도시, c.country_name 국가, r.region_name 대륙
    from departments d, locations l, countries c, regions r
        where d.location_id = l.location_id
            and l.country_id = c.country_id
            and c.region_id = r.region_id
    order by r.region_id, c.country_name, l.city, d.department_name;

select d.department_name 부서명, l.city 도시, c.country_name 국가, r.region_name 대륙
    from departments d
    join locations l
        on d.location_id = l.location_id
    join countries c
        on l.country_id = c.country_id
    join regions r
        on c.region_id = r.region_id
    order by r.region_id, c.country_name, l.city, d.department_name;
    
-- 과제 3
select e.employee_id 사번, e.last_name||', '||e.first_name 이름, j.job_title 업무명,
d.department_name 부서명, h.start_date 전입, h.end_date 전출
    from job_history h, employees e, jobs j, departments d
    where h.employee_id = e.employee_id
        and h.job_id = j.job_id
        and h.department_id = d.department_id; 

select e.employee_id 사번, e.last_name||', '||e.first_name 이름, j.job_title 업무명,
d.department_name 부서명, h.start_date 전입, h.end_date 전출
    from job_history h
    join employees e
        on h.employee_id = e.employee_id
    join jobs j
        on h.job_id = j.job_id
    join departments d
        on h.department_id = d.department_id;
        
-- union
select last_name 성, salary 급여 from employees where salary >= 8000       -- 36명
union   -- 합집합
select last_name 성, salary 급여 from employees where department_id = 80;  -- 34명

-- intersect 교집합
select last_name 성, salary 급여 from employees where salary >= 8000 and department_id = 80
INTERSECT   -- 22명
select last_name 성, salary 급여 from employees where department_id = 80;

-- minus 차집합
select last_name 성, salary 급여 from employees where salary >= 8000
minus   -- 차집합 -- 36-22=14명
select last_name 성, salary 급여 from employees where department_id = 80;

-- sub query
select department_id from employees where last_name='Seo';
select department_name from departments where department_id = 50;

select d.department_name    
    from employees e, departments d -- join
    where e.department_id = d.department_id and e.last_name = 'Seo';
    
select department_name from departments 
    where department_id =
        (select department_id from employees where last_name = 'Seo'); -- sub
        
select last_name 성, avg(salary) from employees;
select last_name 성, avg(salary) over() from employees;  -- unable
select last_name 성, (select avg(salary) from employees) from employees; -- sub

select last_name 성, salary from employees
--    where salary > avg(salary); -- unable
    where salary > (select avg(salary) from employees); -- sub
    
select 성, 급여
from (select last_name 성, salary 급여 from employees where department_id = 80);

select last_name 성, salary 급여 from employees
    where(employee_id, department_id)   -- 인수의 개수를 맞춰야 한다?
    = (select employee_id, department_id from employees where employee_id=100);

--  이름 연봉 평균연봉(2500이하인 사람의 평균) 출력
--  연봉이 2500 이하인 사람들 출력

select last_name 성, salary 급여,
    (select round(avg(salary),2) from employees where salary <= 2500) 평균급여
    from employees where salary <= 2500;
    
--    100번 부서 직원들의
--    이름 연봉 최고연봉(100번부서중) 최저연봉 연봉-평균연봉 출력

select last_name 성, salary 급여,   
    (select max(salary) from employees where department_id=100) 최고급여,
    (select min(salary) from employees where department_id=100) 최고급여,
    trunc((salary - (select avg(salary) from employees where department_id=100))) 급여차
    from employees where department_id = 100;
    
-- 다중행 서브쿼리
select department_name 부서명 from departments where department_id in  -- 등호를 사용하지 못한다.
    (select department_id from employees where last_name = 'King');     -- 서브쿼리 행이 2개라서 error
    
select last_name 성, salary 급여 from employees
    where salary > all (select salary from employees where department_id=100); -- select 최고값보다 커야함
--  where salary > select max(salary) from employees where department_id=100); -- 같은 결과

select last_name 성, salary 급여 from employees
 where exists(select * from employees where department_id = 100);   -- 결과가 있으면 외부 query 실행

-- last_name 이 King 인 사람들 중에 
--    한 명보다도 많은 급여를 받는 사람의 이름과 연봉를 출력
--    last_name 이 King 인 사람들 중에 
--    둘 다 보다 많은 급여를 받는 사람의 이름과 연봉를 출력

select last_name 성, salary 급여 from employees
    where salary > any (select salary from employees where last_name = 'King')
        and last_name != 'King';

-- Russell과 job_id 가 같은 사람의 이름, 부서명, 도시를 출력한다.
-- Russell은 제외. 부서명과 도시는 join으로.
select e.last_name 성, d.department_name 부서명, l.city 도시
    from employees e, departments d, locations l
        where e.department_id = d.department_id
            and d.location_id = l.location_id
            and e.job_id =
                (select job_id from employees where last_name ='Russell')
            and e.last_name != 'Russell';

select e.last_name 성, d.department_name 부서명, l.city 도시
    from employees e
    join departments d
        on e.department_id = d.department_id
    join locations l
        on d.location_id = l.location_id
    where e.job_id =
        (select job_id from employees where last_name ='Russell')
        and e.last_name != 'Russell';

-- 부서가 위치한 도시가 Toronto 인 직원들의 사번, 이름을 출력한다. 
-- 서브 쿼리 추가 사용.  
select employee_id 사번, last_name 성 from employees
    where department_id =
        (select department_id from departments where location_id =
            (select location_id from locations where city = 'Toronto'));
            
-- 급여 등급이 4등급인 사람들의 이름, 급여를 모두 출력한다.
-- 서브 쿼리를 써서 해결한다.
select last_name 성, salary 급여 from employees
    where salary <= (select hisal from salgrade where grade = 4)
        and salary > (select losal from salgrade where grade = 4);
        
-- 유럽대륙에 근무하는 사람들의 이름(last_name)과 부서(department_id) 출력
-- Join / SubQuery 각각 실행	   

select e.last_name 성, e.department_id 부서 from employees e
    join departments d
        on e.department_id = d.department_id
    join locations l
        on d.location_id = l.location_id
    join countries c
        on l.country_id = c.country_id
    join regions r
        on c.region_id = r.region_id
    where r.region_name = 'Europe';
    
select last_name 성, department_id 부서 from employees
    where department_id
        in (select department_id from departments where location_id
            in (select location_id from locations where country_id
                in (select country_id from countries where region_id
                    in (select region_id from regions where region_name = 'Europe'))));

-- 각 부서에서 가장 오래 근무한 사람 중 연봉이 제일 적은 사람을 진급시켜려고 한다.
--  해당 직원의 이름과 연봉, 입사일, 부서를 출력한다. 
--  from 뒤에 SubQuery 사용. SubQuery를 겹쳐서 구성
    
select e.last_name 성, e.salary 급여, e.hire_date 입사일, d.department_id 부서
    from employees e
    join departments d
        on e.department_id = d.department_id
    join ( (select min(hire_date) 입사일 from employees group by department_id)) j
        on e.hire_date = j.입사일;

define d = 'select min(hire_date) from employees group by department_id';
select last_name 성, salary 급여, hire_date 입사일, department_id 부서
    from employees
    where salary = (select min(salary) from  -- 그중 제일 작은 급여
        (select salary from employees where hire_date in  -- 그 입사일에 입사한 사람의 급여
            (&d))) -- 그룹별로 가장 오랜된 입사일
    and hire_date in (&d);
        
select last_name 성, salary 급여, department_id 부서
    from employees
        where hire_date = (select min(hire_date) from employees);

--  50번 부서 직원들의 연봉을 내림차순한 후 누적연봉을 구한다. 
--  from 뒤에 SubQuery 사용        
select e.employee_id 사번, e.last_name 성, e.department_id 부서, e.salary 급여,
    sum(m.salary) 누적급여
    from (select * from employees where department_id = 50) e, 
        (select * from employees where department_id = 50) m
    where e.employee_id >= m.employee_id
    group by e.employee_id, e.last_name, e.department_id, e.salary
        -- from의 두 테이블을 합집합으로 만들어주는 역할..
    order by  e.employee_id;
    
select * from all_users;
select * from tabs;


---------------
-- ddl 
-- create
create table test1(
eno number(4),
ename varchar2(30),
esal number(8,2)
);
create table test as select * from employees;
create table test2 as select * from test1;          -- 내용만 복사
desc test2;

create table test3 as select * from test1 where 1=0; -- 구조만 복사

select * from test3;
select * from test2;
-- drop table test3; 지우기

-- alter
desc test1; -- 데이터 없는 경우
alter table test1 add(tel varchar2(30));
alter table test1 modify(eno varchar2(20)); -- 자료형 바꾸기
alter table test1 modify(eno varchar2(10));


desc test; -- 데이터 있는 경우
alter table test modify(employee_id varchar2(20)); -- 바꾸는 것 안됨
alter table test modify(first_name varchar2(10));   -- 줄이는 것 안됨
alter table test modify(first_name varchar2(30));   -- 늘이는 것은 가능

desc test1;
alter table test1 drop column tel; -- 컬럼 없애기

desc test;
alter table test drop column phone_number;
alter table test set unused(email); -- 컬럼 비활성화
select * from user_unused_col_tabs;
alter table test drop unused columns; -- 비활성 컬럼 삭제 -- compressed table이라 불가
ALTER TABLE test MOVE NOCOMPRESS; -- nocompress로 바꾸기
ALTER TABLE test MOVE COMPRESS; -- 다시 compress 하기


select * from tabs;
    
drop table test1; -- 삭제
drop table test2;
drop table test3;

show recyclebin; 

flashback table test1 to before drop;
select * from tabs;
purge recyclebin; -- 휴지통 비우기


-- employee_id 가 201번인 사람이 퇴사하기 전까지
-- 같은 부서에 근무한 직원들의 
-- 사번 이름 부서 입사일을 출력한다. 
select employee_id 사번, last_name 성, department_id 이름, hire_date 입사일
    from employees
    where hire_date >= (select start_date from job_history where employee_id = 201)
        -- 입사일을 job_history 안에 있는 정보와 비교
        and hire_date < (select end_date from job_history where employee_id = 201)
        and department_id = 
            (select department_id from job_history where employee_id =201)
        and employee_id != 201;
    
select * from job_history;

