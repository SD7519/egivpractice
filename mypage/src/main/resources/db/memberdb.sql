create table pmember(
	userid varchar2(50) not null primary key,
	userpass varchar2(100) not null,
	email varchar2(100),
	name varchar2(50),
	birth date,
	phonenum varchar2(50)
)
drop table pmember;

select * from pmember;

insert into pmember (userid, userpass, email, name, birth, phonenum) values ('ganada', '123', 'ganada@naver.com', '가나다', '2024-01-17', '010-1234-1234')