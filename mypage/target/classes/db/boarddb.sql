create table sboard (
		unq number not null,
		title varchar2(100) not null,
		pass varchar2(100) not null,
		name varchar2(20),
		content varchar2(4000),
		hits number DEFAULT 0,
		rdate timestamp(6),
		category varchar2(100) not null
)

create table reply (
		
)
