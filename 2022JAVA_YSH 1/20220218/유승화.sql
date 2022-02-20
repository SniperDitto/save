

--2. 지역별 학생수 리스트를 보여주세요
    SELECT SADDR, COUNT(*) AS 학생수
    FROM STUDENTS
    GROUP BY SADDR;


--4  국어시험 1을 국어시험으로 치른 학생 리스트를 보여주세요
    SELECT ENAME, SNAME
    FROM EXAMS E, STUDENTS ST, SCORES SC
    WHERE ST.SID=SC.SID AND E.PID=SC.PID AND E.SUBID=SC.SUBID
        AND ENAME='국어1 시험';

--6. 남자 교수님들이 출제한 시험의 총점과 평균을 구해주세요
--미응시자제외
    SELECT P.PGENDER, P.PNAME, E.ENAME, SUM(SC.SCORE) AS SUM, ROUND(AVG(SC.SCORE),2) AS AVG
    FROM PROFESSORS P, EXAMS E, SCORES SC
    WHERE P.PID=SC.PID AND E.PID=SC.PID AND E.SUBID=SC.SUBID
        AND P.PGENDER='M'
    GROUP BY P.PGENDER, P.PNAME, E.ENAME;
    
    -- 미응시자까지 포함하면..?
    
 
--8. 1980년대생 교수들이 출제한 과목을 리스트로 보여주세요
    SELECT P.BIRTH, P.PNAME, NVL(E.ENAME,'출제안함') AS 출제한과목
    FROM PROFESSORS P, EXAMS E
    WHERE P.PID=E.PID(+)
        AND P.BIRTH LIKE('198%');

--10. 여자교수님들이 출제한 시험의 총점과 평균을 구해주세요
--미응시자제외
    SELECT P.PGENDER,P.PNAME, E.ENAME, SUM(SC.SCORE) AS SUM, ROUND(AVG(SC.SCORE),2) AS AVG
    FROM PROFESSORS P, EXAMS E, SCORES SC
    WHERE P.PID=SC.PID AND E.PID=SC.PID AND E.SUBID=SC.SUBID
        AND P.PGENDER='F'
    GROUP BY P.PGENDER,P.PNAME, E.ENAME;

--12. 각 지역별로 학생들의 총점과 평균을 구해주세요
--미응시자제외
    SELECT ST.SADDR, SUM(SC.SCORE) AS SUM, ROUND(AVG(SC.SCORE),2) AS AVG
    FROM STUDENTS ST, SCORES SC
    WHERE ST.SID=SC.SID
    GROUP BY ST.SADDR;
    
    SELECT ST.SADDR, SUM(SC.SCORE) AS SUM, ROUND(AVG(NVL(SC.SCORE,0)),2) AS AVG
    FROM STUDENTS ST, SCORES SC, EXAMS E
    WHERE ST.SID=SC.SID(+) AND E.PID=SC.PID(+) AND E.SUBID=SC.SUBID(+)
    GROUP BY ST.SADDR
    ORDER BY ST.SADDR;

--14. 모든학생들의 총점과 평균 점수를 보여주세요
--수업시간에한것
    SELECT A.SID, A.SNAME, SUM(B.SCORE), ROUND(AVG(NVL(B.SCORE,0)),2) 
    FROM(
        -- 모든 학생&시험 목록(가상의 테이블)
            SELECT ST.SID, ST.SNAME, SU.SUBID, SU.SNAME AS 과목명 
            FROM STUDENTS ST, SUBJECTS SU 
        ) A, SCORES B
    WHERE A.SID=B.SID(+) AND A.SUBID=B.SUBID(+)
    GROUP BY A.SID, A.SNAME
    ORDER BY A.SID;
    
    --시험 본 것만 평균냈을 때
    SELECT ST.SNAME, SUM(SC.SCORE), ROUND(AVG(SC.SCORE),2)
    FROM STUDENTS ST, SCORES SC
    WHERE ST.SID=SC.SID
    GROUP BY ST.SID, ST.SNAME
    ORDER BY ST.SID, ST.SNAME;
    
    --안 본 과목 0점으로 가정했을 때
    SELECT ST.SNAME, SUM(SC.SCORE), ROUND(AVG(NVL(SC.SCORE,0)),2)
    FROM STUDENTS ST, SCORES SC, EXAMS E
    WHERE ST.SID=SC.SID(+) AND E.PID=SC.PID(+) AND E.SUBID=SC.SUBID(+)
    GROUP BY ST.SNAME
    ORDER BY ST.SNAME;

--16. 시험별로 시험을 치르지 않은 학생 리스트를 보여주세요
    -- 학생 S001이 EXAMS의 모든 PID+SUBID에 대응하는 SCORE를 가지고 있는가?
    -- PID(NULL), SUBID(NULL), ENAME, SID, SNAME
    
    -- 국어1, 2 따로 생각했을 때
    SELECT E.ENAME, ST.SID, ST.SNAME 
    FROM STUDENTS ST, EXAMS E, SCORES SC
    WHERE ST.SID=SC.SID(+) AND E.PID=SC.PID(+) AND E.SUBID=SC.SUBID(+)
        AND SC.SCORE IS NULL
    ORDER BY E.ENAME ASC, ST.SID ASC;
    
    -- 국어1, 국어2를 같은 국어과목으로 생각했을 때(둘 중 하나만 응시해도 됨)
    SELECT E.ENAME, ST.SID, ST.SNAME 
    FROM STUDENTS ST, EXAMS E, SCORES SC
    WHERE ST.SID=SC.SID(+) AND E.SUBID=SC.SUBID(+)
        AND SC.SCORE IS NULL
    ORDER BY E.ENAME ASC, ST.SID ASC;


--18. 평균점수가 가장 낮은 시험의 가장 낮은 점수를 받은 학생을 찾아주세요
    --시험 응시자만 포함
    -- EXAMS + SCORE로 평균점수가 가장 낮은 과목 구하기
    -- 위의 테이블과 학생 테이블을 이용해 가장 낮은 점수를 받은 학생 구하기
    
    -- 평균이 최소인 시험의 평균
    SELECT MIN(AVG(SC.SCORE)) AS MINAVG
    FROM EXAMS E, SCORES SC
    WHERE E.SUBID=SC.SUBID AND E.PID=SC.PID
    GROUP BY E.PID, E.SUBID;
    
    -- 위의 평균을 이용해 구한 시험명
    SELECT E.ENAME, AVG(SC.SCORE)
    FROM EXAMS E, SCORES SC
    WHERE E.SUBID=SC.SUBID AND E.PID=SC.PID
    GROUP BY E.ENAME
    HAVING AVG(SC.SCORE)=(SELECT MIN(AVG(SC.SCORE)) AS MINAVG
        FROM EXAMS E, SCORES SC
        WHERE E.SUBID=SC.SUBID AND E.PID=SC.PID
        GROUP BY E.PID, E.SUBID
        );
        
    --위의 테이블을 이용해 구한 해당 시험의 최저점
    SELECT MIN(SC.SCORE)
    FROM EXAMS E, SCORES SC, (
        SELECT E.ENAME, AVG(SC.SCORE)
        FROM EXAMS E, SCORES SC
        WHERE E.SUBID=SC.SUBID AND E.PID=SC.PID
        GROUP BY E.ENAME
        HAVING AVG(SC.SCORE)=(SELECT MIN(AVG(SC.SCORE)) AS MINAVG
            FROM EXAMS E, SCORES SC
            WHERE E.SUBID=SC.SUBID AND E.PID=SC.PID
            GROUP BY E.PID, E.SUBID
        )
    ) A
    WHERE E.PID=SC.PID AND E.SUBID=SC.SUBID
        AND E.ENAME=A.ENAME;
    
    --그 최저점을 가진 학생의 이름&점수&시험명
    SELECT ST.SNAME, SC.SCORE, E.ENAME
    FROM STUDENTS ST, SCORES SC, EXAMS E
    WHERE ST.SID=SC.SID AND SC.SUBID=E.SUBID AND SC.PID=E.PID
        AND SC.SCORE=(
            SELECT MIN(SC.SCORE)
            FROM EXAMS E, SCORES SC, (
                SELECT E.ENAME, AVG(SC.SCORE)
                FROM EXAMS E, SCORES SC
                WHERE E.SUBID=SC.SUBID AND E.PID=SC.PID
                GROUP BY E.ENAME
                HAVING AVG(SC.SCORE)=(SELECT MIN(AVG(SC.SCORE)) AS MINAVG
                    FROM EXAMS E, SCORES SC
                    WHERE E.SUBID=SC.SUBID AND E.PID=SC.PID
                    GROUP BY E.PID, E.SUBID
                )
            ) A
        WHERE E.PID=SC.PID AND E.SUBID=SC.SUBID
            AND E.ENAME=A.ENAME
        );
    --이게 맞나 너무 복잡한데
    
    
    --임시 풀이
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
    

--20. 가장 평균이 높은 시험을 출제한 교수가 사는 지역에 살고 있는 학생리스트를 보여주세요
   -- SELECT E.ENAME, SC.SCORE, P.PNAME, P.PADDR AS 교수주소, ST.SNAME, ST.SADDR AS 학생주소
   -- FROM EXAMS E, SCORES SC, PROFESSORS P, STUDENTS ST
   -- WHERE E.PID=SC.PID AND E.SUBID=SC.SUBID AND SC.PID=P.PID AND SC.SID=ST.SID
   --     AND (ENAME, SCORE) IN (SELECT ENAME, MIN(AVG(SCORE)) FROM SCORES GROUP BY ENAME)
    --    AND (PADDR, PNAM;


    --임시 풀이
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


