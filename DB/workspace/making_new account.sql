-- on system account

select * from all_users;

create user joeun identified by "&pass"; -- make account 'joeun'

-- authorization
grant create session, create table, create sequence, create view to joeun; 

alter user joeun default tablespace users; -- tablespace
alter user joeun quota unlimited on users; -- 저장공간
