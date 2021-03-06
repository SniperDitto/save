
-- 제3정규화
    SELECT * FROM STUDENTS;
    --지역별 학생 분포
    --지역, 단위 : 코드성 값

--INSERT INTO STUDENTS(SID, SNAME, STEL, SADDR, SGENDER, SAGE) 
--VALUES('S011', '홍길동', '01010101010','광주','M',28);

SELECT SADDR, COUNT(*) FROM STUDENTS GROUP BY SADDR;


--코드성 값
--서울, 인천, 경기, 강원, 충북, 충남, 대전, 세종, 전북, 전남, 광주, 경북, 대구, 경남, 울산, 창원, 부산, 제주

--코드성 값을 관리하기 위한 새로운 테이블 : CITY + DO
CREATE TABLE CIDO(
    CODEID      CHAR(4)         NOT NULL    PRIMARY KEY,
    CODENAME    VARCHAR2(200)   NOT NULL,
    CODETXT     VARCHAR2(1000)  NULL
);

INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C001','서울',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C002','인천',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C003','경기',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C004','강원',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C005','충북',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C006','충남',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C007','대전',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C008','세종',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C009','전북',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C010','전남',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C011','광주',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C012','경북',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C013','대구',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C014','경남',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C015','울산',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C016','창원',NULL); --마산/창원/진해
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C017','부산',NULL);
INSERT INTO CIDO(CODEID, CODENAME, CODETXT) VALUES('C018','제주',NULL);

SELECT * FROM CIDO;
SELECT * FROM STUDENTS;

--MERGE INTO : JOIN 이용해 UPDATE

UPDATE STUDENTS SET SADDR='C017' WHERE SADDR='부산';
UPDATE STUDENTS SET SADDR='C015' WHERE SADDR='울산';
UPDATE STUDENTS SET SADDR='C016' WHERE SADDR='창원';
UPDATE STUDENTS SET SADDR='C014' WHERE SADDR='김해';--경남
--C

SELECT * FROM CIDO C, STUDENTS ST WHERE C.CODEID=ST.SADDR ORDER BY ST.SID;

----------------------------------------------
--카테고리
CREATE TABLE MENUS1(
    MID     CHAR(4)         NOT NULL    PRIMARY KEY,
    MNAME   VARCHAR2(50)    NOT NULL
);

INSERT INTO MENUS1(MID, MNAME) VALUES('M001','공지사항');
INSERT INTO MENUS1(MID, MNAME) VALUES('M002','수업자료');
INSERT INTO MENUS1(MID, MNAME) VALUES('M003','숙제');
INSERT INTO MENUS1(MID, MNAME) VALUES('M004','자료공유');
INSERT INTO MENUS1(MID, MNAME) VALUES('M005','동영상');
INSERT INTO MENUS1(MID, MNAME) VALUES('M006','개인게시판');

SELECT * FROM MENUS1;


--하위메뉴1
CREATE TABLE MENUS2(
    MID2    CHAR(4)         PRIMARY KEY,
    MNAME2  VARCHAR2(50)    NOT NULL,
    MID     CHAR(4)         NOT NULL -- 상위메뉴ID(카테고리)
);
    --공지사항(M001)
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M201','공지사항','M001');
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M202','PM게시판','M001');
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M203','ㅁㄴㅇㄹ','M001');

    --수업자료(M002)
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M204','HTML','M002');
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M205','JAVASCRIPT','M002');
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M206','DATABASE','M002');
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M207','WEB_PROGRAM','M002');

    --숙제(M003)
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M208','숙제1','M003');
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M209','숙제2','M003');

    --자료공유(M004)
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M210','자료1','M004');
    INSERT INTO MENUS2(MID2, MNAME2, MID) VALUES('M211','자료2','M004');

SELECT * FROM MENUS2;

--하위메뉴2
CREATE TABLE MENUS3(
    MID3    CHAR(4)         PRIMARY KEY,
    MNAME3  VARCHAR2(50)    NOT NULL,
    MID2    CHAR(4)         NOT NULL -- 상위메뉴ID(하위메뉴1)
);

SELECT * FROM MENUS3;



--페이지 로딩 시
    --SELECTBOX1
    SELECT * FROM MENUS1;
    --SELECTBOX1의 공지사항 선택시 SELECTBOX2의 목록 내용
    SELECT M1.MNAME, M2.MNAME2 
    FROM MENUS1 M1, MENUS2 M2 
    WHERE M1.MID=M2.MID AND M2.MID='M001';


---------------------------------------------------------------
--SUBJECTS(엔티티), PROFESSORS(엔티티), STUDENTS(엔티티),
--EXAMS(행위), SCORES(행위),
--CIDO(코드성 데이터)

INSERT INTO EXAMS VALUES(9,'P009','S006','음악2 시험');
INSERT INTO SCORES VALUES('S005','P009','S006',1,89.10);

--1. 부산에 사는 학생들의 음악점수(미응시 0점)
    --행위의 결과는 어디 있는가? : SCORES
    SELECT * FROM SCORES;
    SELECT * FROM EXAMS;
    SELECT * FROM SUBJECTS;
    
    --시험을 본 결과가 점수이므로 시험 테이블을 거쳐야 한다
    --과목 - 점수 (x)
    --과목 - 시험 - 점수(o)
    
    --시험친사람만
    SELECT ST.SID, ST.SNAME, SU.SUBID, SU.SNAME, SC.SCORE 
    FROM SCORES SC, EXAMS E, SUBJECTS SU, STUDENTS ST
    WHERE SC.PID=E.PID AND SC.SUBID=E.SUBID 
        AND SC.SUBID=SU.SUBID 
        AND SC.SID=ST.SID 
        AND ST.SADDR='C017' 
        AND (SU.SUBID='S006');
        --AND((E.PID='P009' AND E.SUBID='S006') OR (E.PID='P008' AND E.SUBID='S006'));
        
    
    --미응시 0점 : 도시, 이름, 시험이름, 점수
    SELECT C.CODENAME AS CITY, A.SNAME, A.ENAME, NVL(SC.SCORE,0) AS SCORE
    FROM CIDO C, SCORES SC, 
    (
        --모든학생 & 모든음악시험
        SELECT ST.SNAME, ST.SID, ST.SADDR, E.ENAME, E.SUBID, E.PID
        FROM STUDENTS ST, EXAMS E
        WHERE E.SUBID='S006'
    ) A
    WHERE C.CODEID(+)=A.SADDR
        AND SC.SID(+)=A.SID
        AND SC.PID(+)=A.PID
        AND SC.SUBID(+)=A.SUBID
        AND C.CODENAME='부산'
    ORDER BY A.SNAME ASC;
    
    
    
--2. 출제교수별 학생들의 평균점수 : 출제교수, 시험명, 평균점수
--출제 안한 교수는 제외함
    --미응시자 미포함
    SELECT P.PID, P.PNAME, SU.SNAME, E.ENAME, ROUND(AVG(SC.SCORE),2) AS AVERAGE
    FROM PROFESSORS P, STUDENTS ST, SCORES SC, EXAMS E, SUBJECTS SU
    WHERE P.PID=E.PID 
        AND ST.SID=SC.SID 
        AND SC.PID=E.PID 
        AND SC.SUBID=E.SUBID 
        AND SU.SUBID=SC.SUBID
    GROUP BY P.PID, P.PNAME, SU.SNAME, E.ENAME
    ORDER BY P.PID ASC;

    --미응시자 포함(0점)
    SELECT P.PID, P.PNAME, SU.SNAME, A.ENAME, ROUND(AVG(NVL(A.SCORE,0)),2) AS AVERAGE
    FROM PROFESSORS P, SUBJECTS SU,
    (
        -- A : 모든학생+모든시험+모든점수 - STUDENTS, EXAMS, SCORES
        SELECT E.PID, E.SUBID, E.ENAME, ST.SID, ST.SNAME, SC.SCORE
        FROM STUDENTS ST, EXAMS E, SCORES SC
        WHERE ST.SID=SC.SID(+)
            AND E.PID=SC.PID(+)
            AND E.SUBID=SC.SUBID(+) --ORDER BY ST.SID
    ) A
    WHERE P.PID=A.PID(+) AND A.SUBID=SU.SUBID(+)
    GROUP BY P.PID, P.PNAME, SU.SNAME, A.ENAME
    ORDER BY P.PID ASC;



    --한번에 확인하기
    SELECT *
    FROM 
    (
        --미응시자 미포함
        SELECT P.PID, P.PNAME, SU.SNAME, E.ENAME, ROUND(AVG(SC.SCORE),2) AS AVERAGE
        FROM PROFESSORS P, STUDENTS ST, SCORES SC, EXAMS E, SUBJECTS SU
        WHERE P.PID=E.PID
            AND ST.SID=SC.SID
            AND E.PID=SC.PID
            AND E.SUBID=SC.SUBID
            AND SU.SUBID=SC.SUBID
        GROUP BY P.PID, P.PNAME, SU.SNAME, E.ENAME
        ORDER BY P.PID ASC
    ) X, 
    (
        --미응시자 포함
        SELECT P.PID, P.PNAME, SU.SNAME, A.ENAME, ROUND(AVG(NVL(A.SCORE,0)),2) AS AVERAGE
        FROM PROFESSORS P, SUBJECTS SU,
        (
            -- A : 모든학생+모든시험+모든점수
            SELECT E.PID, E.SUBID, E.ENAME, ST.SID, ST.SNAME, SC.SCORE
            FROM STUDENTS ST, EXAMS E, SCORES SC
            WHERE ST.SID=SC.SID(+)
                AND E.PID=SC.PID(+)
                AND E.SUBID=SC.SUBID(+)
        ) A
        WHERE P.PID=A.PID(+) AND A.SUBID=SU.SUBID(+)
        GROUP BY P.PID, P.PNAME, SU.SNAME, A.ENAME
        ORDER BY P.PID ASC
    ) Y 
    WHERE X.PID(+)=Y.PID;


------------------------------

    --수업 풀이 + 순위메기기
    SELECT T3.PID, T3.PNAME, SUM(T1.SCORE) AS TOTAL, ROUND(AVG(T1.SCORE),1) AS AVERAGE,
        -- 컬럼을 만들 때는 다른 컬럼에 무관하게 만든다
        ROW_NUMBER() OVER(ORDER BY ROUND(AVG(T1.SCORE),1) DESC) AS RANK1,--정렬 + 순서대로 순위
        RANK() OVER(ORDER BY ROUND(AVG(T1.SCORE),1) DESC) AS RANK2,
        DENSE_RANK() OVER(ORDER BY ROUND(AVG(T1.SCORE),1) DESC) AS RANK3
    FROM SCORES T1, EXAMS T2, PROFESSORS T3
    WHERE T1.PID=T2.PID AND T1.SUBID=T2.SUBID AND T2.PID=T3.PID
    GROUP BY T3.PID, T3.PNAME
    ORDER BY T3.PID ASC;






----------------------
SELECT * FROM(
    SELECT T1.NAME, T1.SCORE, 
        ROW_NUMBER() OVER(ORDER BY T1.SCORE DESC) AS A,
        RANK() OVER(ORDER BY T1.SCORE DESC) AS B,
        DENSE_RANK() OVER(ORDER BY T1.SCORE DESC) AS C
    FROM
    (
        SELECT 'A' AS NAME, 70 AS SCORE FROM DUAL UNION ALL
        SELECT 'B' AS NAME, 80 AS SCORE FROM DUAL UNION ALL
        SELECT 'C' AS NAME, 80 AS SCORE FROM DUAL UNION ALL
        SELECT 'D' AS NAME, 80 AS SCORE FROM DUAL UNION ALL
        SELECT 'E' AS NAME, 90 AS SCORE FROM DUAL UNION ALL
        SELECT 'F' AS NAME, 90 AS SCORE FROM DUAL UNION ALL
        SELECT 'G' AS NAME, 100 AS SCORE FROM DUAL
    ) T1
)T2
WHERE T2.A=1;
---------------------------

--과목별 시험결과 평균의 순위
    --안친사람 제외
    SELECT SU.SNAME, E.ENAME, SUM(SC.SCORE) AS TOTAL, ROUND(AVG(SC.SCORE),2) AS AVERAGE,
        ROW_NUMBER() OVER(ORDER BY AVG(SC.SCORE) DESC) AS RN_RANK,
        RANK() OVER(ORDER BY AVG(SC.SCORE) DESC) AS GENERAL_RANK,
        DENSE_RANK() OVER(ORDER BY AVG(SC.SCORE) DESC) AS D_RANK
    FROM SCORES SC, EXAMS E, SUBJECTS SU
    WHERE SC.PID=E.PID 
        AND SC.SUBID=E.SUBID 
        AND SU.SUBID=SC.SUBID
    GROUP BY SU.SNAME, E.ENAME
    ORDER BY SU.SNAME ASC;
    
    --풀이
    SELECT T1.SUBID, T1.SNAME, SUM(T3.SCORE) AS TOTAL, ROUND(AVG(T3.SCORE),1) AS AVERAGE,
        RANK() OVER(ORDER BY ROUND(AVG(T3.SCORE),1) DESC) AS RNK
    FROM SUBJECTS T1, EXAMS T2, SCORES T3
    WHERE T1.SUBID=T2.SUBID
        AND T2.PID=T3.PID
        AND T2.SUBID=T3.SUBID
    GROUP BY T1.SUBID, T1.SNAME;
    
    
    
    
    
    --안친사람 0점처리
    SELECT  SU.SNAME, A.ENAME, SUM(NVL(A.SCORE,0)), ROUND(AVG(NVL(A.SCORE,0)),2) AS AVERAGE,
        ROW_NUMBER() OVER(ORDER BY AVG(NVL(A.SCORE,0)) DESC) AS RN_RANK,
        RANK() OVER(ORDER BY AVG(NVL(A.SCORE,0)) DESC) AS GENERAL_RANK,
        DENSE_RANK() OVER(ORDER BY AVG(NVL(A.SCORE,0)) DESC) AS D_RANK
    FROM SUBJECTS SU,
    (
        -- A : 모든학생+모든시험+모든점수
        SELECT E.PID, E.SUBID, E.ENAME, SC.SCORE
        FROM STUDENTS ST, EXAMS E, SCORES SC
        WHERE ST.SID=SC.SID(+)
            AND E.PID=SC.PID(+)
            AND E.SUBID=SC.SUBID(+)
    ) A
    WHERE A.SUBID=SU.SUBID(+)
    GROUP BY SU.SNAME, A.ENAME
    ORDER BY SU.SNAME ASC;


    --풀이
    SELECT A.SUBID, A.SUBJNAME, SUM(B.SCORE) AS TOTAL, ROUND(AVG(NVL(B.SCORE,0)),1) AS AVERAGE,
        RANK() OVER(ORDER BY AVG(NVL(B.SCORE,0)) DESC) AS RANKING
    FROM (
        --10명의 학생이 6과목 시험 : 총 60개의 데이터, 시험점수는 57개뿐
        SELECT T1.SID, T1.SNAME, T2.SUBID, T2.SNAME AS SUBJNAME 
        FROM STUDENTS T1, SUBJECTS T2 -- CROSS JOIN
    ) A, (SCORES) B
    WHERE A.SID=B.SID(+) AND A.SUBID=B.SUBID(+)
    GROUP BY A.SUBID, A.SUBJNAME
    ORDER BY A.SUBID ASC;






    --각 시도별 점수 순위(안친사람 0점)
    SELECT C.CODEID, C.CODENAME, ROUND(AVG(NVL(A.SCORE,0)),2) AS AVERAGE,
        ROW_NUMBER() OVER(ORDER BY AVG(NVL(A.SCORE,0)) DESC) AS RN_RANK,
        RANK() OVER(ORDER BY AVG(NVL(A.SCORE,0)) DESC) AS GENERAL_RANK,
        DENSE_RANK() OVER(ORDER BY AVG(NVL(A.SCORE,0)) DESC) AS D_RANK
    FROM CIDO C, 
    (
        -- A : 모든학생+모든시험+모든점수
        SELECT E.PID, E.SUBID, E.ENAME, ST.SID, ST.SNAME, ST.SADDR, SC.SCORE
        FROM STUDENTS ST, EXAMS E, SCORES SC
        WHERE ST.SID=SC.SID(+)
            AND E.PID=SC.PID(+)
            AND E.SUBID=SC.SUBID(+)
    )A
    WHERE C.CODEID=A.SADDR(+)
    GROUP BY C.CODEID, C.CODENAME;
    

    --풀이
SELECT T1.CODENAME, NVL(T2.AVERAGE,0) AS A, T2.RANKING FROM CIDO T1,
(
    SELECT C.CODEID, C.CODENAME, SUM(NVL(B.SCORE,0)) AS TOTAL, ROUND(AVG(NVL(B.SCORE,0)),1) AS AVERAGE,
        RANK() OVER(ORDER BY AVG(NVL(B.SCORE,0)) DESC) AS RANKING
    FROM (
        --10명의 학생이 6과목 시험 : 총 60개의 데이터, 시험점수는 57개뿐
        SELECT T1.SID, T1.SNAME,T1.SADDR, T2.SUBID, T2.SNAME AS SUBJNAME 
        FROM STUDENTS T1, SUBJECTS T2 -- CROSS JOIN
    ) A, SCORES B, CIDO C
    WHERE A.SID=B.SID(+) AND A.SUBID=B.SUBID(+) AND A.SADDR(+)=C.CODEID
    GROUP BY C.CODEID, C.CODENAME
) T2
WHERE T1.CODEID=T2.CODEID(+)
ORDER BY T2.RANKING ASC;



--교수가 사는 지역 중 학생이 살고 있지 않은 지역은?
    --한글 데이터 오타 없음을 가정(서울 -> 시울 X)
    --데이터 수정 금지
    --JOIN은 1대 다의 관계에서만 걸기
    
    --교수 사는곳
    SELECT C.CODEID, C.CODENAME
    FROM PROFESSORS P, CIDO C
    WHERE P.PADDR=C.CODENAME(+)
    GROUP BY C.CODEID, C.CODENAME;
    
    SELECT NVL(C.CODEID,'C014'), NVL(C.CODENAME,'경남')
    FROM PROFESSORS P, CIDO C 
    WHERE P.PADDR=C.CODENAME(+)
    GROUP BY NVL(C.CODEID,'C014'), NVL(C.CODENAME,'경남');
    
    --학생 사는곳
    SELECT C.CODEID, C.CODENAME
    FROM STUDENTS ST, CIDO C
    WHERE ST.SADDR=C.CODEID
    GROUP BY C.CODEID, C.CODENAME;

    --교수가 사는 지역 중 학생이 살고 있지 않은 지역
SELECT T1.교수가사는곳
FROM(
    SELECT B.CODENAME AS 학생이사는곳, A.PADDR AS 교수가사는곳
    FROM 
    (
        SELECT C.CODEID, C.CODENAME, P.PADDR
        FROM PROFESSORS P, CIDO C
        WHERE P.PADDR=C.CODENAME(+)
        GROUP BY C.CODEID, C.CODENAME, P.PADDR
    ) A, 
    (
        SELECT C.CODEID, C.CODENAME
        FROM STUDENTS ST, CIDO C
        WHERE ST.SADDR=C.CODEID(+)
        GROUP BY C.CODEID, C.CODENAME
    ) B
    WHERE A.CODEID=B.CODEID(+)
    GROUP BY B.CODENAME, A.PADDR
) T1
WHERE T1.학생이사는곳 IS NULL;



--SELF JOIN : 자기 테이블과 자기 테이블 JOIN















