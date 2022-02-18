
--집계함수

--MAX()
--MIN()

SELECT * FROM SCORES;
--과목 상관없이 최고/최저점수 확인
SELECT MAX(SCORE) FROM SCORES;
SELECT MIN(SCORE) FROM SCORES;

--1. 왜 MAX, MIN은 집계함수인가?
-- 선택한 조건 하에서 집계
SELECT * FROM SCORES WHERE SID='S001' OR SID='S002';    -- OR : 합집합

--2. 학생별 최고&최저점수
SELECT SID, MAX(SCORE) AS 최고점, MIN(SCORE) AS 최저점
FROM SCORES
GROUP BY SID
ORDER BY SID ASC;

--3. 정렬 방식으로서의 MAX, MIN
-- 제일 늦게/빨리 태어난 교수 생년월일
SELECT MAX(BIRTH), MIN(BIRTH) FROM PROFESSORS;

-- 생일 늦은 교수 ~ 빠른 교수
SELECT * FROM PROFESSORS
ORDER BY BIRTH DESC;

-- 생일 빠른 교수 ~ 늦은 교수
SELECT * FROM PROFESSORS
ORDER BY BIRTH ASC;


-- 정렬 방식으로 사용 시 주의할 점
--4. 문자열에 집계함수 사용할 때는 주의!

SELECT SID, SUM(SCORE), AVG(SCORE), MAX(SCORE) AS 최고점, MIN(SCORE) AS 최저점
FROM SCORES
WHERE SID='S001' OR SID='S002'
GROUP BY SID
ORDER BY SID ASC;

-- GROUP BY의 범위 때문에 보여주고 싶은 항목을 보여줄 수 없을 때
-- 집계함수를 사용해 해결할 수 있다
-- MAX(PID) 등 주의할 것


--------------------------
-- 시험안친사람은 0점처리
-- 부산에 사는 학생들의 시험결과 리스트(안친사람 포함)
SELECT *--ST.SID, ST.SNAME, SUM(SC.SCORE) AS 총점, AVG(SC.SCORE) AS 평균
FROM SCORES SC, STUDENTS ST
WHERE SC.SID=ST.SID(+)
    AND ST.SADDR='부산'
    OR SC.SCORE=NULL;
--GROUP BY ST.SID, ST.SNAME;


--1. 부산에 사는 학생이 몇명인지 확인
SELECT COUNT(*) AS 부산사는학생수
FROM STUDENTS
WHERE SADDR='부산';

--2. 부산에 사는 학생이 시험을 모두 쳤는지 확인
SELECT SUBID, COUNT(*) AS 부산의_시험친학생수
FROM STUDENTS ST, SCORES SC 
WHERE ST.SID=SC.SID
    AND ST.SADDR='부산'
GROUP BY SUBID;

-- 영어시험을 친 학생 수
SELECT COUNT(*) AS 영어시험친학생수
FROM STUDENTS ST, SCORES SC
WHERE ST.SID=SC.SID(+)
    AND SC.PID='P005'
    AND SUBID='S003';

-- 부산의 영어시험친학생수
SELECT *--COUNT(*) AS 부산의_영어시험친학생수
FROM STUDENTS ST, SCORES SC
WHERE ST.SID=SC.SID
    AND SC.PID='P005'
    AND SC.SUBID='S003'
    AND ST.SADDR='부산';

-- 시험을 6번 봐야 하는데 5번만 본 경우
-- 우리가 배운 OUTER JOIN은 시험을 아예 안 본 경우만 찾을 수 있음
-- 시험을 1번 안 본 학생은???
-- 가상의 TABLE을 만들어 다시 JOIN 필요
-- INLINE VIEW 사용 : 메모리에만 존재하는 가상의 테이블

--모든 학생들의 총점과 평균
SELECT A.SID, A.SNAME, SUM(B.SCORE), ROUND(AVG(NVL(B.SCORE,0)),2) 
FROM(
    SELECT ST.SID, ST.SNAME, SU.SUBID, SU.SNAME AS 과목명 
    FROM STUDENTS ST, SUBJECTS SU -- 모든 학생이 시험 본것을 가정한 가상의 테이블
) A, SCORES B
WHERE A.SID=B.SID(+) AND A.SUBID=B.SUBID(+)
GROUP BY A.SID, A.SNAME
ORDER BY A.SID;


--NULL인 부분을 0점으로 생각하고 평균을 구할 때
--AVG는 NULL을 제외하고 계산하므로
--NVL(바꾸고싶은값,바꿀값)이용해서 0으로 만든다



--평균 점수가 가장 높은 시험
SELECT * FROM(
    SELECT E.PID, E.SUBID, E.ENAME, ROUND(AVG(SC.SCORE),2) AS 평균
    FROM EXAMS E, SCORES SC
    WHERE E.PID=SC.PID AND E.SUBID=SC.SUBID
        AND E.ENAME='음악 시험'
    GROUP BY E.PID, E.SUBID, E.ENAME
    ORDER BY 평균 DESC
) A, EXAMS B
WHERE A.PID=B.PID AND A.SUBID=B.SUBID
;



