CREATE TABLE board (
       num int auto_increment,
       id varchar(30) not null,
       name varchar(30) not null,
       subject varchar(100) not null,
       content text not null,
       regist_day varchar(50),
       hit int,
       ip varchar(30),
       primary key(num)
);

select * from board;
desc board;
drop table board;
