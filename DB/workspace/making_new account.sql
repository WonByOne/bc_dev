select * from all_users;

create user joeun identified by "&pass";

grant create session, create table, create sequence, create view to joeun;

alter user joeun default tablespace users;
alter user joeun quota unlimited on users;
