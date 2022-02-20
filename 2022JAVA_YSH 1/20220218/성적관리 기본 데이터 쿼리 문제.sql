
--아래의 데이터를 분석하고
--학생들은 반드시 6과목 시험을 쳐야 한다.
--국어와 수학은 두개의 시험중 1개의 시험만 골라서 치면된다.
--시험을 치지 않은 과목은 0점 처리한다.

CREATE TABLE STUDENTS
(
    SID     CHAR(4)         NOT NULL  PRIMARY KEY,      -- 학생아이디
    SNAME   VARCHAR2(30)    NOT NULL,                   -- 학생이름
    STEL    VARCHAR2(20)    NOT NULL,                   -- 연락처
    SADDR   VARCHAR2(10)    NOT NULL,                   -- 주소(도시)
    SGENDER CHAR(1)         NOT NULL,                   -- 성별(M/F)
    SAGE     NUMBER(3)       NOT NULL                   -- 나이
);

    INSERT INTO STUDENTS VALUES('S001', '김돌우', '01077778888', '부산', 'M', 24);
    INSERT INTO STUDENTS VALUES('S002', '박영익', '01055556666', '울산', 'M', 27);
    INSERT INTO STUDENTS VALUES('S003', '도소욱', '01088887777', '부산', 'M', 28);
    INSERT INTO STUDENTS VALUES('S004', '정미주', '01055554444', '부산', 'F', 22);
    INSERT INTO STUDENTS VALUES('S005', '김기윤', '01077775555', '창원', 'M', 21);
    INSERT INTO STUDENTS VALUES('S006', '이효진', '01066669999', '창원', 'F', 25);
    INSERT INTO STUDENTS VALUES('S007', '강신욱', '01044447777', '부산', 'M', 23);
    INSERT INTO STUDENTS VALUES('S008', '박범식', '01099998888', '울산', 'M', 27);
    INSERT INTO STUDENTS VALUES('S009', '여인순', '01051477787', '부산', 'F', 31);
    INSERT INTO STUDENTS VALUES('S010', '최순애', '01078974444', '김해', 'F', 32);
    
    SELECT * FROM STUDENTS; --COMMIT
    
CREATE TABLE PROFESSORS
(
    PID     CHAR(4)         NOT NULL  PRIMARY KEY,      -- 교수ID
    PNAME   VARCHAR2(30)    NOT NULL,                   -- 교수명
    PTEL    VARCHAR2(20)    NOT NULL,                   -- 연락처
    PADDR   VARCHAR2(10)    NOT NULL,                   -- 주소(도시)
    PGENDER CHAR(1)         NOT NULL,                   -- 성별(M/F)
    BIRTH   VARCHAR2(8)     NOT NULL                    -- 생년월일
);
    
    INSERT INTO PROFESSORS VALUES('P001','최국일','01099996566','부산','M','19730804');
    INSERT INTO PROFESSORS VALUES('P002','경승수','01077148888','부산','M','19710109');
    INSERT INTO PROFESSORS VALUES('P003','박수연','01055414444','부산','F','19780214');
    INSERT INTO PROFESSORS VALUES('P004','김경순','01024147784','울산','F','19801222');
    INSERT INTO PROFESSORS VALUES('P005','박수걸','01074145887','울산','M','19770505');
    INSERT INTO PROFESSORS VALUES('P006','도인중','01021444444','창원','M','19781128');
    INSERT INTO PROFESSORS VALUES('P007','이수영','01057414414','김해','F','19800107');
    INSERT INTO PROFESSORS VALUES('P008','이국중','01092417984','창원','M','19730309');
    INSERT INTO PROFESSORS VALUES('P009','박도우','01092417984','김해','M','19801009');
    INSERT INTO PROFESSORS VALUES('P010','이연수','01092417984','부산','F','19820509');
    
    SELECT * FROM PROFESSORS;
    
CREATE TABLE SUBJECTS 
(
    SUBID     CHAR(4)         NOT NULL PRIMARY KEY,     --과목ID
    SNAME   VARCHAR2(30)    NOT NULL,                   --과목명
    GRADE   NUMBER(3)       NOT NULL                    --학점
);

    INSERT INTO SUBJECTS VALUES('S001','국어',3);
    INSERT INTO SUBJECTS VALUES('S002','수학',3);
    INSERT INTO SUBJECTS VALUES('S003','영어',3);
    INSERT INTO SUBJECTS VALUES('S004','과학',2);
    INSERT INTO SUBJECTS VALUES('S005','사회',2);
    INSERT INTO SUBJECTS VALUES('S006','음악',1);
    
    SELECT * FROM SUBJECTS;
    
CREATE TABLE EXAMS
(
    IDX        INTEGER          NOT NULL    PRIMARY KEY,    -- INDEX (혹은 PID+SUBID 복합키)
    PID        CHAR(4)          NOT NULL,                   -- 출제교수ID
    SUBID      CHAR(4)          NOT NULL,                   -- 과목ID
    ENAME      VARCHAR2(30)     NOT NULL                    -- 시험명
);

    INSERT INTO EXAMS VALUES(1, 'P001','S001','국어1 시험');
    INSERT INTO EXAMS VALUES(2, 'P002','S001','국어2 시험');
    INSERT INTO EXAMS VALUES(3, 'P003','S002','수학1 시험');
    INSERT INTO EXAMS VALUES(4, 'P004','S002','수학2 시험');
    INSERT INTO EXAMS VALUES(5, 'P005','S003','영어 시험');
    INSERT INTO EXAMS VALUES(6, 'P006','S004','과학 시험');
    INSERT INTO EXAMS VALUES(7, 'P007','S005','사회 시험');
    INSERT INTO EXAMS VALUES(8, 'P008','S006','음악 시험');
    
    SELECT * FROM EXAMS;
    
CREATE TABLE SCORES -- 시험결과
(
    SID         CHAR(4)             NOT NULL,   -- 학생ID
    PID         CHAR(4)             NOT NULL,   -- 출제교수ID
    SUBID       CHAR(4)             NOT NULL,   -- 과목ID
    SCIDX       NUMBER(5)           NOT NULL,   -- 학기
    SCORE       NUMBER(5,2)         NOT NULL    -- 점수
);

    --김돌우
    INSERT INTO SCORES VALUES('S001', 'P001', 'S001', 1, 91.12);
    INSERT INTO SCORES VALUES('S001', 'P003', 'S002', 1, 78.67);                             
    INSERT INTO SCORES VALUES('S001', 'P005', 'S003', 1, 86.45);
    INSERT INTO SCORES VALUES('S001', 'P006', 'S004', 1, 80.67);
    INSERT INTO SCORES VALUES('S001', 'P007', 'S005', 1, 90);
    INSERT INTO SCORES VALUES('S001', 'P008', 'S006', 1, 77);
    
    --박영익
    INSERT INTO SCORES VALUES('S002', 'P002', 'S001', 1, 69);
    INSERT INTO SCORES VALUES('S002', 'P003', 'S002', 1, 98);                             
    INSERT INTO SCORES VALUES('S002', 'P005', 'S003', 1, 56);
    INSERT INTO SCORES VALUES('S002', 'P006', 'S004', 1, 78);
    INSERT INTO SCORES VALUES('S002', 'P007', 'S005', 1, 87.90);
    INSERT INTO SCORES VALUES('S002', 'P008', 'S006', 1, 76.20);
    
    --도소욱
    INSERT INTO SCORES VALUES('S003', 'P002', 'S001', 1, 65.44);
    INSERT INTO SCORES VALUES('S003', 'P003', 'S002', 1, 78.09);                             
    INSERT INTO SCORES VALUES('S003', 'P006', 'S004', 1, 88);
    INSERT INTO SCORES VALUES('S003', 'P007', 'S005', 1, 56);
    INSERT INTO SCORES VALUES('S003', 'P008', 'S006', 1, 78);

    --정미주
    INSERT INTO SCORES VALUES('S004', 'P002', 'S001', 1, 90);
    INSERT INTO SCORES VALUES('S004', 'P004', 'S002', 1, 77);                             
    INSERT INTO SCORES VALUES('S004', 'P005', 'S003', 1, 90);
    INSERT INTO SCORES VALUES('S004', 'P006', 'S004', 1, 94);
    INSERT INTO SCORES VALUES('S004', 'P007', 'S005', 1, 76.44);
    INSERT INTO SCORES VALUES('S004', 'P008', 'S006', 1, 87.45);
    
    --김기윤
    INSERT INTO SCORES VALUES('S005', 'P001', 'S001', 1, 77.45);
    INSERT INTO SCORES VALUES('S005', 'P004', 'S002', 1, 99);                             
    INSERT INTO SCORES VALUES('S005', 'P005', 'S003', 1, 87);
    INSERT INTO SCORES VALUES('S005', 'P006', 'S004', 1, 78);
    

    --이효진
    INSERT INTO SCORES VALUES('S006', 'P001', 'S001', 1, 77);
    INSERT INTO SCORES VALUES('S006', 'P004', 'S002', 1, 65);                             
    INSERT INTO SCORES VALUES('S006', 'P005', 'S003', 1, 54);
    INSERT INTO SCORES VALUES('S006', 'P006', 'S004', 1, 77.44);
    INSERT INTO SCORES VALUES('S006', 'P007', 'S005', 1, 80.87);
    INSERT INTO SCORES VALUES('S006', 'P008', 'S006', 1, 98);
    
    
    --강신욱
    INSERT INTO SCORES VALUES('S007', 'P002', 'S001', 1, 90);
    INSERT INTO SCORES VALUES('S007', 'P004', 'S002', 1, 88.67);                             
    INSERT INTO SCORES VALUES('S007', 'P005', 'S003', 1, 67.56);
    INSERT INTO SCORES VALUES('S007', 'P006', 'S004', 1, 90);
    INSERT INTO SCORES VALUES('S007', 'P007', 'S005', 1, 71.11);
    INSERT INTO SCORES VALUES('S007', 'P008', 'S006', 1, 87.45);
    
    --박범식
    INSERT INTO SCORES VALUES('S008', 'P001', 'S001', 1, 65);
    INSERT INTO SCORES VALUES('S008', 'P004', 'S002', 1, 56.67);                             
    INSERT INTO SCORES VALUES('S008', 'P005', 'S003', 1, 77);
    INSERT INTO SCORES VALUES('S008', 'P006', 'S004', 1, 82);
    INSERT INTO SCORES VALUES('S008', 'P007', 'S005', 1, 83.09);
    INSERT INTO SCORES VALUES('S008', 'P008', 'S006', 1, 93);
    
    --여인순
    INSERT INTO SCORES VALUES('S009', 'P001', 'S001', 1, 56);
    INSERT INTO SCORES VALUES('S009', 'P004', 'S002', 1, 97);                             
    INSERT INTO SCORES VALUES('S009', 'P005', 'S003', 1, 57);
    INSERT INTO SCORES VALUES('S009', 'P006', 'S004', 1, 90);
    INSERT INTO SCORES VALUES('S009', 'P007', 'S005', 1, 76);
    INSERT INTO SCORES VALUES('S009', 'P008', 'S006', 1, 84);
    
    --최순애
    INSERT INTO SCORES VALUES('S010', 'P001', 'S001', 1, 78);
    INSERT INTO SCORES VALUES('S010', 'P003', 'S002', 1, 89);                             
    INSERT INTO SCORES VALUES('S010', 'P006', 'S004', 1, 78.56);
    INSERT INTO SCORES VALUES('S010', 'P007', 'S005', 1, 80.88);
    INSERT INTO SCORES VALUES('S010', 'P008', 'S006', 1, 98);
    


    SELECT * FROM SCORES; -- COMMIT

    
    
    
    --홀수번은 수업때, 짝수번은 숙제
    
    --1. 각 교수별 시험출제 현황 리스트를 보여주세요
    --(교수이름, 과목명, 시험명)
        SELECT * FROM EXAMS;
        SELECT * FROM PROFESSORS;
        SELECT * FROM SUBJECTS;
        
        SELECT P.PNAME, S.SNAME, E.ENAME
        FROM EXAMS E, PROFESSORS P, SUBJECTS S
        WHERE E.SUBID=S.SUBID AND E.PID=P.PID
        ORDER BY S.SNAME ASC;
        
    
    --2. 지역별 학생수 리스트를 보여주세요
        SELECT SADDR, COUNT(*) AS 학생수
        FROM STUDENTS
        GROUP BY SADDR
        ORDER BY COUNT(*) DESC;
    
    --3. 지역별 교수숫자 리스트를 보여주세요
        SELECT PADDR, COUNT(*) AS 교수숫자
        FROM PROFESSORS
        GROUP BY PADDR
        ORDER BY COUNT(*) DESC;
    
    --4  국어시험 1을 국어시험으로 치른 학생 리스트를 보여주세요
        SELECT ST.SNAME, EX.ENAME, EX.SUBID, SC.SCORE
        FROM STUDENTS ST, EXAMS EX, SCORES SC
        WHERE ST.SID=SC.SID AND EX.SUBID=SC.SUBID
            AND ENAME='국어1 시험';
    
    --5. 부산에 사는 학생들의 영어시험 평균과 총점을 리스트로 보여주세요
-- 시험을 6번 봐야 하는데 5번만 본 경우
-- 다른 과목 시험은 봤는데 영어시험만 안 본 경우는?
-- 우리가 배운 OUTER JOIN은 시험을 아예 안 본 경우만 찾을 수 있음
-- 가상의 TABLE을 만들어 다시 JOIN 필요(INLINE VIEW 사용)
        SELECT ST.SNAME, AVG(SC.SCORE) AS 평균, SUM(SC.SCORE) AS 총점
        FROM STUDENTS ST, SCORES SC, SUBJECTS SU
        WHERE ST.SID=SC.SID AND SC.SUBID=SU.SUBID
            AND ST.SADDR='부산'
            AND SU.SNAME='영어'
            AND SC.SCORE!=0
        GROUP BY ST.SNAME;
    
    --6. 남자 교수님들이 출제한 시험의 총점과 평균을 구해주세요
-- 시험 결과가 있는 것들
-- SUBID는 같아도 ENAME이 다른 경우가 있지만 지금은 고려할 수가 없다.........
        SELECT E.ENAME, P.PNAME, P.PGENDER, SUM(S.SCORE) AS 총점, ROUND(AVG(S.SCORE),2) AS 평균
        FROM PROFESSORS P, EXAMS E, SCORES S
        WHERE P.PID=E.PID(+) AND E.SUBID=S.SUBID(+)
            AND P.PGENDER='M'
        GROUP BY E.ENAME, P.PNAME, P.PGENDER;
    
    --7. 각 학생별로 시험을 치룬 과목수를 리스트로 보여주세요
        SELECT ST.SNAME, E.ENAME, COUNT(*) AS 시험친과목수
        FROM STUDENTS ST, SCORES SC, EXAMS E
        WHERE ST.SID=SC.SID AND SC.SUBID=E.SUBID
        GROUP BY ST.SNAME, E.ENAME
        ORDER BY E.ENAME ASC;
    
    --8. 1980년대생 교수들이 출제한 과목을 리스트로 보여주세요
        SELECT P.BIRTH, P.PNAME, S.SNAME
        FROM PROFESSORS P, EXAMS E, SUBJECTS S
        WHERE P.PID=E.PID(+) AND E.SUBID=S.SUBID(+)
            AND P.BIRTH>='198%';
    
    --9. 시험출제를 하지 않은 교수를 보여주세요
        SELECT E.ENAME, P.PNAME, SUM(S.SCORE) AS 총점, ROUND(AVG(S.SCORE),2) AS 평균
        FROM PROFESSORS P, EXAMS E, SCORES S
        WHERE P.PID=E.PID(+) AND E.SUBID=S.SUBID(+) AND E.ENAME IS NULL
        GROUP BY E.ENAME, P.PNAME;
    
    --10. 여자교수님들이 출제한 시험의 총점과 평균을 구해주세요
        SELECT P.PNAME, SUM(S.SCORE) AS 총점, ROUND(AVG(S.SCORE),2) AS 평균
        FROM PROFESSORS P, SCORES S, EXAMS E
        WHERE P.PID=S.PID 
            AND P.PGENDER='F'
        GROUP BY P.PNAME
        ORDER BY P.PNAME ASC;
    
    --11. 20대 여학생이 치른 시험의 총점과 평균을 구해주세요
    --시험 치지 않은 사람은 0점
    -- 괄호 안에 INLINE QUERY => 결과는 반드시 단일 값
        SELECT ST.SNAME, ST.SAGE, ST.SGENDER, SUM(SC.SCORE) AS 총점, ROUND(AVG(SC.SCORE),2) AS 평균, ROUND(SUM(SC.SCORE)/(SELECT COUNT(*) FROM SUBJECTS),2) AS 안본거0점포함시
        FROM STUDENTS ST, SCORES SC
        WHERE ST.SID=SC.SID
            AND ST.SAGE>=20
            AND ST.SAGE<30
            AND ST.SGENDER='F'
        GROUP BY ST.SNAME, ST.SAGE, ST.SGENDER
        ORDER BY ST.SNAME ASC;
    
    --12. 각 지역별로 학생들의 총점과 평균을 구해주세요
        SELECT ST.SADDR, SUM(SC.SCORE) AS 총점, ROUND(AVG(SC.SCORE),2) AS 평균
        FROM STUDENTS ST, SCORES SC
        WHERE ST.SID=SC.SID
        GROUP BY ST.SADDR
        ORDER BY ST.SADDR ASC;
    
    --13. 각 과목(시험아님)별로 평균점수를 구해주세요 ---------------------수정필요
        SELECT SUBID, ROUND(AVG(SCORE),2)
        FROM SCORES
        GROUP BY SUBID;
        
        SELECT A.SUBID, A.과목명, AVG(NVL(B.SCORE,0))
        FROM(
            SELECT ST.SID, ST.SNAME, SU.SUBID, SU.SNAME AS 과목명
            FROM STUDENTS ST, SUBJECTS SU
        ) A, SCORES B
        WHERE  A.SID=B.SID(+) AND A.SUBID=B.SUBID(+)
        GROUP BY A.SID, A.SNAME, A.SUBID, A.과목명
        ORDER BY A.SID;
    
    --14. 모든학생들의 총점과 평균 점수를 보여주세요

        SELECT A.SID, A.SNAME, SUM(B.SCORE), ROUND(AVG(NVL(B.SCORE,0)),2) 
        FROM(
            SELECT ST.SID, ST.SNAME, SU.SUBID, SU.SNAME AS 과목명 
            FROM STUDENTS ST, SUBJECTS SU
        ) A, SCORES B
        WHERE A.SID=B.SID(+) AND A.SUBID=B.SUBID(+)
        GROUP BY A.SID, A.SNAME
        ORDER BY A.SID;
    
    --15. 각 교수별로 출제한 시험의 평균 점수를 보여주세요
        -- 교수가 다른 과목을 더 출제할 때도 영향이 없도록 작성
        SELECT P.PNAME, ROUND(AVG(SC.SCORE),2) AS 평균
        FROM PROFESSORS P, EXAMS E, SCORES SC
        WHERE P.PID=E.PID AND P.PID=SC.PID AND E.SUBID=SC.SUBID
        GROUP BY P.PNAME
        ORDER BY 평균 DESC;
    
    --16. 시험별로 시험을 치르지 않은 학생 리스트를 보여주세요
        --이것도 5번처럼
-- 시험을 6번 봐야 하는데 5번만 본 경우
-- 다른 과목 시험은 봤는데 영어시험만 안 본 경우는?
-- 우리가 배운 OUTER JOIN은 시험을 아예 안 본 경우만 찾을 수 있음

        
        --시험안본사람까지 포함(0점)한 총점&평균
        SELECT A.SID, A.SNAME, B.SUBID, B.SCORE
        FROM(
            -- 모든 학생이 시험 본것을 가정한 가상의 테이블
            SELECT ST.SID, ST.SNAME, SU.SUBID, SU.SNAME AS 과목명 
            FROM STUDENTS ST, SUBJECTS SU 
        ) A, SCORES B
        WHERE A.SID=B.SID(+) AND A.SUBID=B.SUBID(+)
        ORDER BY A.SID;
        /*백업용
        --16. 시험별로 시험을 치르지 않은 학생 리스트를 보여주세요
    -- 학생 S001이 EXAMS의 모든 PID+SUBID에 대응하는 SCORE를 가지고 있는가?
    -- PID(NULL), SUBID(NULL), ENAME, SID, SNAME
    
    SELECT E.ENAME, ST.SID, ST.SNAME 
    FROM STUDENTS ST, EXAMS E, SCORES SC
    WHERE ST.SID=SC.SID(+) AND E.PID=SC.PID(+) AND E.SUBID=SC.SUBID(+)
        AND SC.SCORE IS NULL
    ORDER BY E.ENAME ASC, ST.SID ASC;
    */
    
    --17. 평균점수가 가장 높은 시험의 가장 높은 점수를 받은 학생을 찾아주세요
        --1. 시험별 평균점수 : 음악이 가장 높음
        SELECT E.ENAME, ROUND(AVG(SC.SCORE),2) AS 평균
        FROM EXAMS E, SCORES SC
        WHERE E.SUBID=SC.SUBID
        GROUP BY E.ENAME
        ORDER BY 평균 DESC;
        
        --2. 음악시험의 점수 : 이효진, 최순애가 가장 높음
        SELECT ST.SNAME, E.ENAME, SC.SCORE
        FROM STUDENTS ST, EXAMS E, SCORES SC
        WHERE ST.SID=SC.SID AND E.PID=SC.PID
            AND E.ENAME='음악 시험'
        ORDER BY SC.SCORE DESC;
    
    --18. 평균점수가 가장 낮은 시험의 가장낮은 점수를 받은 학생을 찾아주세요
        --1. 시험별 평균점수 : 영어가 가장 낮음
        SELECT E.ENAME, ROUND(AVG(SC.SCORE),2) AS 평균
        FROM EXAMS E, SCORES SC
        WHERE E.SUBID=SC.SUBID
        GROUP BY E.ENAME
        ORDER BY 평균 ASC;
        
        --2. 영어시험의 점수 : 이효진이 가장 낮음
        SELECT ST.SNAME, E.ENAME, SC.SCORE
        FROM STUDENTS ST, EXAMS E, SCORES SC
        WHERE ST.SID=SC.SID AND E.PID=SC.PID
            AND E.ENAME='영어 시험'
        ORDER BY SC.SCORE ASC;
    
    --19. 60점미만이면 재시험이라고 하면 재시험을 쳐야 하는 시험과 학생수를 보여주세요
        --미응시 제외
        SELECT E.ENAME, COUNT(*)
        FROM STUDENTS ST, EXAMS E, SCORES SC
        WHERE ST.SID=SC.SID AND E.PID=SC.PID
            AND SC.SCORE<60
        GROUP BY E.ENAME;
    
    --20. 가장 평균이 높은 시험을 출제한 교수가 사는 지역에 살고 있는 학생리스트를 보여주세요
        --1. 가장 평균이 높은 시험을 출제한 교수 : 이국중
        SELECT P.PNAME, SC.SUBID, AVG(SC.SCORE)
        FROM PROFESSORS P, SCORES SC
        WHERE P.PID=SC.PID
        GROUP BY P.PNAME, SC.SUBID
        ORDER BY AVG(SC.SCORE) DESC;
    
        --2. 이국중 교수가 사는 지역에 사는 학생들
        SELECT ST.SNAME, ST.SADDR, P.PNAME, P.PADDR
        FROM STUDENTS ST, PROFESSORS P
        WHERE ST.SADDR=P.PADDR
            AND P.PNAME='이국중';
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    