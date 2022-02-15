
/*
    매출 기록
    
    데이터 : '고객'이 '상품'을 '구매'하는 행위
    -> 엔티티 : 행위의 주체 (고객, 상품)
    -> 행위 : '구매'
    고객, 상품, 구매 TABLE이 필요하다

-- 2022.01.01
    1번
    콜라 700원 * 3개 = 2100원  ------------------------->홍길동이 콜라 3개를 700원씩 총 2100원에 구매하는 행위 발생
    새우깡 500원 * 2개 = 1000원
    
-- 2022.01.02
    2번
    콜라 700원 * 5개 = 3500원
    새우깡 500원 * 3개 = 1500원
    아이스크림 1000원 * 2개 = 2000원
    사이다 600원 * 2개 = 1200원
    
    .
    .
    .
    
-- 2022.01.31 ( 사이다, 아이스크림 가격 변동)
    3번
    사이다 700원 * 2개 = 1400원
    아이스크림 900원 * 3개 = 2700원


*/




--엑셀 시트처럼 표 만들기

-- TABLE 조회하기
-- SELECT 컬럼명 FROM 테이블명;
SELECT NAME, PRICE, QTY FROM order_tbl;

SELECT * FROM ORDER_TBL;

-- DATA를 입력하기
-- INSERT INTO 테이블명(컬럼명들) VALUES(입력값);
INSERT INTO ORDER_TBL(IDX, NAME, PRODUCT, COST, PRICE, QTY, TOTALPRICE, ORDERDATE)
VALUES(1, '홍길동', '콜라', 500, 700, 3, 2100, '20220101');

-- 테스트할때만 컬럼명 생략
INSERT INTO ORDER_TBL VALUES(2, '전우치', '새우깡', 300, 500, 2, 1000, '20220101');
INSERT INTO ORDER_TBL VALUES(3, '전우치', '아이스크림', 600, 900, 4, 5400, '20220101');

--COMMIT;(저장)

INSERT INTO ORDER_TBL VALUES(4, '전우치', '아이스크림', 600, 900, 4, 5400, '20220101');

--ROLLBACK;(커밋되지 않은 데이터들 삭제하기)


--------------------------------------------------------------------------------

-- 테이블 만들기
CREATE TABLE PRODUCT
(
    IDX         NUMBER(4)       NOT NULL, -- INDEX
    NAME        VARCHAR2(20)    NOT NULL, -- 구매자이름
    PDNAME      VARCHAR2(200)   NOT NULL, -- 상품명
    COST        NUMBER(8)       NOT NULL, -- 상품원가
    PRICE       NUMBER(8)       NOT NULL, -- 판매가격
    QTY         NUMBER(4)       NOT NULL, -- 수량
    TOTALPRICE  NUMBER(10)      NOT NULL, -- 총 가격
    ORDERDATE   VARCHAR2(8)     NOT NULL -- 판매일자
);

--COMMIT;

INSERT INTO PRODUCT VALUES(1, '전우치', '새우깡', 300, 500, 2, 1000, '20220101');
INSERT INTO PRODUCT VALUES(2, '홍길동', '콜라', 400, 700, 3, 2100, '20220101');
INSERT INTO PRODUCT VALUES(3, '홍길동', '사이다', 500, 700, 2, 1400, '20220101');
INSERT INTO PRODUCT VALUES(4, '전우치', '아이스크림', 600, 900, 4, 3600, '20220101');
INSERT INTO PRODUCT VALUES(5, '전우치', '아이스크림', 600, 900, 3, 2700, '20220101');
INSERT INTO PRODUCT VALUES(6, '전우치', '새우깡', 300, 500, 4, 2000, '20220101');
INSERT INTO PRODUCT VALUES(7, '강우서', '사이다', 500, 700, 4, 2800, '20220101');
INSERT INTO PRODUCT VALUES(8, '강우서', '콜라', 400, 700, 10, 7000, '20220101');
INSERT INTO PRODUCT VALUES(9, '강우서', '새우깡', 300, 500, 3, 1500, '20220101');

SELECT * FROM PRODUCT;




-- 조회하기 : 조건을 만족하는 ROW

-- 구매 총 금액이 3000원 이상인 경우
SELECT * FROM PRODUCT
WHERE TOTALPRICE>=3000;

-- 전우치가 구매한 목록
SELECT * FROM PRODUCT
WHERE NAME='전우치';

-- 구매 금액이 2000원보다 적은 경우
SELECT NAME, PDNAME, TOTALPRICE FROM PRODUCT
WHERE TOTALPRICE<2000;

-- 이름, 상품명, 이윤
SELECT NAME, PDNAME, PRICE-COST FROM PRODUCT;

-- 이윤이 300원인 상품의 상품명
SELECT PDNAME, PRICE-COST FROM PRODUCT
WHERE (PRICE-COST)=300;

-- 상품명이 새우깡이고 3개 이상 판매된 경우(AND : 교집합)
SELECT * FROM PRODUCT
WHERE PDNAME='새우깡' AND QTY>=3 ;

-- 상품명이 새우깡이거나 아이스크림인 경우(OR : 합집합)
SELECT * FROM PRODUCT
WHERE PDNAME='새우깡' OR PDNAME='아이스크림' ;
SELECT * FROM PRODUCT WHERE PDNAME='새우깡';
SELECT * FROM PRODUCT WHERE PDNAME='아이스크림';

SELECT * FROM PRODUCT;

----------------------------------

--데이터의 수정(필드값을 수정)
UPDATE PRODUCT
SET ORDERDATE = '20220102',
    QTY = 5,
    TOTALPRICE = 3500
WHERE IDX=3;

UPDATE PRODUCT
SET ORDERDATE='20220103'
WHERE IDX=4 OR IDX=5 OR IDX=6;

UPDATE PRODUCT
SET ORDERDATE='20220104'
WHERE IDX=7 OR IDX=8 OR IDX=9;

SELECT * FROM PRODUCT;

--------------------------

-- 20220102 ~ 20220103 판매 목록
SELECT * FROM PRODUCT
WHERE ORDERDATE >= '20220102' AND ORDERDATE <= '20220103';

SELECT * FROM PRODUCT;

--삭제
--구매자가 전우치인 데이터 삭제
DELETE FROM PRODUCT
WHERE NAME='전우치';

--IDX=6인 데이터 삭제
DELETE FROM PRODUCT WHERE IDX=6;

----------------------------------------------

-- 제1정규화 위배
-- TOTALPRICE는 PRICE와 QTY를 곱해 구해지는 값이므로 필요가 없다
-- 독립적이지 않다
SELECT IDX, NAME, PDNAME, COST, PRICE, QTY, ORDERDATE, QTY*PRICE
FROM PRODUCT;


-- 고객이 누구인지 알 수 없다 : 고객 표 만들기
-- 고객 아이디, 이름, 나이, 주소, 연락처, .....(속성들)
-- 엔티티의 필드(속성)가 늘어나는 것은 데이터의 갯수와는 무관하다

-- 어떤 상품들을 판매하는지 알 수 없다 : 상품 표 만들기
-- 상품 아이디, 상품명, 제조사, 가격, ...
-- 이름만 같고 속성이 다른 상품을 어떻게 구분할 것인가? : 중복되지 않는 고유의 값 필요

-- 각 데이터를 구분할 수 있는 고유의 속성으로 구매 테이블을 구성할 필요가 있다
-- 구매 테이블 = 행위 = 엔티티들의 관계를 나타낸 테이블
-- 엔티티들의 관계를 나타낸 테이블 : 1대 다의 관계를 가진다(제2정규화)
-- 한 고객이 여러 개의 상품 구매 / 한 상품을 여러 고객이 구매

------------------------------------------------------------------------
SELECT * FROM PRODUCT;

SELECT * FROM PRODUCT
WHERE PDNAME='새우깡';

SELECT * FROM PRODUCT
WHERE TOTALPRICE > 2000;

SELECT * FROM PRODUCT
WHERE TOTALPRICE <=2000;

-- 같지 않다
-- 홍길동이 아닌 고객의 데이터
SELECT * FROM PRODUCT
WHERE NAME != '홍길동';

SELECT * FROM PRODUCT
WHERE NAME <> '홍길동';

-- 여러 조건을 한번에(IN)
SELECT * FROM PRODUCT
WHERE IDX=3 OR IDX=5 OR IDX=7;

SELECT * FROM PRODUCT
WHERE NAME IN('전우치', '홍길동');

-- 상품 이름 중 '다'가 포함된 데이터
SELECT * FROM PRODUCT
WHERE PDNAME LIKE '%다%';

SELECT * FROM PRODUCT
WHERE PDNAME LIKE '%이%';

-- '사'로 시작되는 문자열을 포함하는 데이터
SELECT * FROM PRODUCT
WHERE PDNAME LIKE '사%';

-- '다'로 끝나는 데이터
SELECT * FROM PRODUCT
WHERE PDNAME LIKE '%다';


-- 사이에 있는 값
-- 판매가격이 600~900인 상품 데이터
SELECT * FROM PRODUCT WHERE PRICE>=600 AND PRICE<=900;
SELECT * FROM PRODUCT WHERE PRICE BETWEEN 600 AND 900;

SELECT * FROM PRODUCT WHERE NAME>='가' AND NAME<='카';
SELECT * FROM PRODUCT WHERE NAME BETWEEN '가' AND '카';

-- 계산
SELECT 8+9 FROM DUAL; -- 가상의 메모리 TABLE(DUAL)
SELECT 8+'9' FROM DUAL;
SELECT '8'+'9' FROM DUAL; -- 자동으로 숫자로 변환
-- 문자는 어떻게 더하나
SELECT 8||9 FROM DUAL;-- 자동으로 문자로 변환
SELECT '8'||'9' FROM DUAL;

SELECT NAME, PDNAME, NAME||PDNAME, PRICE*QTY, (PRICE-COST)*QTY FROM PRODUCT;


------------------------------------------------------------------------------
-- 하나의 데이터 = 하나의 row!!!!
-- 이름으로 데이터를 구분하지 말 것 / 이름은 데이터의 속성 중 하나일 뿐
-- 학생이 시험을 친다

-- 학생
-- A    홍길동     27      01012345678
-- B    홍길순     25      01011112222
-- C    최구라     22      01022223333

-- 과목
-- s1    국어  100
-- s2    수학  50
-- s3    수학  70

-- 시험(행위) : 학생 & 과목
-- A    s1  80
-- A    s2  40
-- B    s1  70
-- B    s3  60
-- c    s1  90
-- c    s2  50
-- c    s3  30

-- 학생 & 과목 : 다대다 관계 (>------<)
-- 학생 & 시험 / 과목 & 시험 : 일대다 관계 (-|------<)


-- 학생 & 출석 : 1대1 --> 결석한 학생은 join 하면 알 수 있다
-- 출석(행위)
-- 1    A   08:10   2/15    등교
-- 2    B   08:15   2/15    등교
-- 3    C   08:20   2/15    등교
-- 4    A   17:20   2/15    하교
-- 5    B   17:25   2/15    하교
-- 6    C   17:26   2/15    하교


--1. 학생 테이블 생성
CREATE TABLE STUDENTS(
    STUID       CHAR(3)         NOT NULL,
    STUNAME     VARCHAR2(20)    NOT NULL
);

INSERT INTO STUDENTS(STUID, STUNAME) VALUES ('001','홍길동');
INSERT INTO STUDENTS(STUID, STUNAME) VALUES ('002','홍길순');
INSERT INTO STUDENTS(STUID, STUNAME) VALUES ('003','최구라');
INSERT INTO STUDENTS(STUID, STUNAME) VALUES ('004','최그리');
INSERT INTO STUDENTS(STUID, STUNAME) VALUES ('005','김철수');

SELECT * FROM STUDENTS;

--2. 출석관리 테이블 생성
CREATE TABLE ATTENDANCE(
    IDX         NUMBER(4)       NOT NULL,
    STUID       CHAR(3)         NOT NULL,
    ATT_TIME    VARCHAR2(5)     NOT NULL,
    GBN         CHAR(1)         NOT NULL, -- 등교:I / 하교:O
    INDATE      VARCHAR(8)      NOT NULL
);

INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(1, '001', '0813', 'I', '20220215');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(2, '003', '0823', 'I', '20220215');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(3, '002', '0826', 'I', '20220215');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(4, '005', '0831', 'I', '20220215');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(5, '004', '0848', 'I', '20220215');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(6, '004', '1550', 'O', '20220215');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(7, '002', '1721', 'O', '20220215');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(8, '003', '1725', 'O', '20220215');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(9, '001', '1733', 'O', '20220215');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(10, '005', '1750', 'O', '20220215');

INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(11, '001', '0813', 'I', '20220216');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(12, '003', '0823', 'I', '20220216');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(13, '002', '0826', 'I', '20220216');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(14, '004', '0848', 'I', '20220216');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(15, '004', '1550', 'O', '20220216');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(16, '002', '1721', 'O', '20220216');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(17, '003', '1725', 'O', '20220216');
INSERT INTO ATTENDANCE(IDX, STUID, ATT_TIME, GBN, INDATE)
VALUES(18, '001', '1733', 'O', '20220216');

SELECT * FROM ATTENDANCE;

--1. ID가 001인 학생의 등/하교 결과
SELECT * FROM ATTENDANCE WHERE STUID='001';

--2. 지각한 사람(8시40분이후출석)
SELECT * FROM ATTENDANCE WHERE GBN='I' AND ATT_TIME>'0840';

--3. 조퇴한 사람
SELECT * FROM ATTENDANCE WHERE GBN='O' AND ATT_TIME<'1720';

-- 결석한 사람 : JOIN 필요

----------------------------------

-- 학생이 과목(수업)에 출석

CREATE TABLE SUBJECTS(
    SUBID       CHAR(4)         NOT NULL,
    SUBNAME     VARCHAR2(20)    NOT NULL,
    PSCORE      NUMBER(3)       NOT NULL,
    SISU        NUMBER(1)       NOT NULL
);

INSERT INTO SUBJECTS(SUBID, SUBNAME, PSCORE, SISU)
VALUES('SUB1', '국어', 100, 3);
INSERT INTO SUBJECTS(SUBID, SUBNAME, PSCORE, SISU)
VALUES('SUB2', '국어', 70, 2);
INSERT INTO SUBJECTS(SUBID, SUBNAME, PSCORE, SISU)
VALUES('SUB3', '수학', 50, 2);

SELECT * FROM SUBJECTS;

-- 학생이 과목별 시험을 친다

CREATE TABLE EXAMS(
    IDX     INT         NOT NULL,   --INT는 정수, NUMBER는 소숫점가능
    STUID   CHAR(3)     NOT NULL,
    SUBID   CHAR(4)     NOT NULL,
    SCORE   NUMBER(5,2) NOT NULL    -- 5자리 숫자 중 소숫점 2자리
);

INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(1, '001', 'SUB1', 78);
INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(2, '001', 'SUB2', 56);
INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(3, '001', 'SUB3', 42);
INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(4, '002', 'SUB1', 88);
INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(5, '002', 'SUB3', 32);
INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(6, '003', 'SUB2', 56);
INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(7, '003', 'SUB3', 28);
INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(8, '004', 'SUB1', 90);
INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(9, '004', 'SUB2', 61);
INSERT INTO EXAMS(IDX, STUID, SUBID, SCORE) VALUES(10, '005', 'SUB1', 77);


SELECT * FROM EXAMS;

-- 100점 만점의 3학점짜리 국어시험의 결과(SUB1)
SELECT * FROM EXAMS WHERE SUBID='SUB1';

-- 100점 만점의 3학점짜리 국어시험의 결과(SUB1) 중 80점 이상인 사람의 이름
SELECT * FROM EXAMS WHERE SUBID='SUB1' AND SCORE>=80;

-- 모든 학생의 이름에 '길동'추가
UPDATE STUDENTS SET STUNAME = STUNAME||'길동';

-- ID가 001인 학생의 이름에 '길동'추가
UPDATE STUDENTS SET STUNAME = STUNAME||'길동'
WHERE STUID='001';

-- 성이 최씨인 학생의 목록
SELECT * FROM STUDENTS WHERE STUNAME LIKE '최%';





-- ALTER, MODIFY, FIX, UPDATE의 차이?
-- EXAMS 테이블에서 수학점수가 40점 이상인 경우 10%의 가산점을 준다
-- 기존 데이터를 UPDATE하지 말고 새로운 행위로 취급
-- UPDATE 이후 커밋하지 않으면 락이 걸려서 더이상 작업이 불가능하다(주의)
UPDATE EXAMS SET SCORE = SCORE+(0.1*SCORE) WHERE SCORE>=40 AND SUBID='SUB3';




















