drop table emp1;
drop table attendinfo;
drop table attendtime;
drop table score;
drop table student;
drop table exam;
drop table regnot;
drop table notice;
drop table faq;
drop table hireinfo;
drop table class;
drop sequence emp1_seq;
drop sequence exam_seq;
drop sequence regnot_seq;
drop sequence notice_seq;
drop sequence faq_seq;
drop sequence hireinfo_seq;
drop sequence student_seq;
drop sequence class_seq;
create table emp1 (
empnum number primary key,
empname varchar2(15) not null,
empid varchar2(30) not null,
emppw varchar2(13) not null,
empemail varchar2(30) not null,
empphone varchar2(11) not null,
dept varchar2(10) not null,
empaddr varchar2(500) not null,
empdate date not null
);
create sequence emp1_seq;
insert into emp1 values (emp1_seq.nextval,'설민석', 'minseok', '1234', 'minseok@gmail.com','01044441115','강사팀','비트특별시 캠프구 자바대로19길 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'최진기', 'jingi', '1234', 'jingi@gmail.com','01044441115','강사팀','비트특별시 캠프구 자바대로19길 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'최태성', 'taesung', '1234', 'taesung@gmail.com','01044441115','강사팀','비트특별시 캠프구 자바대로19길 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'김덕수','deoksoo','1234','deoksoo@gmail.com','01011111111','강사팀','비트특별시 캠프구 자바대로18길 123-1',sysdate);
insert into emp1 values (emp1_seq.nextval,'고재현', 'jaehyun', '1234', 'jaehyun@gmail.com','01022221111','영업팀','비트특별시 캠프구 자바대로18길 123-2',sysdate);
insert into emp1 values (emp1_seq.nextval,'장인영', 'inyoung', '1234', 'inyoung@gmail.com','01033331111','회계팀','비트특별시 캠프구 자바대로18길 123-3',sysdate);
insert into emp1 values (emp1_seq.nextval,'김영조', 'myeonghyo', '1234', 'myeonghyo@gmail.com','01044441111','행정팀','비트특별시 캠프구 자바대로18길 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'서울대교수', 'deokja', '1234', 'deokja@gmail.com','01011111112','취업팀','비트특별시 캠프구 자바대로18길 123-5',sysdate);
insert into emp1 values (emp1_seq.nextval,'고려대교수', 'jaeduck', '1234', 'jaeduck@gmail.com','01022221134','영업팀','비트특별시 캠프구 자바대로18길 123-2',sysdate);
insert into emp1 values (emp1_seq.nextval,'연세대교수', 'young', '1234', 'young@gmail.com','01033331141','행정팀','비트특별시 캠프구 자바대로18길 123-3',sysdate);
insert into emp1 values (emp1_seq.nextval,'열정강사', 'myeongja', '1234', 'myeongja@gmail.com','01044441115','강사팀','비트특별시 캠프구 자바대로19길 123-4',sysdate);
create table class(
classnum number primary key,
classname varchar2(100) not null,
teachername varchar2(15) not null,
startdate varchar2(50),
enddate varchar2(50)
);
create sequence class_seq;
insert into class values (class_seq.nextval,'미배정','미배정','','');
insert into class values (class_seq.nextval,'자바반','설민석','2020/01/20','2020/02/01');
insert into class values (class_seq.nextval,'자바스크립트반','최진기','2020/02/01','2020/02/06');
insert into class values (class_seq.nextval,'스프링반','최태성','2020/02/06','2020/02/21');
insert into class values (class_seq.nextval,'디자인반','김덕수','2020/02/05','2020/05/05');
create table exam (
examnum number primary key,
examname varchar2(100),
teachername varchar2(15) not null,
examorder varchar2(20) default '',
examdate date,
examexp varchar2(50),
examcontent varchar2(1000),
examfile varchar2(2000) default '',
origin varchar2(2000) default '',
classnum number not null,
constraint classnum_fk3 foreign key(classnum)
references class(classnum)
);
create sequence exam_seq;
insert into exam values (exam_seq.nextval,'미배정','미배정','','','','','','',1);
insert into exam values (exam_seq.nextval,'자바','설민석','1차',sysdate,'2020/01/27부터2020/02/05까지','자바시험문제출제','','',2);
insert into exam values (exam_seq.nextval,'자바스크립트','최진기','1차',sysdate,'2020/01/27부터2020/02/05까지','자바스크립트시험문제출제','','',3);
insert into exam values (exam_seq.nextval,'스프링','최태성','1차',sysdate,'2020/01/27부터2020/02/05까지','스프링시험문제출제','','',4);
insert into exam values (exam_seq.nextval,'디자인','김덕수','1차',sysdate,'2020/01/01부터2020/04/01까지','김덕수시험문제출제','','',5);
create table student (
stunum number primary key,
stuid varchar2(30) not null,
stuname varchar2(15) not null,
stupw varchar2(13) not null,
stuphone varchar2(11) not null,
stuaddr varchar2(100) not null,
classname varchar2(60),
teachername varchar2(15) not null,
classnum number not null,
constraint classnum_fk2 foreign key (classnum)
references class(classnum),
examnum number not null,
constraint examnum_fk3 foreign key (examnum)
references exam(examnum)
);
create sequence student_seq;
insert into student values (student_seq.nextval,'cooldeoksoo','김덕수','1234','01011112222','비트특별시 캠프구 자바대로18길 123-1','자바반','설민석',2,2);
insert into student values (student_seq.nextval,'jeahyunbabo','고재현','1234','01022223333','허걱특별시 희안구 파이썬대로12길 123-1','자바스크립트반','최진기',3,3);
insert into student values (student_seq.nextval,'inyoungzzang','장인영','1234','0101432132','독립도 만세시 대한대로11길 123-1','스프링반','최태성',4,4);
insert into student values (student_seq.nextval,'damnharry','유명효','1234','01014312872','어플도 제작시 애플대로14길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'healthykim','정지문','1234','01012112912','수당특별시 내놔구 예쓰대로90길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'josunhero','채우식','1234','01012212532','기타특별시 수당구 여부대로23길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'thiefking1','홍혜리','1234','01033112222','비트특별시 캠프구 스타대로1길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'bronzethief','김진혁','1234','01014412222','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'silverthief','이진규','1234','01015512222','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'goldthief','김진우','1234','01016612222','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'yoonsikjoa','최재만','1234','01011223344','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'gwangun','오광은','1234','01022334455','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'unjung','김은정','1234','01033445566','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'soyul','이소율','1234','01044556677','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'hyejin','조혜진','1234','01055667788','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
create table attendinfo (
stunum number not null,
constraint stunum_fk2 foreign key(stunum)
references student(stunum),
attendpct number default 0,
ontime number default 0,
late number default 0,
absent number default 0,
checkpct number default 0
);
insert into AttendInfo values (1,0,0,0,0,0);
insert into AttendInfo values (2,0,0,0,0,0);
insert into AttendInfo values (3,0,0,0,0,0);
insert into AttendInfo values (4,0,0,0,0,0);
insert into AttendInfo values (5,0,0,0,0,0);
insert into AttendInfo values (6,0,0,0,0,0);
insert into AttendInfo values (7,0,0,0,0,0);
insert into AttendInfo values (8,0,0,0,0,0);
insert into AttendInfo values (9,0,0,0,0,0);
insert into AttendInfo values (10,0,0,0,0,0);
insert into AttendInfo values (11,0,0,0,0,0);
insert into AttendInfo values (12,0,0,0,0,0);
insert into AttendInfo values (13,0,0,0,0,0);
insert into AttendInfo values (14,0,0,0,0,0);
insert into AttendInfo values (15,0,0,0,0,0);
create table attendtime(
stunum number not null,
constraint stunum_fk foreign key(stunum)
references student(stunum),
arrtime varchar2(50),
leavetime varchar2(50),
attendstat number default 3
);
insert into attendtime values (1,'','',3);
insert into attendtime values (2,'','',3);
insert into attendtime values (3,'','',3);
insert into attendtime values (4,'','',3);
insert into attendtime values (5,'','',3);
insert into attendtime values (6,'','',3);
insert into attendtime values (7,'','',3);
insert into attendtime values (8,'','',3);
insert into attendtime values (9,'','',3);
insert into attendtime values (10,'','',3);
insert into attendtime values (11,'','',3);
insert into attendtime values (12,'','',3);
insert into attendtime values (13,'','',3);
insert into attendtime values (14,'','',3);
insert into attendtime values (15,'','',3);
create table faq (
faqnum number primary key,
faqtitle varchar2(100) not null,
faqcontent varchar2(1000) not null,
faqauthor varchar2(10) not null,
faqdate date not null
);
create sequence faq_seq;
Insert into faq values (faq_seq.nextval,'머신건 어떻게 하나요?','머신건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'손수건 어떻게 하나요?','손수건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'장동건 어떻게 하나요?','장동건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'두건 어떻게 하나요?','두건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'윤건 어떻게 하나요?','윤건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'샷건 어떻게 하나요?','샷건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'지건 어떻게 하나요??','지건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'그건 어떻게 하나요?','그건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'저건 어떻게 하나요?','저건 저렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'이건 어떻게 하나요?','이건 이렇게 하세요!!!!','행정팀',sysdate);
create table notice (
notnum number primary key,
nottitle varchar2(100) not null,
notcontent varchar2(1000) not null,
notauthor varchar2(10) not null,
notdate date not null,
cnt number not null
);
create sequence notice_seq;
Insert into notice values (notice_seq.nextval,'곰이 물구나무 서면?','문','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'자꾸 누군지 묻는 병은?','후유증','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'반성문을 영어로하면?','글로벌','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'성적이 나와도 말하지 못하는 이유는?','내성적이라서','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'오리를 생으로 먹으면?','회오리','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'미국에 비가오면?','USB','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'D가 20개면?','스무디','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'딸기가 직장을 잃으면?','딸기시럽','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'머리가 아프면 약을 얼마나 먹어야하나?','두통','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'세상에서 가장 지루한 중학교는?','로딩중','행정팀',sysdate,0);
create table regnot(
regnum number primary key,
regauthor varchar2(10) not null,
regdate date not null,
regcnt number not null,
regcontent varchar2(1000) not null,
classnum number not null,
constraint classnum_fk foreign key(classnum)
references class(classnum),
regfile varchar2(2000) default '',
origin varchar2(2000) default ''
);
create sequence regnot_seq;
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'자바 수업을 진행하려고 합니다.',2,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'자바스크립트 수업을 진행하려고 합니다.',3,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'스프링 수업을 진행하려고 합니다.',4,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'디자인 수업을 진행하려고 합니다.',5,'','');
create table hireinfo (
infonum number primary key,
infotitle varchar2(100) not null,
infoauthor varchar2(10) not null,
infodate date not null,
infocnt number default 0,
cmpname varchar2(30) not null,
cmpexp varchar2(50) not null,
cmplink varchar2(100) not null
);
create sequence hireinfo_seq;
insert into hireinfo values (hireinfo_seq.nextval,'보전하세','관리자',sysdate,0,'네이버','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'길이','관리자',sysdate,0,'다음','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'대한으로','관리자',sysdate,0,'구글','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'대한사람','관리자',sysdate,0,'비트캠프','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'화려강산','관리자',sysdate,0,'네이버','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'삼천리','관리자',sysdate,0,'다음','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'무궁화','관리자',sysdate,0,'구글','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'만세','관리자',sysdate,0,'비트캠프','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'우리나라','관리자',sysdate,0,'네이버','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'보우하사','관리자',sysdate,0,'다음','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'하느님이','관리자',sysdate,0,'구글','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'닳도록','관리자',sysdate,0,'비트캠프','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'마르고','관리자',sysdate,0,'다음','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'백두산이','관리자',sysdate,0,'구글','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'동해물과','관리자',sysdate,0,'비트캠프','2020/03/01','http://https://bitcamp.co.kr');
create table score (
examnum not null,
constraint examnum_fk foreign key(examnum)
references exam(examnum),
stunum not null,
constraint stunum_fk3 foreign key(stunum)
references student(stunum),
first number default 0,
second number default 0,
third number default 0
);
insert into score values (1,1,0,0,0);
insert into score values (2,2,20,30,40);
insert into score values (3,3,30,50,90);
insert into score values (1,4,20,30,40);
insert into score values (2,5,30,50,90);
insert into score values (4,6,20,30,40);
insert into score values (5,7,30,50,90);
insert into score values (2,8,20,30,40);
insert into score values (1,9,30,50,90);
insert into score values (1,10,20,30,40);
insert into score values (5,11,20,30,40);
insert into score values (1,12,0,0,0);
insert into score values (1,13,0,0,0);
insert into score values (1,14,0,0,0);
insert into score values (1,15,0,0,0);