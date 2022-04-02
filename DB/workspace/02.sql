select * from tabs;
select * from employees;
DESC employees; -- 속성 확인

--업무 SA_MAN IT_PROG ST_MAN인 사람만 출력
select last_name 성, job_id 업무 from employees
    where job_id = 'SA_MAN' or job_id = 'IT_PROG' or job_id = 'ST_MAN';
select last_name 성, job_id 업무 from employees
    where job_id in( 'SA_MAN', 'IT_PROG', 'ST_MAN');

--is null / is not null
select last_name 성, commission_pct 인센티브 from employees
    where commission_pct = null; --비교 할당 연산 불가능
select last_name 성, commission_pct 인센티브 from employees
    where commission_pct = 'null';  --이건 오류난다   

select last_name 성, commission_pct 인센티브 from employees
    where commission_pct is null;
select last_name 성, commission_pct 인센티브 from employees
    where commission_pct is not null;

--order by asc오름차순/desc내림차순  정렬 
select last_name 성, salary 월급 from employees
    order by salary asc; -- 기본이 오름차순이라 생략이 가능하다
select last_name 성, salary 월급 from employees
    order by salary desc;
select last_name 성, hire_date 입사일 from employees
    order by hire_date desc;

select last_name 성, salary 월급, hire_date 입사일 from employees
    order by salary desc, hire_date asc; -- 앞에 오는 것 우선

-- 숫자 관련된 함수
select mod( 10,3 ) 나머지 from dual;      -- dual dummy alias?
select employee_id 사번, last_name 성 from employees
    where mod( employee_id, 2 ) = 0 order by employee_id asc;   -- 사번이 짝수

-- 반올림
select round(1234.5678) from dual;
select round(1234.5678, 2) from dual;
select round(1234.5678, -1) from dual; -- 1의 자리 반올림

-- 버림
select trunc(1234.5678) from dual;  -- 소수점 버리기
select trunc(1234.5678, 2) from dual;
select trunc(1234.5678, -1)from dual;

select last_name 성, trunc(salary /12, 2) 월급 from employees;

-- width_bucket(지정값, 최소값, 최대값, bucket 수)
select width_bucket( 92, 0, 100, 10 )단계 from dual; 
select width_bucket( 100, 0, 100, 10 )단계 from dual;
select width_bucket( 100, 100, 0, 10 )단계 from dual;--낮은게 좋은단계 범위의 순서를 반대로

--입사일 기준으로 근속연수에 따라 30 등급으로 나누고 
--등급에 따라 1000의 수당을 준다. 2000년 1월 1일 기준. 
--수당으로 내림차순.
select hire_date 입사일 from employees
    order by hire_date desc;
select last_name 이름, salary 월급, hire_date 입사일,
    width_bucket( hire_date , '2022/03/31', '2000/01/01', 30 )*1000 수당 from employees
    order by 수당 desc;

--문자함수--
select upper( 'Hello SQL!!!' ) from dual;
select lower( 'Hello SQL!!!' ) from dual;
select initcap( 'Hello SQL!!!' ) from dual; -- 공백 이후 첫글자 대문자

select length( 'Hello SQL!!!' ) from dual;          -- index 1부터 시작
select instr( 'Hello SQL!!!', 'l', 1, 2) from dual; -- 처음부터 찾은 것 중 2번째의 위치 반납
select substr( 'Hello SQL!!!', -3, 3)from dual;     -- 시작 위치, 갯수
select lpad( 'Hello SQL!!!', 20, '#')from dual;     -- 왼쪽부터 # 채우고 나머지 문자열로 20칸
select rpad( 'Hello SQL!!!', 30, '@')from dual;     -- 30칸에 문자열이후 나머지 오른쪽을 @로 채움
select ltrim('       a   a    a      ') from dual;  -- 왼쪽 여백 trim
select rtrim('      b     b    b     ')from dual;   -- 오른쪽 여백 trim
select last_name 성, trim( 'a' from last_name) from employees; -- a 제거

-- 날짜함수--
select sysdate from dual;       -- system 시간 (Oracle DB)
select sysdate + 30 from dual;  -- 30일 후
select sysdate - 30 from dual;  -- 30일 전

select add_months( sysdate, 6) from dual; -- 월 단위 날짜 차이 고려한 자동 계산 ex) 31일이면 1달 뒤는 30일이 되는 식
-- 20개월 뒤에 일괄적으로 진급한다 
select last_name 성, hire_date 입사일, add_months( hire_date, 20) 진급일 from employees;

select last_day(sysdate) from dual;
select last_day( '2020/02/01' ) from dual;  -- 윤년 자동 계산
select next_day( sysdate, 1 )from dual;     -- 오는 일요일(1)
select next_day( sysdate, 'tue' )from dual;  -- 한글 환경에서는 '화' 

select months_between( '2022/01/01', sysdate) from dual; -- 날짜 사이의 개월수 실수값으로 반환
select last_name 성, hire_date 입사일, months_between( sysdate, hire_date)개월수
    from employees order by 개월수 desc;

-- 사번 이름 입사일 근속연수 근속월수 근속일수
-- 몇년 몇월 몇일째 근무하고 있는지 출력
-- 근속 년수 / 근속 월수 / 근속일수로 내림차순

select employee_id 사번, last_name 성, hire_date 입사일,
    trunc(months_between(sysdate, hire_date)/12) 근속년수,
    trunc(mod(months_between(sysdate, hire_date),12)) 근속월수,  -- 나머지를 이용
    round(sysdate - add_months(hire_date, trunc(months_between(sysdate, hire_date)))) 근속일수
    from employees order by 근속년수 desc, 근속월수 desc, 근속일수 desc;

-- 형 변환 
-- to_date 문자열을 날짜로
select months_between(sysdate, '2022/01/01') from dual; -- 함수에서 문자열을 알아서 날짜로 변환
select sysdate - '2022/01/01' from dual;                -- 연산자로 직접 연산하면 에러
select last_name 성, (to_date('2022/03/31') - hire_date) / 365 근속연수  -- 문자열을 연산 가능한 날짜로 변환
    from employees;

-- to_char -- 출력 형식
select sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss') "지금 이 순간" from dual;
select to_char(sysdate, 'year-MON-dd dy hh:mi:ss') "지금 이 순간" from dual; -- 형식을 대문자로 하면 출력도 대문자로

select to_char(1234, '99999') from dual;
select to_char(1234, '099999') from dual;       -- 6자리 앞자리 0으로
select to_char(1234, '$099999') from dual;
select to_char(1234, '$0,999.99') from dual;
select to_char(1234, '9.999EEEE') from dual;    -- 과학적 표기법 
select to_char(1234, 'L9999') from dual;

-- nvl
select last_name 성, commission_pct 인센티브,
    salary + salary*commission_pct 월급           -- null을 연산하면 null이 됨
    from employees;
select last_name 성, commission_pct 인센티브,
    salary + salary*nvl(commission_pct, 0) 월급   -- null이면 0으로 변환 
    from employees;

select last_name 성, nvl(manager_id, 'CEO') 부서장ID  -- 부서장 없으면 CEO 그러나 에러 
    from employees;
select last_name 성, nvl(to_char(manager_id), 'CEO') 부서장ID -- manager_id를 문자로
    from employees;
    
desc employees; -- 형 확인하기
select last_name 성, nvl(to_char(department_id), '신입') 부서    -- 부서 없으면 신입
    from employees;
    
-- decode 조건문
select last_name 성, department_id 부서,
    decode(department_id, 50, '영업부', 80, '관리부', 90, '비서실') 부서명
    from employees;

-- case
select last_name 성, salary 월급,
    case when salary >= 20000 then '이사'
         when salary >= 15000 then '부장'
         when salary >= 10000 then '과장'
         else '사원'
    end 직급
    from employees;

-- 근속연수에 따라
select last_name 성, trunc(months_between(sysdate, hire_date)/12)+1 근속연수, -- 현재 년 +1 해줘야함
    case when trunc(months_between(sysdate, hire_date)/12)+1 >= 18 then 'Founding Member'
         when trunc(months_between(sysdate, hire_date)/12)+1 >= 15 then 'Super Senior'
         when trunc(months_between(sysdate, hire_date)/12)+1 >= 12 then 'Senior'
         when trunc(months_between(sysdate, hire_date)/12)+1 >= 9 then 'Junior'
         else 'new'
    end 호봉
    from employees;

define months = 20;  -- 변수 지정하듯이 사용 가능
select &months from dual;

-- 그룹함수
select last_name 이름, salary 월급, avg(salary) 평균월급    -- 함수가 1개의 값을 출력하므로 결과 테이블 구성할 수 없음
    from employees;
select sum(salary) 월급합계, round(avg(salary), 2) 평균월급, max(salary) 최고월급, min(salary) 최저월급
    from employees;
select count(department_id) from employees; -- null은 세지 않음
select count(commission_pct) from employees;
select count(*) from employees; -- 전체 인원 구하기

-- group by -- select 뒤에는  group으로 묶을 수 있는 컬럼만 올 수 있음
select department_id 부서, round(avg(salary), 2) 평균월급 from employees
    group by department_id order by 부서;
select job_id 업무, max(salary) 최고월급, min(salary) 최저월급 from employees
    group by job_id;

    
select department_id 부서, job_id 업무, round(avg(salary),2) 평균월급 from employees
    group by department_id, job_id order by 부서;
    
select department_id 부서, avg(salary) 평균월급 from employees
    group by department_id
    having avg(salary) >= 7000    -- grouping 한 것 중 선택한 것만 취한다는 의미
    order by 부서;
    
-- 부서 인원이 2명 이상이 부서의 부서ID 인원, 평균월급 출력
select department_id 부서, count(*) 인원, round(avg(salary), 2) 평균월급 from employees
    group by department_id
    having count(*) >= 2
    order by 인원;

-- 월급이 5000 이상인 사람의 부서별 평균월급
-- 평균월급 7000 이상인 부서만 출력
select department_id 부서, round(avg(salary), 2) 평균월급 from employees
    where salary >= 5000 -- 월급 5000 이상 제한
    group by department_id
    having round(avg(salary), 2) >= 7000;
    
-- 분석함수
select last_name 성, salary 월급, avg(salary)over() from employees; -- 반복적으로 계산해서 넣어주는 개념
select last_name 성, salary 월급, sum(salary)over() from employees;

select last_name 성, salary 월급, 
    first_value(salary)over(order by salary desc) 최고월급 from employees; -- 정렬된 salary 중 첫번째 값
select last_name 성, salary 월급, 
    first_value(salary)over(order by salary asc) 최저월급 from employees;
    
select last_name 성, salary 월급,
    last_value(salary)over(order by salary desc) from employees;  -- last value는 출력하면서 계속 갱신이 됨
select last_name 성, salary 월급,                                   -- 범위를 지정해서 그 중 마지막 값
    last_value(salary)over(order by salary desc rows between 2 preceding and 3 following) last
    from employees;    
    
select last_name 성, salary 월급, count(salary)over() from employees;
select last_name 성, salary 월급, count(*)over() from employees; -- 인원 누적

select last_name 성, salary 월급, rank()over(order by salary desc) 연봉순위 from employees;  -- 공동 순위 다음 밀림
select last_name 성, salary 월급, row_number()over(order by salary desc) 연봉순위 from employees; -- 모두 순위
select last_name 성, salary 월급, dense_rank()over(order by salary desc) 연봉순위 from employees; -- 공동 순위 인정
