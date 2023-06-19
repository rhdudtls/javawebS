/* guest2.sql*/

show tables;

create table guest2(
	idx int not null auto_increment primary key, /* 방명록 고유 번호*/
	name varchar(20) not null, /*방명록 작성자 성명*/
	content text not null, /*방명록 내용*/
	email varchar(60), /*메일 주소*/
	homePage varchar(60), /*홈페이지 주소(블로그 주소)*/
	visitDate datetime default now(), /*방문일자*/
	hostIp varchar(30) not null /* 방문자 접속 IP */
);

desc guest2;

insert into guest2 values(default, '관리자', '방명록 서비스를 시작합니다.', 'ehfrl64@naver.com','https://blog.naver.com/ehfrl64',default,'192.168.50.84');

select * from guest2;

delete from guest2 where name ='고영신';

alter table guest2 alter name varchar(50);