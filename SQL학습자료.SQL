-- 1. DDL언어 학습하기
-- 1-1. create 문
-- create table 테이블이름(컬럼이름 컬럼타입 컬럼크기 null여부  컬럼기본값 제약조건);
-- 테이블 스키마 생성
create table MEMBER(
midx int not null auto_increment PRIMARY KEY,
memberid VARCHAR(100) NOT NULL,
memberpwd VARCHAR(100) NOT NULL,
membername VARCHAR(100) NOT NULL,
membergender CHAR(1) NOT NULL,
memberbirth int NOT NULL,
memberaddr VARCHAR(10) NULL,
memberphone VARCHAR(20) NULL,
memberemail VARCHAR(100) NULL,
memberhobby VARCHAR(100) NULL,
delyn CHAR(1) DEFAULT'N' NOT NULL,
writeday DATETIME DEFAULT now() not null,
memberip VARCHAR(20) NULL
);

-- 1-2. alter 구문활용해서 컬럼변경하기(기존 데이터를 삭제하고 컬럼을 변경해야하나 삭제할 수 없는 상황이라면 변경시 데이터를 미리 백업한다)
-- 형식 : alter table 테이블이름 명령어 컬럼명 컬럼타입(크기) 널여부 등 수정할 컬럼 데이터 넣어주기
-- 컬럼추가 : ADD
-- 컬럼 수정 : modify
-- 컬럼 삭제 : drop
-- 컬럼 이름변경 : rename
alter table member MODIFY memberbirth VARCHAR(10) null;
-- member테이블에 memberbirth 컬럼을 가변형 문자 10바이트로 바꾸고 널을 허용한다.
-- 원래 int형에 not null이었음

-- 1-3. drop table 삭제하기
-- 형식은 drop table 테이블명;
-- DROP table member;
-- ======================== DDL =============================

-- 2. DML 언어
-- 2.1 insert
-- 특정 컬럼에 값을 입력
-- 형식 : insert into 테이블명(컬럼명) values ('필드값');
-- INSERT into 테이블이름(컬럼1,컬럼2,컬럼3...) VALUES(값,값,값...); 값을 입력할 때 문자값은 '안에입력한다'
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('hong', '1234','홍길동','M','19990101','대전','01047478585', 'hong@naver.com','축구','N',now(),'211.155.244.37');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('lee', '1111','이순신','M','19990102','서울','01022222222', 'lee@naver.com','야구','N',now(),'211.155.244.37');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('kim', '2222','김아무개','M','19990103','대구','01033333333', 'kim@naver.com','농구','N',now(),'311.155.244.37');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('kang', '3333','강감찬','M','19990104','부산','01044444444', 'kang@naver.com','배구','N',now(),'411.155.244.37');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('park', '4444','박세리','F','19990105','강릉','01055555555', 'park@naver.com','테니스','N',now(),'511.155.244.37');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('jang', '5555','장동건','M','19990106','속초','01066666666', 'jang@naver.com','등산','N',now(),'611.155.244.37');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('na', '6666','나영석','M','19990107','울산','01077777777', 'na@naver.com','낚시','N',now(),'711.155.244.37');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('oh', '7777','오나라','F','19990108','군산','01088888888', 'oh@naver.com','수영','N',now(),'811.155.244.37');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('shin', '8888','신성훈','M','19990109','영덕','01099999999', 'shin@naver.com','영화','N',now(),'911.155.244.37');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
values('ma', '9999','마동석','M','19990110','인천','01012341234', 'ma@naver.com','여행','N',now(),'101.155.244.37');
-- 2.2 DELETE : 데이터 삭제
-- DELETE from member;

-- 2.3 select(데이터 조회하는 구문)
-- 형식 select 컬럼1, 컬럼2, 컬럼 3... form 테이블 이름 where 조건절 groupby그룹절 order 순서정렬;
-- 2.4 update(데이터 수정하는 구문)
-- update 테이블명 set 수정할 컬럼명 = '수정할 내용' where 조건문;

-- 테이블 이름 대소문자 확인 방법(1:  대소문자 구분 안함, 0: 대소문자 구분)
-- show VARIABLES LIKE 'lower_case_table_names';
-- 자동커밋 확인방법
-- SHOW VARIABLES like 'autocommit';
-- set  autocommit = TRUE;

-- MySQL에서는 자동 커밋이 설정되어 있음 그래서 따로 커밋 명령어  필요 없음.
-- commit; DB반영
-- rollback; 이전복원

-- 회원이름을 나열하시오
select membername FROM member;
-- 모든 회원 아이디와 회원성별을 보여주세요
select memberid, membergender FROM member;
-- 회원정보 모든 값을 출력해주세요
select * from member;
-- 회원정보중에서 회원이 여성인 회원만 이름을 출력
select membername from member where membergender = 'F';




-- 회원번호 5번인 사람의 아이디와 이름 그리고 사는 곳을 출력하세요

SELECT memberid,  membername, memberaddr  from member where midx = '5';

-- 회원 메일중에 네이버메일을 사용하는 회원정보를 모두 출력해주세요

 SELECT * from member WHERE memberemail LIKE'%naver.com%'; -- LIKE'%naver.com%'이거 찾기?

-- 회원 메일중에 네이버메일을 사용하고 대전에 사는  회원정보를 모두 출력해주세요
 SELECT * from member WHERE memberemail LIKE '%naver.com%' and memberaddr ='대전';  -- 네이버 메일을 사용하면서 대전에 사는 회원정보 꺼내기 and 조건활용 like = 값이 포함이 되어 있는가?
-- 서울에 살고 성별 여성인 회원의 정보를 출력
 SELECT * from member WHERE membergender = 'M' and memberaddr ='서울';

-- 회원의 성이 김씨인 사람의 회원정보를 모두 출력
SELECT * from member where membername LIKE '%김%';

SELECT * from member where SUBSTR(membername,1,1) = '김'; --글자 자르기를 통해서 첫글자가 김인 사람의 값을 가져온다

-- 나이가 25살이고 성이 이씨인 사람의 정보를 출력하세요.
-- 먼저 전체조회 > 나이계산은 2024 - (회원생년월일 1번째부터 4개꺼내기) = '25'
-- 그리고 (and) member like '%이%';
SELECT * from member WHERE '2024' - SUBSTR(memberbirth,1,4) = '25' AND membername LIKE'%강%';


-- 취미가 테니스 (축구) 성별이 여성인 사람이며 성이 박씨인 사람을 출력하세요.
SELECT * FROM member
	 WHERE membergender = 'F'
	 and memberhobby = '테니스'
	 AND membername LIKE '%박%';

-- 회원이름중에 ''로 끝나는 회원의 이름을 출력해주세요
SELECT * FROM member where membername LIKE '%찬';

SELECT * FROM member where SUBSTR(membername,length(membername)-6) = '신';

SELECT length (membername) from member; -- 글자  바이트 크기 출력 > 한글 은 한글자에 3바이트

SELECT char_length (membername) from member; -- 예) 글자 길이 출력 hello > 5출력됨


-- SUBSTR(컬럼명, 자리수, 갯수);
-- 갯수가 생략되어 있으면 처음부터 끝까지 출력
-- 자리수는 처음을 기준으로하면 1로 시작되고 끝을 기준으로 하면 -1로 시작한다


SELECT * from member where substr(membername,-1,1) = '동';
-- 뒤에서부터 시작하고 1글자만 출력 해서 동과 같은 데이터 출력

-- 정렬하기
order by desc, asc -- desc 내림 , asc 오름
-- 회원번호의 순서를 내림차순으로 정렬해서 출력하세요.
SELECT * from member order by midx desc;-- 번호가 10,9,8,7..,1로 출력됨
-- 회원번호의 순서를 오름차순으로 정렬해서 출력하세요.
SELECT * from member order by midx asc;-- 번호가 1,2,3,4...10으로 출력됨
-- 오름차순은 생략 가능 ! 내림차순은 생략불가

-- 회원이름순서대로 1차 오름차순 2차 지역 내림차순으로 정렬
-- > 이게 무슨뜻이냐 1차 정렬을하다가 같은 값이 있어  > 강호동이 두명인데 부산에도 살고 대구에도 살아
-- 그러면 2차 정렬 설정을 해주는 것 > 그러면 부산에 사는 강호동이 먼저 출력되어야함
SELECT * from member order by membername, memberaddr desc;

-- 데이터 수정 구문 update
-- 회원번호 3번이 데이터를 강호동으로 수정하는 구문
update member SET membername = '강감찬' WHERE midx = '3';
update member SET membername = '강호동' WHERE midx = '4';

SELECT * from member;

update member SET memberaddr = '부산' WHERE midx = '3';

-- 부산에 살고 강씨인 사람들의 명단을 1차 회원번호 내림차수능로 2차 이름 오름차순으로 정렬해서 출력
SELECT * from member WHERE memberaddr = '부산' and membername like '강%' order by midx desc, membername;

-- 성을 제외한 회원이름이 길동일때 해당 회원의 나이를 출력 (성이 한글자라는 전제하에)
SELECT SUBSTR(NOW(),1,4) - SUBSTR(memberbirth,1,4) as age from member WHERE SUBSTR(membername,2) = '길동';

-- 별칭 as
-- dual > 가상테이블 시스템now 찍어보려고 비어있는 테이블 생성함

-- 시스템 날짜 함수
select now() from dual;

-- OR조건 합집합의 개념
-- 회원들중에 서울대전부산에 사는 사람들의 명단을 최근가입한 회원번호 순으로 정렬해서 출력

SELECT * from member
WHERE memberaddr = '서울' OR memberaddr = '대전' or memberaddr = '부산'
order by midx desc;


SELECT * from member
WHERE memberaddr in('서울', '대전', '부산')order by midx desc;

-- in(비교값1,비교값2,비교값3...)


-- 서울대구광주대전에 살고있는 남성회원들의 이메일이 네이버인 사람들의 데이터를 출력
SELECT * from member
WHERE memberaddr in('서울', '대전', '부산','속초')
AND (membergender = 'M' AND memberemail LIKE '%com%')
order by midx desc;

-- 비교연산 (<, >, >=, <=, =)
-- 회원아이디가 3보다 큰 사람들의 아이디를 출력해주세요
SELECT memberid from member WHERE midx > 3;

-- 회원아이디가 3보다 크고 7보다 작은  사람들의 이름을 출력해주세요
SELECT membername from member WHERE midx > 3 and midx < 7;
-- 보다 크고 보다 작은 > between and
SELECT membername from member WHERE midx BETWEEN 4 and 6;

-- group by (그룹으로 묶을 때)
-- 형식  select 컬럼명  from 테이블명  group by 그룹화할 컬럼;

SELECT memberaddr from member GROUP BY memberaddr;

-- 회원들의 사는 곳에 그룹별 성별로 출력하세요

SELECT memberaddr, membergender from member
GROUP BY memberaddr, membergender
ORDER BY memberaddr asc;

select count(*) as count from member; -- 행의 개수
select count(midx) as count from member; --행의 컬럼개수  null값 제외

-- sum() 합구하는 함수
-- 회원들의 회원번호의 총합을 구해 출력
select sum(midx) as summidx from member
-- max() 그룹내의 최고값
-- 회원들중에 최고회원번호의 최고값을 구해서 출력하시오

SELECT max(midx) as midxmax from member ;

-- min() 그룹내 최소값
SELECT min(midx) as midxmin from member ;

-- avg() 그룹내 평균값
SELECT avg(midx) as midxavg from member ;

-- 회원들중에 사는 곳을 각 지역별로 인원수를 출력하세요
select memberaddr, count(*) as membercount from member GROUP BY memberaddr;

-- 회원들중에 사는 곳을 각 지역별, 성별로 인원수를 출력하세요
select memberaddr, membergender, count(*) from member GROUP BY memberaddr, membergender;
-- 회원번호  3-7번 회원중에 네이버메일을 사용하는 사람들의 인원수를 출력
select count(*) from member WHERE midx BETWEEN 3 and 7 and memberemail like '%naver.com%';

-- 회원번호  2-9번 회원중에 지역별로 각 인원수를 출력하시오
select memberaddr,count(*) from member WHERE midx BETWEEN 2 and 9 GROUP BY memberaddr;

-- instr()  위치값 출력하는 함수

-- 메일에서 @의 자리수 위치 출력
select memberemail, instr(memberemail,'@') as instr from member;

-- @부터 끝자리까지 출력됨 회원들이 무슨 메일을 사용하는지 확인할 수 있음
select substr(memberemail,instr(memberemail,'@'))
from member;

-- 회원들의 각 메일 사용현황(인원수)를 출력하세요
SELECT substr(memberemail,instr(memberemail,'@')), count(*)
from member
GROUP BY substr(memberemail,instr(memberemail,'@'));


-- concat() 문자붙이기 함수
SELECT concat(membername,'회원님') from member;
SELECT concat(CONCAT(membername,'회원님'),'~!!') from member;

-- 서브쿼리
--1.1 where절 : where조건절 안에 쿼리가 존재
-- 회원들 중에 회원번호가 회원번호 평균값보다 작은 사람들의 명단을 출력
select midx, membername from member
where midx < (SELECT AVG(midx) from member);

-- 회원번호가 홀수인 사람들의 명단을 서브쿼리를 활용해서 출력
-- MOD() 나머지 추출 연산함수

SELECT mod(midx,2) from member;

SELECT * from member where mod(midx,2) = 1 ;

SELECT * from member
where midx in
(select midx from member where MOD(midx,2) = 1)



-- 테이블별칭
select A.* from member A;

-- 스칼라 서브 쿼리 : 컬럼절 안에 존재하는 쿼리
-- 회원번호와 회원이름을 스칼라 쿼리를 활용해서 출력하시오

select a.midx,
(select b.membername from member b where b.midx= a.midx =1)
from member a;

-- 인라인뷰 : from절에 쿼리가 들어감
-- 회원이름 회원성별 회원나이만 있는 테이블 만드록 성별이 여성인 사람의 명단을 출력
SELECT A.membername, A.age
from (SELECT membername, membergender, (2024 - SUBSTR(memberbirth,1,4)) as age
from member) A
where A.membergender = 'F';



select when then else end
-- 회원번호가 1,5번인 사람은 로또당첨이라고 출력하고 나머지는 꽝이라고 출력하세요

select
	case midx
		when 1 then '로또당첨'
		when 5 then '로또당첨'
	ELSE'꽝입니다.'
	end as msg
from member;

SELECT midx,
	case when midx = 1 or midx = 5 then '로또당첨'
	ELSE '꽝입니다.'
	END as msg
from member;

-- if() : 조건식함수

SELECT midx,if(midx in(1,5),'로또당첨', '꽝입니다.') as msg from member;
SELECT midx,if(midx = 1,'당첨', if(midx = 5,'당첨','꽝')) as msg from member;

-- null체크함수 nvl() > 오라클에서는 이렇게
-- ifnull() > MySQL에서는 이렇게 사용

SELECT ifnull(memberip,'아이피가 존재하지 않습니다.') as memberip from member ;

-- 회원ip가 null인 사람의 명단을 출력하세요
SELECT a.membername from member a where a.memberip is null;

-- 날짜함수
-- 연도를 추출하는 함수 : YEAR()

-- 회원번호 3번인 사람의 가입년도를 출력하세요
-- year()
SELECT YEAR(writeday) from member where midx = '3'
-- month()
SELECT MONTH(writeday) from member where midx = '3'
-- date()
SELECT date(writeday) from member where midx = '3'
-- 기타 시간함수 hour(), minute(), second()
-- 요일 함수 weekday();
-- 출력 : 0 = 월, 1 = 화, 2 = 수 , 3 = 목, 4 = 금, 5 = 토, 6 = 일
SELECT WEEKDAY(now()) from dual;
-- last_day() 해당날짜의 달의  마지막 날짜 정보
SELECT last_day(writeday) from member ;

-- 현재날짜와 시간
SELECT curdate() from dual;
SELECT CURRENT_TIMESTAMP() from dual;

-- 현재날짜
SELECT curdate() from dual;
SELECT current_date() from dual;

-- 현재시각
SELECT curtime() from dual;
SELECT current_time() from dual;

-- 날짜 표현을 형식화 시키는 함수 date_format(날짜 데이터가 들어있는 컬럼명, 원하는 형식)

select date_format(writeday,'%Y-%m-%d')from member;
select date_format(writeday,'%Y-%m-%d%T')from member;
select date_format(writeday,'%Y-%m-%d %h:%i:%s')from member;

-- 날짜 계산함수 date_add()
SELECT date_add(now(), INTERVAL 1 day) from dual; -- 오늘 날짜에 하루 더해서 출력하겠다.

-- 문자를 날짜로 변환하는 함수 str_to_date()
SELECT STR_TO_DATE('20300505','%Y%m%d') from dual;



--2024년 10 월 9일의 요일을 출력해보세요

SELECT WEEKDAY(STR_TO_DATE('20241009','%Y%m%d')) from dual;

SELECT
	case weekday('20241009')
	when '0' then '월요일'
	when '1' then '화요일'
	when '2' then '수요일'
	when '3' then '목요일'
	when '4' then '금요일'
	when '5' then '토요일'
	when '6' then '일요일'
	END

-- union 사용하기
-- 회원번호 1 번인 사람의 이름과 대전에 사는 사람들의 명단을 모두 출력하세요
SELECT membername from member where midx ='1'
union
SELECT membername from member where memberaddr = '대전';

-- 서울대전부산에 사는 사람들의 나이와 명단과 / 여성인 사람의 나이와 명단을 모두 출력
SELECT  membername, 2024 - SUBSTR(memberbirth,1,4)from member WHERE memberaddr IN('서울','대전','부산')
UNION
SELECT membername, 2024 - SUBSTR(memberbirth,1,4) from member where membergender = 'F';

-- 임시테이블 사용하기
-- 필요한 데이터를 추출후 임시형태로 보관후 필요한 조건에 따라 다시 추출 하는 방법
with temptables as (
SELECT * from member where membergender = 'M'
)
select * from temptables;

-- 가상테이블 : 두개이상의 테이블을 조인해서 새로운 데이터를 만들어 사용할 때 가상의 테이블을 생성해소ㅓ 데이터를 담는다
CREATE view virtualtable
AS
SELECT * from member where memberaddr='대전';


-- rownum 행의 순서
-- 회원정보를 회원번호 내림차순으로 순서를 두고 정렬하시오

SELECT * from (
SELECT @rownum as num, A.*from member A ORDER BY midx desc
);

set @rown:=0; -- 변수를 선언하고 해당변수를 0으로 할당한다는 의미
SELECT @rownum:=@rownum+1 as rownum, A.*from member A ORDER BY A.midx desc;

-- 프로시저 만들기
-- 프로시저란 db안에서 반복문 조건문 등을 돌릴 수 있는 공간을 만드는 방법
 create PROCEDURE proctest(
 param_name VARCHAR(20)
 )
 begin

 	declare i int; -- 변수선언 타입과 같이
 	SET i:= 1; -- 변수에 초기값 담기

 	while i<=1000 do -- 반복문 사용하기

 	insert into
	member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby,delyn,writeday,memberip)
	values(CONCAT(param_name,i), '0000','홍길동','M','19990101','인천','82+50508228', 'hdng@naver.com','여행','N',now(),'101.155.244.37');
 	set i = i+1;
 	end while; -- 반복문끝
 end

 DROP PROCEDURE proctest;

 call proctest('test');
 SELECT count(*) from member;
 select * from member;
 delete from member where midx > 10; -- 회원번호가10보다 크면 다 지워주세요
 -- 240930




 -- 241001 인덱스 생성하기
 -- 데이터를 조회할 때 검색 속도를 빨리하기 위해서 목차(색인)이라소 하는
 -- index를 사용해서 데이터 검색의 효율성을 높인다.
 -- CREATE INDEX 인덱스명  on 테이블명(인덱스를 걸 컬럼명);


 SELECT count(*) FROM member;
 CREATE INDEX memberid_idx ON member(memberid);

 SELECT * from member;

 SELECT * from member where memberid = 'hong';


 -- 게시판테이블 생성하기
 CREATE TABLE BOARD(
 	bidx int not null AUTO_INCREMENT PRIMARY KEY, -- 글번호
 	subject VARCHAR(100) not null, -- 제목
 	contents TEXT not null, -- 내용
 	writer VARCHAR(100) not null, -- 작성자
 	recom int null, -- 추천수
 	viewcnt int null, -- 조회수
 	filename VARCHAR(100) null, -- 파일명
 	writeday datetime default now(), -- 작성일
 	delyn char(1) default 'N', -- 삭제여부
 	ip varchar(30) null, -- ip 정보
 	midx int not null -- 회원번호
 );
 -- 외래키 제약조건 추가(FOREIGN KEY 외래키 추가)
 alter table board
 add constraint fk FOREIGN KEY(midx) REFERENCES MEMBER(midx);

select * from information_schema.table_constraints where table_name = 'board';
alter table board drop foreign key board_idfk_1;

-- alter table 테이블명 add constraint 외래키명
-- foregin key 컬럼명 REFERENCES 테이블명 (컬럼명);

INSERT INTO Board(subject,contents, writer,recom, viewcnt,filename,ip,midx )
values('글제목','글내용', '글작성자', 0,0,null, '211.111.222.330',1);

SELECT*from member;
SELECT*from board;


-- 추천수 기본값 0으로 초기화
ALTER table board
modify recom int DEFAULT 0;
-- 조회수 기본값 0으로 초기화
ALTER table board
modify viewcnt int DEFAULT 0;

INSERT INTO Board(subject,contents, writer,recom, viewcnt,filename,ip,midx )
values('글제목2','글내용2', '글작성자2', 0,0,null, '211.111.222.330',2);

-- join 공통된 컬럼으로 묶어서 하나의 테이블로 합치는 방법
-- 형식 : SELECT *from 테이블 1 inner join 테이블 2 on 테이블1.pk컬럼 = 테이블 2.fk컬럼
-- 회원아이디가 test2인 사람의 글제목을 출력
select A.subject from board A inner join member B on B.midx
 = A.midx where B.memberid ='test101';

























