create table tbl_Teacher_202201(
	teacher_code char(3) primary key,
	teacher_name varchar2(15),
	class_name varchar2(20),
	class_price number(8),
	teach_resist_date varchar2(8)
);

insert into TBL_TEACHER_202201 values('100','이초급','초급반','100000','20220101');

insert into TBL_TEACHER_202201 values('200','김중급','중급반','200000','20220102');
insert into TBL_TEACHER_202201 values('300','박고급','고급반','300000','20220103');
insert into TBL_TEACHER_202201 values('400','정심화','심화반','400000','20220104');

CREATE TABLE tbl_member_202201(
c_no char(5) PRIMARY KEY,
c_name varchar2(15),
phone varchar2(11),
address varchar2(50),
grade varchar2(6)
);

insert into TBL_MEMBER_202201 values('10001', '홍길동', '01011112222', '서울시 강남구', '일반');

insert into TBL_MEMBER_202201 values('10002', '장발장', '01022223333', '성남시 분당구', '일반');
insert into TBL_MEMBER_202201 values('10003', '임꺽정', '01033334444', '대전시 유성구', '일반');
insert into TBL_MEMBER_202201 values('20001', '성춘향', '01044445555', '부산시 서구', 'VIP');
insert into TBL_MEMBER_202201 values('20002', '이몽룡', '01055556666', '대구시 북구', 'VIP');

CREATE TABLE tbl_class_202201(
	resist_month varchar2(6),
	c_no char(5),
	class_area varchar2(15),
	tuition number(8),
	teacher_code char(3),
	primary key(resist_month, c_no)
);

insert into TBL_class_202201 values('202203','10001','서울본원','100000','100');

insert into TBL_class_202201 values('202203','10002','성남분원','100000','100');
insert into TBL_class_202201 values('202203','10003','대전분원','200000','200');
insert into TBL_class_202201 values('202203','20001','부산분원','150000','300');
insert into TBL_class_202201 values('202203','20002','대구분원','200000','400');


select teacher_code 강사코드, teacher_name 강사명, class_name 강의명, to_char(class_price, 'l999,999,999') 수강료, to_char(substr(teach_resist_date,1,4)||'년'|| substr(teach_resist_date,5,2) || '월' || substr(teach_resist_date,7,2) ||'일')강사자격취득일 from TBL_TEACHER_202201;




select substr(resist_month,1,4)||'년'|| substr(resist_month,5,2)||'월' resist_month, a.c_no,  c_name,class_name, class_area,'￦ '||TO_CHAR(tuition, 'FM999,999,999,999') tuition, grade from tbl_class_202201 a, tbl_member_202201 b, tbl_teacher_202201 c where a.c_no = b.c_no and a.teacher_code = c.teacher_code;


select teacher_code 강사코드, class_name 강의명, teacher_name 강사명, (to_char(sum(class_price), 'l999,999,999')) from TBL_TEACHER_202201 group by teacher_code, teacher_name, class_name; 

select a.teacher_code teacher_code, class_name, teacher_name, '￦ '||TO_CHAR(sum(tuition),'FM999,999,999,999') tuition from tbl_teacher_202201 a, tbl_class_202201 b where a.teacher_code = b.teacher_code group by a.teacher_code, class_name, teacher_name order by a.teacher_code









