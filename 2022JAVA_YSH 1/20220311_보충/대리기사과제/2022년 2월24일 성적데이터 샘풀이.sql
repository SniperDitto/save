SELECT * FROM GRPCOMMONS_TBL;

SELECT * FROM COMMONS_TBL;
SELECT * FROM STUDENTS_TBL;
SELECT * FROM SUBJECTS_TBL;
SELECT * FROM PROFESSORS_TBL;
SELECT * FROM STUDENTS_TIME_TBL;
SELECT * FROM SCORES_TBL;

SELECT * FROM STUDENTS_TIME_TBL
WHERE STU_ID = 'STU044'
;


--1. 학생리스트 출력
-- 학생아이디, 학생이름,  학생주소,  학생하과



--2. 교수리스트 출력
--교수아이디   교수이름   교수주소   소속학과


--3. 과목리스트
-- 등록년도   등록학기   해당학과   과목    학점


--4. 학 학과별 과목리스트
-- 학과아이디, 학과명,   해당과목아이디, 해당과목,  학점

--5. 학생별 신청과목 리스트
--학생아이디  학생이름  소속학과  신청과목아이디  신청과목  학점
--각 학생별 총신청 학점


--6. 교수별 강의 리스트
-- 교수아이디    교수명    소속학과    강의과목아이디    과목명


--7. 각 학과별 학생숫자
--학과명    학생수  
SELECT B.COM_ID, B.PARTNAME, COUNT(*) AS CNT 
FROM STUDENTS_TBL A, 
(
    SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
    FROM COMMONS_TBL T1, COMMONS_TBL T2
    WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
    AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
) B
WHERE A.STU_DEPT_GRP = B.GRP_ID AND A.STU_DEPT = B.COM_ID
GROUP BY B.COM_ID, B.PARTNAME
ORDER BY B.PARTNAME ASC
;


SELECT B.COM_ID, B.PARTNAME, COUNT(A.STU_ID)
FROM STUDENTS_TBL A, 
(
    SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
    FROM COMMONS_TBL T1, COMMONS_TBL T2
    WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
    AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
) B
WHERE A.STU_DEPT_GRP(+) = B.GRP_ID AND A.STU_DEPT(+) = B.COM_ID
GROUP BY B/COM_ID, B.PARTNAME
ORDER BY B.COM_ID ASC
;

--------------------------------------------------------------------

--SELECT * FROM PROFESSORS_TBL;
--8. 각 학과별 교수숫자
--학과명    교수수
SELECT B.COM_ID, B.PARTNAME, COUNT(A.PRO_ID)
FROM PROFESSORS_TBL A, 
(
    SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
    FROM COMMONS_TBL T1, COMMONS_TBL T2
    WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
    AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
) B
WHERE A.PRO_DEPT_GRP(+) = B.GRP_ID AND A.PRO_DEPT(+) = B.COM_ID
GROUP BY B.COM_ID, B.PARTNAME
ORDER BY B.COM_ID ASC
;



--9. 각 학과별 학생숫자 , 소속교수숫자
--학과명    학생수,   교수수

SELECT C.COM_ID, C.PARTNAME,  STUCNT, PROCNT
FROM
(
    SELECT B.COM_ID, B.PARTNAME, COUNT(A.STU_ID) AS STUCNT
    FROM STUDENTS_TBL A, 
    (
        SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
        FROM COMMONS_TBL T1, COMMONS_TBL T2
        WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
        AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
    ) B
    WHERE A.STU_DEPT_GRP(+) = B.GRP_ID AND A.STU_DEPT(+) = B.COM_ID
    GROUP BY COM_ID, PARTNAME
) C
,
(
SELECT B.COM_ID, B.PARTNAME, COUNT(A.PRO_ID) AS PROCNT
FROM PROFESSORS_TBL A, 
(
    SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
    FROM COMMONS_TBL T1, COMMONS_TBL T2
    WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
    AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
) B
WHERE A.PRO_DEPT_GRP(+) = B.GRP_ID AND A.PRO_DEPT(+) = B.COM_ID
GROUP BY B.COM_ID, B.PARTNAME
) D
WHERE C.COM_ID = D.COM_ID
;


--10. 각 지역별 학생숫자 , 소속교수숫자,
--지역명    학생수,   교수수


   --지역별 학생리스트
    SELECT B.STU_ADDR, B.COMVAL, A.STU_ID, A.STU_NAME
    FROM STUDENTS_TBL A, 
    (
        SELECT 
            T1.GRP_ID AS GRPID1, T1.COM_ID AS COMID1, T1.COM_VAL AS COMVAL1,
            T2.GRP_ID AS GRPID2, T2.COM_ID AS COMID2, T2.COM_VAL AS COMVAL2,
            T3.GRP_ID AS GRPID3, T3.COM_ID AS COMID3, T3.COM_VAL AS COMVAL3, 
            T4.GRP_ID AS GRPID4, T4.COM_ID AS COMID4, T4.COM_VAL AS COMVAL4,
            DECODE(T4.COM_ID, NULL, T3.COM_ID, T4.COM_ID) AS STU_ADDR,
            T1.COM_VAL || ' ' || T2.COM_VAL || ' ' || T3.COM_VAL || ' ' || T4.COM_VAL AS COMVAL
        FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
        WHERE T1.GRP_ID = T2.GRP_ID(+) AND T1.COM_ID = T2.PARENT_ID(+)
        AND T2.GRP_ID = T3.GRP_ID(+) AND T2.COM_ID = T3.PARENT_ID(+)
        AND T3.GRP_ID = T4.GRP_ID(+) AND T3.COM_ID = T4.PARENT_ID(+)
        AND T1.GRP_ID = 'GRP001' AND T1.COM_LVL = 1
    ) B
    WHERE B.GRPID1 = A.STU_ADDR_GRP(+)
    AND B.STU_ADDR = A.STU_ADDR(+)
    
    ;
    
    --지역별 학생수
    SELECT B.STU_ADDR, B.COMVAL,  COUNT(A.STU_ID) AS CNT
    FROM STUDENTS_TBL A, 
    (
        SELECT 
            T1.GRP_ID AS GRPID1, T1.COM_ID AS COMID1, T1.COM_VAL AS COMVAL1,
            T2.GRP_ID AS GRPID2, T2.COM_ID AS COMID2, T2.COM_VAL AS COMVAL2,
            T3.GRP_ID AS GRPID3, T3.COM_ID AS COMID3, T3.COM_VAL AS COMVAL3, 
            T4.GRP_ID AS GRPID4, T4.COM_ID AS COMID4, T4.COM_VAL AS COMVAL4,
            DECODE(T4.COM_ID, NULL, T3.COM_ID, T4.COM_ID) AS STU_ADDR,
            T1.COM_VAL || ' ' || T2.COM_VAL || ' ' || T3.COM_VAL || ' ' || T4.COM_VAL AS COMVAL
        FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
        WHERE T1.GRP_ID = T2.GRP_ID(+) AND T1.COM_ID = T2.PARENT_ID(+)
        AND T2.GRP_ID = T3.GRP_ID(+) AND T2.COM_ID = T3.PARENT_ID(+)
        AND T3.GRP_ID = T4.GRP_ID(+) AND T3.COM_ID = T4.PARENT_ID(+)
        AND T1.GRP_ID = 'GRP001' AND T1.COM_LVL = 1
    ) B
    WHERE B.GRPID1 = A.STU_ADDR_GRP(+)
    AND B.STU_ADDR = A.STU_ADDR(+)
    GROUP BY B.STU_ADDR, B.COMVAL
    ORDER BY B.STU_ADDR
    ;
    
    --지역별 교수리스트
    SELECT B.PRO_ADDR, B.COMVAL, A.PRO_ID, A.PRO_NAME 
    FROM PROFESSORS_TBL A, 
    (
        SELECT 
            T1.GRP_ID AS GRPID1, T1.COM_ID AS COMID1, T1.COM_VAL AS COMVAL1,
            T2.GRP_ID AS GRPID2, T2.COM_ID AS COMID2, T2.COM_VAL AS COMVAL2,
            T3.GRP_ID AS GRPID3, T3.COM_ID AS COMID3, T3.COM_VAL AS COMVAL3, 
            T4.GRP_ID AS GRPID4, T4.COM_ID AS COMID4, T4.COM_VAL AS COMVAL4,
            DECODE(T4.COM_ID, NULL, T3.COM_ID, T4.COM_ID) AS PRO_ADDR, 
            T1.COM_VAL || ' ' || T2.COM_VAL || ' ' || T3.COM_VAL || ' ' || T4.COM_VAL AS COMVAL
        FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
        WHERE T1.GRP_ID = T2.GRP_ID(+) AND T1.COM_ID = T2.PARENT_ID(+)
        AND T2.GRP_ID = T3.GRP_ID(+) AND T2.COM_ID = T3.PARENT_ID(+)
        AND T3.GRP_ID = T4.GRP_ID(+) AND T3.COM_ID = T4.PARENT_ID(+)
        AND T1.GRP_ID = 'GRP001' AND T1.COM_LVL = 1
    ) B
    WHERE B.GRPID1 = A.PRO_ADDR_GRP(+)
    AND B.PRO_ADDR = A.PRO_ADDR(+)
    ;
    
    
    --지역별 교수수
    SELECT B.PRO_ADDR, B.COMVAL, COUNT(A.PRO_ID) AS PROCNT
    FROM PROFESSORS_TBL A, 
    (
        SELECT 
            T1.GRP_ID AS GRPID1, T1.COM_ID AS COMID1, T1.COM_VAL AS COMVAL1,
            T2.GRP_ID AS GRPID2, T2.COM_ID AS COMID2, T2.COM_VAL AS COMVAL2,
            T3.GRP_ID AS GRPID3, T3.COM_ID AS COMID3, T3.COM_VAL AS COMVAL3, 
            T4.GRP_ID AS GRPID4, T4.COM_ID AS COMID4, T4.COM_VAL AS COMVAL4,
            DECODE(T4.COM_ID, NULL, T3.COM_ID, T4.COM_ID) AS PRO_ADDR, 
            T1.COM_VAL || ' ' || T2.COM_VAL || ' ' || T3.COM_VAL || ' ' || T4.COM_VAL AS COMVAL
        FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
        WHERE T1.GRP_ID = T2.GRP_ID(+) AND T1.COM_ID = T2.PARENT_ID(+)
        AND T2.GRP_ID = T3.GRP_ID(+) AND T2.COM_ID = T3.PARENT_ID(+)
        AND T3.GRP_ID = T4.GRP_ID(+) AND T3.COM_ID = T4.PARENT_ID(+)
        AND T1.GRP_ID = 'GRP001' AND T1.COM_LVL = 1
    ) B
    WHERE B.GRPID1 = A.PRO_ADDR_GRP(+)
    AND B.PRO_ADDR = A.PRO_ADDR(+)
    GROUP BY B.PRO_ADDR, B.COMVAL
    ORDER BY B.PRO_ADDR ASC
    ;
    
    
    --지역별 학생수, 교수수
    SELECT C.COMVAL, C.STUCNT, NVL(D.PROCNT,0) AS PROCNT FROM
    (
        SELECT B.STU_ADDR, B.COMVAL,  COUNT(A.STU_ID) AS STUCNT
        FROM STUDENTS_TBL A, 
        (
            SELECT 
                T1.GRP_ID AS GRPID1, T1.COM_ID AS COMID1, T1.COM_VAL AS COMVAL1,
                T2.GRP_ID AS GRPID2, T2.COM_ID AS COMID2, T2.COM_VAL AS COMVAL2,
                T3.GRP_ID AS GRPID3, T3.COM_ID AS COMID3, T3.COM_VAL AS COMVAL3, 
                T4.GRP_ID AS GRPID4, T4.COM_ID AS COMID4, T4.COM_VAL AS COMVAL4,
                DECODE(T4.COM_ID, NULL, T3.COM_ID, T4.COM_ID) AS STU_ADDR,
                T1.COM_VAL || ' ' || T2.COM_VAL || ' ' || T3.COM_VAL || ' ' || T4.COM_VAL AS COMVAL
            FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
            WHERE T1.GRP_ID = T2.GRP_ID(+) AND T1.COM_ID = T2.PARENT_ID(+)
            AND T2.GRP_ID = T3.GRP_ID(+) AND T2.COM_ID = T3.PARENT_ID(+)
            AND T3.GRP_ID = T4.GRP_ID(+) AND T3.COM_ID = T4.PARENT_ID(+)
            AND T1.GRP_ID = 'GRP001' AND T1.COM_LVL = 1
        ) B
        WHERE B.GRPID1 = A.STU_ADDR_GRP(+)
        AND B.STU_ADDR = A.STU_ADDR(+)
        GROUP BY B.STU_ADDR, B.COMVAL    
    ) C
    ,
    (
        SELECT B.PRO_ADDR, B.COMVAL, COUNT(A.PRO_ID) AS PROCNT
        FROM PROFESSORS_TBL A, 
        (
            SELECT 
                T1.GRP_ID AS GRPID1, T1.COM_ID AS COMID1, T1.COM_VAL AS COMVAL1,
                T2.GRP_ID AS GRPID2, T2.COM_ID AS COMID2, T2.COM_VAL AS COMVAL2,
                T3.GRP_ID AS GRPID3, T3.COM_ID AS COMID3, T3.COM_VAL AS COMVAL3, 
                T4.GRP_ID AS GRPID4, T4.COM_ID AS COMID4, T4.COM_VAL AS COMVAL4,
                DECODE(T4.COM_ID, NULL, T3.COM_ID, T4.COM_ID) AS PRO_ADDR, 
                T1.COM_VAL || ' ' || T2.COM_VAL || ' ' || T3.COM_VAL || ' ' || T4.COM_VAL AS COMVAL
            FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
            WHERE T1.GRP_ID = T2.GRP_ID(+) AND T1.COM_ID = T2.PARENT_ID(+)
            AND T2.GRP_ID = T3.GRP_ID(+) AND T2.COM_ID = T3.PARENT_ID(+)
            AND T3.GRP_ID = T4.GRP_ID(+) AND T3.COM_ID = T4.PARENT_ID(+)
            AND T1.GRP_ID = 'GRP001' AND T1.COM_LVL = 1
        ) B
        WHERE B.GRPID1 = A.PRO_ADDR_GRP(+)
        AND B.PRO_ADDR = A.PRO_ADDR(+)
        GROUP BY B.PRO_ADDR, B.COMVAL
    ) D
    WHERE C.STU_ADDR = D.PRO_ADDR(+)
    ORDER BY C.STU_ADDR ASC
    ;



--11. 가장많은 학점을 듣고 있는 학생을 찾아주세요
-- 여러명일수도 있어요

--학생별 총 수강학점 리스트
SELECT T1.STU_ID, T1.STU_NAME, NVL(SUM(T3.SUB_CREDIT),0) AS TLTCREDIT 
FROM STUDENTS_TBL T1, STUDENTS_TIME_TBL T2, SUBJECTS_TBL T3
WHERE T1.STU_ID = T2.STU_ID(+)
AND T2.SUB_ID = T3.SUB_ID(+)
GROUP BY T1.STU_ID, T1.STU_NAME
ORDER BY  NVL(SUM(T3.SUB_CREDIT),0) DESC 
;

--가장 많은 학점을 수강하는 학생
SELECT * FROM
(
    SELECT T1.STU_ID, T1.STU_NAME, NVL(SUM(T3.SUB_CREDIT),0) AS TLTCREDIT
          , DENSE_RANK() OVER(ORDER BY NVL(SUM(T3.SUB_CREDIT),0) DESC) AS RNK
    FROM STUDENTS_TBL T1, STUDENTS_TIME_TBL T2, SUBJECTS_TBL T3
    WHERE T1.STU_ID = T2.STU_ID(+)
    AND T2.SUB_ID = T3.SUB_ID(+)
    GROUP BY T1.STU_ID, T1.STU_NAME
)
WHERE RNK = 1
;


--12. 가장많은 강의 시간을 가지고 있는 교수를 찾아주세요

--교수별 과목리스트
SELECT * 
FROM PROFESSORS_TBL T1, SUBJECTS_TBL T2
WHERE T1.PRO_ID = T2.PRO_ID(+)
;


--교수별 강의시간 
SELECT T1.PRO_ID, T1.PRO_NAME, SUM(T2.SUB_CREDIT)
FROM PROFESSORS_TBL T1, SUBJECTS_TBL T2
WHERE T1.PRO_ID = T2.PRO_ID(+)
GROUP BY T1.PRO_ID, T1.PRO_NAME
;

--이렇게 풀면 50점입니다.
--왜냐하면 과목은 만들어졌지만 실제로 학생들이 수강신청을 하지 않아서 강의가 없어진 과목도 있기 때문입니다.
-----------------------------------------------------------

--실제 교수가 맡게된 교수별 강의과목 리스트
SELECT T1.PRO_ID, T1.PRO_NAME, T2.SUB_ID, T2.SUB_NAME, T2.SUB_CREDIT
FROM PROFESSORS_TBL T1, SUBJECTS_TBL T2
WHERE T1.PRO_ID = T2.PRO_ID(+)
;

--그러나 수강생이 없어서 취소된 강의과목 리스트
SELECT * FROM SUBJECTS_TBL T1, STUDENTS_TIME_TBL T2
WHERE T1.SUB_ID = T2.SUB_ID(+)
AND T2.SUB_ID IS NULL
;


--교수별 강의를 맡은 과목 과 수강생이 없어서 춰쇠된 강의과목 및 시수 리스트
SELECT A.PRO_ID, A.PRO_NAME, A.SUB_ID, A.SUB_NAME,
          A.SUB_CREDIT,  --실제로 해당교수가 강의를 하는 학점수
          NVL(B.SUB_CREDIT,0) AS CANCEL_CREDIT  --하지만 수강신청이 없어서 취소된 학점수
FROM         
(
    SELECT T1.PRO_ID, T1.PRO_NAME, T2.SUB_ID, T2.SUB_NAME, T2.SUB_CREDIT
    FROM PROFESSORS_TBL T1, SUBJECTS_TBL T2
    WHERE T1.PRO_ID = T2.PRO_ID(+)
) A
,
(
    SELECT T1.SUB_ID, T1.SUB_NAME, T1.SUB_CREDIT
    FROM SUBJECTS_TBL T1, STUDENTS_TIME_TBL T2
    WHERE T1.SUB_ID = T2.SUB_ID(+)
    AND T2.SUB_ID IS NULL
) B
WHERE A.SUB_ID = B.SUB_ID(+)
;


--실제로 가장 많은 강의를 맡은 교수 찾기
SELECT * FROM
(
    SELECT A.PRO_ID, A.PRO_NAME, 
              SUM(A.SUB_CREDIT - NVL(B.SUB_CREDIT, 0)) AS CNT,
              DENSE_RANK() OVER(ORDER BY SUM(A.SUB_CREDIT - NVL(B.SUB_CREDIT, 0)) DESC) AS RNK
    FROM 
    (
        SELECT T1.PRO_ID, T1.PRO_NAME, T2.SUB_ID, T2.SUB_NAME, T2.SUB_CREDIT
        FROM PROFESSORS_TBL T1, SUBJECTS_TBL T2
        WHERE T1.PRO_ID = T2.PRO_ID(+)
    ) A
    ,
    (
        SELECT T1.SUB_ID, T1.SUB_NAME, T1.SUB_CREDIT
        FROM SUBJECTS_TBL T1, STUDENTS_TIME_TBL T2
        WHERE T1.SUB_ID = T2.SUB_ID(+)
        AND T2.SUB_ID IS NULL
    ) B
    WHERE A.SUB_ID = B.SUB_ID(+)
    GROUP BY A.PRO_ID, A.PRO_NAME
) WHERE RNK = 1
;



--13. 2018년 2월1일 부터 ~ 2월 28일까지 각 날짜별로 수강신청 현황을 보여주세요
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT * FROM STUDENTS_TIME_TBL;


SELECT 
TO_CHAR(TO_DATE('2018-02-01', 'YYYY-MM-DD'), 'YYYY-MM') || '-' || TO_CHAR(LEVEL, 'FM00') AS BSDATE
FROM DUAL
CONNECT BY LEVEL <= TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE('2018-02-01', 'YYYY-MM-DD')), 'DD'))
;

SELECT TO_CHAR(REG_TIME, 'YYYY-MM-DD') FROM STUDENTS_TIME_TBL
;

SELECT LAST_DAY(SYSDATE) FROM DUAL;

SELECT A.BSDATE, COUNT(B.REGDATE) AS CNT,  NVL(MAX(C.STUCNT),0) AS STUCNT
FROM
(
    SELECT 
    TO_CHAR(TO_DATE('2018-02-01', 'YYYY-MM-DD'), 'YYYY-MM') || '-' || TO_CHAR(LEVEL, 'FM00') AS BSDATE
    FROM DUAL
    CONNECT BY LEVEL <= TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE('2018-02-01', 'YYYY-MM-DD')), 'DD'))
) A
,
(
    SELECT TO_CHAR(REG_TIME, 'YYYY-MM-DD') AS REGDATE FROM STUDENTS_TIME_TBL
) B
, 
(
    SELECT REGTIME, COUNT(*) AS STUCNT  FROM
    (
        SELECT TO_CHAR(REG_TIME, 'YYYY-MM-DD') AS REGTIME, STU_ID, COUNT(*) 
        FROM STUDENTS_TIME_TBL
        GROUP BY TO_CHAR(REG_TIME, 'YYYY-MM-DD'), REG_TIME, STU_ID
    ) GROUP BY REGTIME
) C
WHERE A.BSDATE = B.REGDATE(+)
AND A.BSDATE = C.REGTIME(+)
GROUP BY A.BSDATE
ORDER BY A.BSDATE ASC
;


--14. 가장 수강신청이 많은 날짜를 찾아주세요
SELECT * FROM
(
    SELECT REG_TIME, COUNT(*),
    RANK() OVER(ORDER BY COUNT(*) DESC) AS RNK
    FROM STUDENTS_TIME_TBL
    GROUP BY REG_TIME
)
WHERE RNK = 1
;


--15. 가장 수강신청이 많은 과목 해당과목 교수님을 찾아주세요

--수강신청이 가장 많은 과목 아이디 찾기
SELECT * FROM 
(
    SELECT SUB_ID, COUNT(*),
    RANK() OVER(ORDER BY COUNT(*) DESC) AS RNK
    FROM STUDENTS_TIME_TBL T1
    GROUP BY SUB_ID
)
WHERE RNK = 1
;

--수강신청이 가장 많은 과목과 교수
SELECT B.SUB_ID, B.SUB_NAME, C.PRO_ID, C.PRO_NAME FROM
(
    SELECT * FROM 
    (
        SELECT SUB_ID, COUNT(*),
        RANK() OVER(ORDER BY COUNT(*) DESC) AS RNK
        FROM STUDENTS_TIME_TBL T1
        GROUP BY SUB_ID
    )
    WHERE RNK = 1
) A,
SUBJECTS_TBL B, PROFESSORS_TBL C
WHERE A.SUB_ID = B.SUB_ID
AND B.PRO_ID = C.PRO_ID
;


--16. 학생이 한명도 없는 학과의 교수명단 리스트를 보여주세요

--현재 우리학교에 있는 모든 학과
    SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
    FROM COMMONS_TBL T1, COMMONS_TBL T2
    WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
    AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
    ;

--학생이 한명도 없는 학과 찾기
SELECT A.GRP_ID, A.COM_ID, A.PARTNAME FROM
(
    SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
    FROM COMMONS_TBL T1, COMMONS_TBL T2
    WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
    AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
) A, STUDENTS_TBL B
WHERE A.GRP_ID = B.STU_DEPT_GRP(+) AND A.COM_ID = B.STU_DEPT(+)
AND B.STU_ID IS  NULL
;

--학생이 하나도 없는 학과 교수명단 리스트
SELECT A.GRP_ID, A.COM_ID, A.PARTNAME, C.PRO_ID, C.PRO_NAME
FROM
(
    SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
    FROM COMMONS_TBL T1, COMMONS_TBL T2
    WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
    AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
) A, STUDENTS_TBL B, PROFESSORS_TBL C
WHERE A.GRP_ID = B.STU_DEPT_GRP(+) AND A.COM_ID = B.STU_DEPT(+)
AND A.GRP_ID = C.PRO_DEPT_GRP(+) AND A.COM_ID = C.PRO_DEPT(+)
AND B.STU_ID IS  NULL
ORDER BY A.COM_ID ASC
;


--17. 각 학과별 학생들의 시험성적 평균과 합계를 보여주세요


--학과데이터를 포함한 학생들의 수강신청 리스트
    SELECT *
    FROM
    (
        SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
        FROM COMMONS_TBL T1, COMMONS_TBL T2
        WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
        AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
    ) A, STUDENTS_TBL B, STUDENTS_TIME_TBL C
    WHERE A.GRP_ID = B.STU_DEPT_GRP AND A.COM_ID = B.STU_DEPT
    AND B.STU_ID = C.STU_ID
    ;
    
    
    SELECT *
    FROM
    (
        SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
        FROM COMMONS_TBL T1, COMMONS_TBL T2
        WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
        AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
    ) A
    , STUDENTS_TBL B
    , STUDENTS_TIME_TBL C
    ,
    (
        SELECT * FROM SCORES_TBL 
        WHERE GUBUN = 2
    ) D
    WHERE A.GRP_ID = B.STU_DEPT_GRP AND A.COM_ID = B.STU_DEPT
    AND B.STU_ID = C.STU_ID
    AND C.STU_ID = D.STU_ID(+) AND C.SUB_ID = D.SUB_ID(+)
    AND C.DO_YEAR = D.DO_YEAR(+) AND C.SEMESTER = D.SEMESTER(+)
    --AND D.STU_ID IS NULL
    ;
    
    
    ---------------------------------------------------------------
    
    --중간고사
    SELECT A.GRP_ID, A.COM_ID, A.PARTNAME, B.STU_ID, B.STU_NAME,
              SUM(NVL(D.SCORE,0)) AS TLTSCORE,
              ROUND(AVG(NVL(D.SCORE,0)),1) AS TLTAVG
    FROM
    (
        SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
        FROM COMMONS_TBL T1, COMMONS_TBL T2
        WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
        AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
    ) A
    , STUDENTS_TBL B
    , STUDENTS_TIME_TBL C
    ,
    (
        SELECT * FROM SCORES_TBL 
        WHERE GUBUN = 1
    ) D
    WHERE A.GRP_ID = B.STU_DEPT_GRP AND A.COM_ID = B.STU_DEPT
    AND B.STU_ID = C.STU_ID
    AND C.STU_ID = D.STU_ID(+) AND C.SUB_ID = D.SUB_ID(+)
    AND C.DO_YEAR = D.DO_YEAR(+) AND C.SEMESTER = D.SEMESTER(+)
    --AND D.STU_ID IS NULL
    GROUP BY A.GRP_ID, A.COM_ID, A.PARTNAME, B.STU_ID, B.STU_NAME
    ORDER BY B.STU_ID ASC
    ;
    
    -----------------------------------------------------------------------------
    --기말고사
    SELECT A.GRP_ID, A.COM_ID, A.PARTNAME, B.STU_ID, B.STU_NAME,
              SUM(NVL(D.SCORE,0)) AS TLTSCORE,
              ROUND(AVG(NVL(D.SCORE,0)),1) AS TLTAVG
    FROM
    (
        SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
        FROM COMMONS_TBL T1, COMMONS_TBL T2
        WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
        AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
    ) A
    , STUDENTS_TBL B
    , STUDENTS_TIME_TBL C
    ,
    (
        SELECT * FROM SCORES_TBL 
        WHERE GUBUN = 2
    ) D
    WHERE A.GRP_ID = B.STU_DEPT_GRP AND A.COM_ID = B.STU_DEPT
    AND B.STU_ID = C.STU_ID
    AND C.STU_ID = D.STU_ID(+) AND C.SUB_ID = D.SUB_ID(+)
    AND C.DO_YEAR = D.DO_YEAR(+) AND C.SEMESTER = D.SEMESTER(+)
    --AND D.STU_ID IS NULL
    GROUP BY A.GRP_ID, A.COM_ID, A.PARTNAME, B.STU_ID, B.STU_NAME
    ORDER BY B.STU_ID ASC
    ;
    
    ------------------------------------------------------------------------
    --학생별 전체 시험결과 리스트
    SELECT A.GRP_ID, A.COM_ID, A.PARTNAME, B.STU_ID, B.STU_NAME
              ,E.DO_YEAR, E.SEMESTER, E.GUBUN, E.SCORE
    FROM
    (
        SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
        FROM COMMONS_TBL T1, COMMONS_TBL T2
        WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
        AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
    ) A
    , STUDENTS_TBL B
    , STUDENTS_TIME_TBL C
    ---------------------------------------------------------
    , (SELECT GUBUN FROM SCORES_TBL GROUP BY GUBUN) D
    ---------------------------------------------------------
    , SCORES_TBL E
    WHERE A.GRP_ID = B.STU_DEPT_GRP AND A.COM_ID = B.STU_DEPT
    AND B.STU_ID = C.STU_ID
    AND C.STU_ID = E.STU_ID(+) AND C.SUB_ID = E.SUB_ID(+)
    AND C.DO_YEAR = E.DO_YEAR(+) AND C.SEMESTER = E.SEMESTER(+)
    AND D.GUBUN = E.GUBUN(+)
    ORDER BY B.STU_ID ASC, GUBUN ASC
    ;
    
    
    --------------------------------------------------------------------------
    --학생전체 2018년 학기 전체 학생별 성적 총점, 평균
    SELECT A.GRP_ID, A.COM_ID, A.PARTNAME, B.STU_ID, B.STU_NAME,
              SUM(NVL(E.SCORE,0)) AS TLTSCORE,
              ROUND(AVG(NVL(E.SCORE,0)),1) AS TLTAVG,
              --------------------------------------------------------
              RANK() OVER(PARTITION BY A.GRP_ID, A.COM_ID ORDER BY ROUND(AVG(NVL(E.SCORE,0)),1) DESC) AS RNK
              --------------------------------------------------------
    FROM
    (
        SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
        FROM COMMONS_TBL T1, COMMONS_TBL T2
        WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
        AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
    ) A
    , STUDENTS_TBL B
    , STUDENTS_TIME_TBL C
    ---------------------------------------------------------
    , (SELECT GUBUN FROM SCORES_TBL GROUP BY GUBUN) D
    ---------------------------------------------------------
    , SCORES_TBL E
    WHERE A.GRP_ID = B.STU_DEPT_GRP AND A.COM_ID = B.STU_DEPT
    AND B.STU_ID = C.STU_ID
    AND C.STU_ID = E.STU_ID(+) AND C.SUB_ID = E.SUB_ID(+)
    AND C.DO_YEAR = E.DO_YEAR(+) AND C.SEMESTER = E.SEMESTER(+)
    AND D.GUBUN = E.GUBUN(+)
    GROUP BY A.GRP_ID, A.COM_ID, A.PARTNAME, B.STU_ID, B.STU_NAME
    ORDER BY A.COM_ID ASC
    ;   
    
    
    

--18. 전체 학생 성적리스트 
     -- 소속학화  학생명  평균   총점  신청학점  순위 순으로 보여주세요
     
    --18번 문제는 신청학점 때문에 접근을 조금 다르게 해야 할듯
     SELECT * 
     FROM
     (
        SELECT A.GRP_ID, A.COM_ID, A.PARTNAME,
                  B.STU_ID, B.STU_NAME,
                  D.SUB_ID, D.SUB_CREDIT, D.DO_YEAR, D.SEMESTER,
                  ------------------------------------------------------------------------
                  SUM(D.SUB_CREDIT) OVER(PARTITION BY B.STU_ID) AS STU_CREDIT  --학생별 신청학점수
                  ------------------------------------------------------------------------
        FROM
        (
            SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
            AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
        ) A
        , STUDENTS_TBL B
        , STUDENTS_TIME_TBL C
        , SUBJECTS_TBL D
        WHERE A.GRP_ID = B.STU_DEPT_GRP AND A.COM_ID = B.STU_DEPT
        AND B.STU_ID = C.STU_ID
        AND C.SUB_ID = D.SUB_ID
    ) AA 
    ---------------------------------------------------------
    , (SELECT GUBUN FROM SCORES_TBL GROUP BY GUBUN) BB
    ---------------------------------------------------------    
    , SCORES_TBL CC
    WHERE AA.STU_ID = CC.STU_ID(+) AND AA.SUB_ID = CC.SUB_ID(+)
    AND AA.DO_YEAR = CC.DO_YEAR(+) AND AA.SEMESTER = CC.SEMESTER(+)
    AND BB.GUBUN = CC.GUBUN(+)
    ;
    
    
     SELECT AA.GRP_ID, AA.COM_ID, AA.PARTNAME, AA.STU_ID, AA.STU_NAME,
               MAX(AA.STU_CREDIT) AS STU_CREDIT,
               SUM(NVL(CC.SCORE,0)) AS TLTSCORE,
               ROUND(AVG(NVL(CC.SCORE,0)),1) AS TLTAVG,
              --------------------------------------------------------
              RANK() OVER(PARTITION BY AA.GRP_ID, AA.COM_ID ORDER BY ROUND(AVG(NVL(CC.SCORE,0)),1) DESC) AS RNK
              --------------------------------------------------------
               
     FROM
     (
        SELECT A.GRP_ID, A.COM_ID, A.PARTNAME,
                  B.STU_ID, B.STU_NAME,
                  D.SUB_ID, D.SUB_CREDIT, D.DO_YEAR, D.SEMESTER,
                  ------------------------------------------------------------------------
                  SUM(D.SUB_CREDIT) OVER(PARTITION BY B.STU_ID) AS STU_CREDIT  --학생별 신청학점수
                  ------------------------------------------------------------------------
        FROM
        (
            SELECT T2.GRP_ID, T2.COM_ID, T1.COM_VAL || ' ' || T2.COM_VAL AS PARTNAME
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
            AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
        ) A
        , STUDENTS_TBL B
        , STUDENTS_TIME_TBL C
        , SUBJECTS_TBL D
        WHERE A.GRP_ID = B.STU_DEPT_GRP AND A.COM_ID = B.STU_DEPT
        AND B.STU_ID = C.STU_ID
        AND C.SUB_ID = D.SUB_ID
    ) AA 
    ---------------------------------------------------------
    , (SELECT GUBUN FROM SCORES_TBL GROUP BY GUBUN) BB
    ---------------------------------------------------------    
    , SCORES_TBL CC
    WHERE AA.STU_ID = CC.STU_ID(+) AND AA.SUB_ID = CC.SUB_ID(+)
    AND AA.DO_YEAR = CC.DO_YEAR(+) AND AA.SEMESTER = CC.SEMESTER(+)
    AND BB.GUBUN = CC.GUBUN(+)
    GROUP BY AA.GRP_ID, AA.COM_ID, AA.PARTNAME, AA.STU_ID, AA.STU_NAME
    ORDER BY AA.COM_ID ASC
    ;    
    


--19. 출제한 교수 별 시험결과
    -- 소속학과  교수명  평균    총점 
    
    
--20. 다음과 같은 룰로 학생들의 총 학점을 구해주세요
/*
    90점 이상                  :  A     -  4.5
    80점 이상 90점미만       :  B     -  3.5
    70점 이상 80점미만       :  C     -  2.5
    60점 이상 70점미만       :  D     -  1.5
    60점 미만                  :  F     -  1.0
    
    소속학과   학생명    총신청학점      총점    평균     학점     순위
*/




