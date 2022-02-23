--제 3정규화
--정규화 -- 데이터를 어떻게 쌓을것인가의 문제
--제1정규화 -- 단일테이블 - 하나의 테이블을 만들때 특정필드의값이 다른필드들의 값에 독립적이어야 한다.
--제2정규화 -- 다 대 다의 엔터티 테이블이 만들어질때 두 엔터티에 의해서 행위가 만들어지면
           -- 반드시 그행위 테이블로 만들어져서 데이터가 row 로 쌓여야 하고
           -- 새롭게 만든 테이블은 기존의 두테이블과 1 대 다의 관계를 만든다.

--제 3정규화
           -- 코드성 데이터
           -- 1 대 다 의 관계가 형성되는 데이터 --> 반복 --> 역정규화 제4정규화
           
SELECT * FROM STUDENTS;
--지역별로 학생의 분포도 가 필요해
INSERT INTO STUDENTS VALUES('S012', '홍길순', '01033334444', '사울', 'F', 24);
SELECT SADDR, COUNT(*)
FROM STUDENTS
GROUP BY SADDR
;

--ROLLBACK;

--코드성 값
--서울, 인천, 경기, 강원, 충북, 충남, 대전, 세종, 전북, 전남 ,광주, 경북, 대구, 경남, 울산, 창원, 부산, 제주
CREATE TABLE CIDO
(
    CODEID      CHAR(4)         NOT NULL   PRIMARY KEY,
    CODENAME    VARCHAR2(200)   NOT NULL,
    CODEEXT     VARCHAR2(1000)  NULL
);
SELECT * FROM CIDO;
--COMMIT;
INSERT INTO CIDO VALUES('C001','서울', NULL);
INSERT INTO CIDO VALUES('C002','인천', NULL);
INSERT INTO CIDO VALUES('C003','경기', NULL);
INSERT INTO CIDO VALUES('C004','강원', NULL);
INSERT INTO CIDO VALUES('C005','충북', NULL);
INSERT INTO CIDO VALUES('C006','충남', NULL);
INSERT INTO CIDO VALUES('C007','대전', NULL);
INSERT INTO CIDO VALUES('C008','세종', NULL);
INSERT INTO CIDO VALUES('C009','전북', NULL);
INSERT INTO CIDO VALUES('C010','전남', NULL);
INSERT INTO CIDO VALUES('C011','광주', NULL);
INSERT INTO CIDO VALUES('C012','경북', NULL);
INSERT INTO CIDO VALUES('C013','대구', NULL);
INSERT INTO CIDO VALUES('C014','경남', NULL);
INSERT INTO CIDO VALUES('C015','울산', NULL);
INSERT INTO CIDO VALUES('C016','창원', NULL);
INSERT INTO CIDO VALUES('C017','부산', NULL);
INSERT INTO CIDO VALUES('C018','제주', NULL);


SELECT * FROM STUDENTS;
SELECT * FROM CIDO;

SELECT * FROM CIDO T1, STUDENTS T2
WHERE T1.CODEID = T2.SADDR
ORDER BY T2.SID
;

UPDATE STUDENTS
SET SADDR = 'C017'
WHERE SID = 'S001'
;



