-- 사번 이름 근속연수(소수점 버림) 수당 연봉 입사일을 출력 
-- 수당은 근속연수 * 1000 + @
-- @ : 1년이 안 된 근무 개월 수를 계산해서 3개월당 추가로 250씩 더한다.
-- 	3개월 미만 250
--	3개월     500
-- 	6개월     750			
--	9개월 이상 1000

define m = 'mod(months_between(sysdate, hire_date),12)'; -- 근속년(만근) 제외한 근무개월
define y = '(trunc(months_between(sysdate, hire_date)/12))'; -- 근속년 (만근)
select employee_id 사번, last_name 성, hire_date 입사일, &y+1 근속연수,
--     case when &m >= 9 then &y*1000+1000
--         when &m >= 6 then &y*1000+750
--         when &m >= 3 then &y*1000+500
--         when &m > 0 then &y*1000+250        
--         else &y*1000
    &y*1000+
    case when &m >= 9 then 1000     -- 수식 뒤에 case를 사용하는 것도 가능
         when &m >= 6 then 750
         when &m >= 3 then 500
         when &m > 0 then 250        
         else 0
    end 근속수당,
    salary 급여
    from employees order by 근속수당;   -- 새로 계산한 항목을 기준으로 하는 경우가 많음
    
-- group by 확장
select department_id 부서, job_id 업무, round(avg(salary),2) 평균급여 from employees
    group by department_id, job_id          -- (a, b)
    order by department_id;
    
select department_id 부서, job_id 업무, round(avg(salary),2) 평균급여 from employees
    group by rollup(department_id, job_id)  -- (a, b) (a) () 뒤쪽 항부터 하나씩 없어짐
    order by department_id;
    
select department_id 부서, job_id 업무, round(avg(salary),2) 평균급여 from employees
    group by cube(department_id, job_id)    -- (a, b) (a) (b) () 경우의 수 모두
    order by department_id;
    
select department_id 부서, job_id 업무, round(avg(salary),2) 평균급여 from employees
    group by grouping sets((department_id), (job_id), ()) -- 각각의 경우를 모두 출력
    order by department_id;
    
-- join
-- 사번 110 사원의 부서명 확인
select department_id from employees where employee_id=110;
select department_name from departments where department_id=100;
    -- 2번의 트랜잭션이 발생

-- cross join   
select last_name, department_name
    from employees, departments;    -- 모든 경우의 수, 실질적 문제 해결이 어렵다
    
-- equi join
select departments.department_name
    from employees, departments
    where employees.department_id = departments.department_id
        and employees.employee_id = 110;

select d.department_name
    from employees e, departments d
    where e.department_id = d.department_id and e.employee_id = 110;
    
select d.department_name
    from employees e
    join departments d
        on e.department_id = d.department_id
        where e.employee_id = 110;

-- 사번 120번의 사번, 이름, 업무, 업무명(job_title) 출력
select employee_id 사번, last_name 성, employees.job_id 업무, job_title 업무명
    from employees, jobs
    where employees.job_id = jobs.job_id and employees.employee_id = 120;

select e.employee_id 사번, e.last_name 성, e.job_id 업무, j.job_title 업무명
    from employees e, jobs j
    where e.job_id = j.job_id and e.employee_id = 120; -- join 조건과 select 조건

select e.employee_id 사번, e.last_name 성, e.job_id 업무, j.job_title 업무명
    from employees e
    join jobs j
        on e.job_id = j.job_id  -- join의 조건
    where e.employee_id = 120;

-- 세 테이블 조인 (부서명 까지)
select e.last_name 성, d.department_name 부서명, j.job_title 업무명
    from employees e, departments d, jobs j
    where e.department_id = d.department_id
        and e.job_id = j.job_id
    order by d.department_name;

select e.last_name 성, d.department_name 부서명, j.job_title 업무명
    from employees e
    join departments d
        on e.department_id = d.department_id
    join jobs j
        on e.job_id = j.job_id
    order by d.department_name;

-- 2005년 상반기 입사 직원
-- 사번, 이름, 입사일, 부서명(department_name), 업무명(job_title)을 출력

select e.employee_id 사번, e.last_name 성, e.hire_date 입사일,
d.department_name 부서명, j.job_title 업무명
    from employees e, departments d, jobs j
    where e.department_id = d.department_id
        and e.job_id = j.job_id
--        and e.hire_date >= '01/jan/2005' and e.hire_date <= '30/jun/2005'
        and hire_date between '01/jan/2005' and '30/jun/2005'   -- between 사용
    order by e.hire_date;

select e.employee_id 사번, e.last_name 성, e.hire_date 입사일,
d.department_name 부서명, j.job_title 업무명
    from employees e
    join departments d
        on e.department_id = d.department_id
    join jobs j
        on e.job_id = j.job_id
    where e.hire_date between '01/jan/2005' and add_months('01/jan/2005', 6)
    order by e.hire_date;

-- salgrade tabel 생성 이후 다음 진행
-- @'g:/my drive/db/start.txt' -- 파일로 sql 실행하는 방법
--create table salgrade(
--    grade varchar(2) not null,
--	losal number not null,
--	hisal number not null
--   );
--insert into salgrade values( '1', 1000, 5000 );
--insert into salgrade values( '2', 5000, 10000 );
--insert into salgrade values( '3', 10000, 15000 );
--insert into salgrade values( '4', 15000, 20000 );
--insert into salgrade values( '5', 20000, 30000 );
--commit;

-- non equi join
-- 같은 자료형끼리 비교
select * from salgrade;

select e.last_name 성, e.salary 급여, s.grade 급여등급
    from employees e, salgrade s
    where e.salary >= s.losal and e.salary <s.hisal -- 조건이 부등호
    order by 급여등급 desc;

select e.last_name 성, e.salary 급여, s.grade 급여등급
    from employees e
    join salgrade s
        on e.salary >= s.losal and e.salary < s.hisal
    order by 급여등급 desc;

-- equi / non equi join 같이 사용
select e.last_name 성, s.grade 급여등급, d.department_name 부서명
    from employees e, salgrade s, departments d
    where e.department_id = d.department_id
        and e.salary >= s.losal and e.salary > s.hisal
    order by 급여등급 desc;
    
select e.last_name 성, s.grade 급여등급, d.department_name 부서명
    from employees e
    join departments d
        on e.department_id = d.department_id
    join salgrade s
        on e.salary >= s.losal and e.salary > s.hisal
    order by 급여등급 desc;

-- self join
select e.employee_id 사번, e.last_name 성, e.manager_id 부서장,
m.employee_id 부서장사번, m.last_name "부서장 성"
from employees e, employees m   -- 한 테이블로 두 개의 객체 생성 개념
where e.manager_id = m.employee_id
order by 사번;

select e.employee_id 사번, e.last_name 성, e.manager_id 부서장,
m.employee_id 부서장사번, m.last_name "부서장 성"
    from employees e
    join employees m
        on e.manager_id = m.employee_id
    order by 사번;
    
-- outer join
select e.last_name 성, e.department_id 부서, d.department_name 부서명
    from employees e, departments d
--    where e.department_id = d.department_id;  -- 부서가 없는 사람은 출력이 안 됨
    where e.department_id = d.department_id(+); -- 적은 쪽에 (+)
    
select e.last_name 성, e.department_id 부서, d.department_name 부서명
    from employees e
    left outer join departments d               -- 기준을 왼쪽에 맞춰서 확장
        on e.department_id = d.department_id;
--  join departments d               
--  on e.department_id = d.department_id(+);    -- join에 (+)도 사용 가능


-- outer join with nonequi join
select * from salgrade;
update salgrade set losal = 2500 where grade = 1; -- grade 1 최저치 변경
commit;

select e.last_name 성, e.salary 급여, s.grade 급여등급
    from employees e, salgrade s
    where e.salary >= s.losal(+) and e.salary < s. hisal(+); -- 양쪽 다 (+) 필요

select e.last_name 성, e.salary 급여, s.grade 급여등급
    from employees e
    left outer join salgrade s
        on e.salary >= s.losal and e.salary < s.hisal;
    
-- outer join with self join
select e.employee_id 사번, e.last_name 성, e.manager_id 부서장,
m.employee_id 부서장사번, m.last_name "부서장 성"
    from employees e, employees m
    where e.manager_id = m.employee_id(+) -- 부서장이 없는 사람도 출력
    order by e.employee_id;
    
select e.employee_id 사번, e.last_name 성, e.manager_id 부서장,
m.employee_id 부서장사번, m.last_name "부서장 성"
    from employees e
    left outer join employees m     -- 확인 해볼것
        on e.manager_id = m.employee_id
    order by e.employee_id;
    
-- full outer join
select * from departments;

select e.last_name 성, e.department_id 부서, d.department_name 부서명
    from employees e
    left outer join departments d   -- 부서 없는 사람 o
        on e.department_id = d.department_id
    order by e.department_id;
    
select e.last_name 성, e.department_id 부서, d.department_name 부서명
    from employees e
    right outer join departments d  -- 부서 없는 사람 x, 부서원 없는 부서 o
        on e.department_id = d.department_id
    order by e.department_id;
    
select e.last_name 성, e.department_id 부서, d.department_name 부서명
    from employees e
    full outer join departments d   -- 부서 없는 o, 부서원 없는 부서 o
        on e.department_id = d.department_id
    order by e.department_id;

-- full outer join with where - union
select e.last_name 성, e.department_id 부서, d.department_name 부서명
    from employees e, departments d
    where e.department_id = d.department_id(+) -- left outer join
union -- 합집합 성이 같은 사람을 제거 - 표출된 결과 값으로만 비교 - id를 추가하면 해결된다
select e.last_name 성, e.department_id 부서, d.department_name 부서명
    from employees e, departments d
    where e.department_id(+) = d.department_id -- right outer join
order by 부서;    -- union 사용 시 alias 로 정렬해야 함
    
-- 예제 --

-- 사원들의 성과 이름(합쳐서), 부서번호 부서이름을 출력
-- 단 부서가 없는 직원까지 모두 출력( OuterJoin )
select first_name||' '||last_name 이름, e.department_id 부서, d.department_name 부서명
    from employees e, departments d
    where e.department_id = d.department_id
    order by e.employee_id;

select first_name||' '||last_name 이름, e.department_id 부서, d.department_name 부서명
    from employees e
    left outer join departments d
        on e.department_id = d.department_id
    order by e.employee_id;
    
-- 인센티브를 받는 사원의 이름, 인센티브, 부서명을 
-- 인센티브가 큰 순서로 출력
select e.last_name 성, e.commission_pct 인센티브, d.department_name 부서명
    from employees e, departments d
        where e.department_id = d.department_id 
            and commission_pct is not null
    order by e.commission_pct desc;
    
select e.last_name 성, e.commission_pct 인센티브, d.department_name 부서명
    from employees e
    join departments d
        on e.department_id = d.department_id
    where commission_pct is not null
    order by e.commission_pct desc;
    
-- 사원명, 부서명, 도시를 출력( OuterJoin )
select e.last_name 성, d.department_name 부서명, l.city 도시
    from employees e, departments d, locations l
        where e.department_id = d.department_id(+)
            and d.location_id = l.location_id(+);
        
select e.last_name 성, d.department_name 부서명, l.city 도시
    from employees e
    left outer join departments d
        on e.department_id = d.department_id
    left outer join locations l         -- 부서가 없으면 location도 없음
        on d.location_id = l.location_id;
        
-- 사원명, 업무, 급여, 급여등급을 높은 등급부터 출력 ( NonequiJoin OuterJoin )
select e.last_name 성, j.job_title 업무명, e.salary 급여, s.grade 급여등급
    from employees e, jobs j, salgrade s
        where e.job_id = j.job_id
            and e.salary >= s.losal(+) and e.salary < s.hisal(+)  -- 등급 외도 출력
    order by 급여등급 desc;

select e.last_name 성, j.job_title 업무명, e.salary 급여, s.grade 급여등급
    from employees e
    join jobs j
        on e.job_id = j.job_id
    left outer join salgrade s          -- 등급 외도 출력
        on e.salary >= s.losal and e.salary < s.hisal
    order by 급여등급 desc;
    
-- Abel 이라는 직원의 사원명, 부서번호와 같은 부서 직원을
-- 사원명순 동료이름순으로 출력 ( SelfJoin ) 
-- 단 자신을 동료로 출력하면 안된다.
select e.last_name 자신, e.department_id 부서, c.last_name 동료
    from employees e, employees c
        where e.department_id = c.department_id 
            and e.last_name = 'Abel' and e.last_name != c.last_name
    order by 동료;

select e.last_name 자신, e.department_id 부서, c.last_name 동료
    from employees e
    join employees c
        on e.department_id = c.department_id
    where e.last_name = 'Abel' and e.last_name != c.last_name
    order by 동료;

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
select e.employee_id 사번, e.first_name||', '||e.last_name 이름, j.job_title 업무명,
d.department_name 부서명, h.start_date 전입, h.end_date 전출
    from job_history h, employees e, jobs j, departments d
    where h.employee_id = e.employee_id
        and h.job_id = j.job_id
        and h.department_id = d.department_id; 

select e.employee_id 사번, e.first_name||', '||e.last_name 이름, j.job_title 업무명,
d.department_name 부서명, h.start_date 전입, h.end_date 전출
    from job_history h
    join employees e
        on h.employee_id = e.employee_id
    join jobs j
        on h.job_id = j.job_id
    join departments d
        on h.department_id = d.department_id;

-- 테이블에 추가 삭제 - salgrade 중복으로 한번 더 생성해서 찾아봄
-- select rowid from salgrade; -- 행마다 부여된 고유번호
-- delete from salgrade where rowid between 'AAAR3oAAAAAACDMAAF' and 'AAAR3oAAAAAACDMAAI';

-- DELETE FROM salgrade
--    WHERE ROWID IN (
--        SELECT ROWID FROM (
--            SELECT * FROM (
--                SELECT ROW_NUMBER() OVER(PARTITION BY grade ORDER BY grade) AS num
-- FROM salgrade
-- )
-- WHERE num > 1 
-- )
-- );

