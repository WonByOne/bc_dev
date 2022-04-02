select * from tabs;


-- select

select * from employees;

desc employees;

select employee_id, first_name, salary from employees;

-- 연산자
select last_name, salary + 1000 from employees;

-- 10% 인상
select last_name, salary*1.1 from employees;
select last_name, salary + salary*0.1 from employees;

-- alias
select last_name as 성, salary as 월급, salary*1.1 as "인상된 월급" from employees;    -- alias에서는 특수문자 " "
select last_name 성, salary 월급, salary*1.1 "인상된 월급" from employees;             -- as 생략 가능

-- null
-- sql에서는 할당, 연산, 비교가 안된다

-- concatenation ||
select employee_id 사번, first_name, last_name 이름 from employees;
select employee_id 사번, first_name||last_name 이름 from employees;
select employee_id 사번, first_name||' '||last_name 이름 from employees;    -- 문자열은 ' '

-- distinct 
select job_id from employees;
select distinct job_id from employees;  -- 중복 제거

-- where
select last_name 성, salary 월급 from employees
    where salary >= 10000;                      -- 월급 10000 이상
select last_name 성, salary 월급 from employees
    where last_name = 'King';

select last_name 성, hire_date 입사일 from employees
    where hire_date > '01/JAN/05'; -- 월이 문자임
    
-- like 
select last_name 성, salary 월급 from employees
--    where last_name = 'King';
--    where last_name like 'King';
    where last_name like 'K%';  -- K로 시작
select last_name 성, salary 월급 from employees
    where last_name like '%n%'; -- 중간에 n 하나만 있으면    
select last_name 성, salary 월급 from employees
    where last_name like '_o%'; -- 두 번재 글자가 o인 사람, ?o*의 의미
select last_name 성, job_id 업무 from employees
--    where job_id like 'IT_PROG';
    where job_id like '%\_P%' escape '\';   -- escape 문자를 지정

-- 논리연산자
select last_name 성, salary 월급 from employees
--    where salary >= 10000 and salary <= 15000;
    where salary between 10000 and 15000;   -- 이상 ~ 이하만 가능 미만 ~ 초과 불가
    
select last_name 성, department_id 부서 from employees
--    where department_id = 50 or department_id = 80 or department_id = 90;
    where department_id in (50, 80, 90);
    
-- 2005 상반기 입사자
select last_name||', '||first_name 이름, hire_date 입사일 from employees
--    where hire_date >= '01/jan/05' and hire_date <= '30/jun/05';
    where hire_date between '01/jan/05' and '30/jun/05';    