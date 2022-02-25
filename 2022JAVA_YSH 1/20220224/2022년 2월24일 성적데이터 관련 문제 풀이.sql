SELECT * FROM GRPCOMMONS_TBL;

SELECT * FROM COMMONS_TBL;
SELECT * FROM STUDENTS_TBL;
SELECT * FROM SUBJECTS_TBL;
SELECT * FROM PROFESSORS_TBL;
SELECT * FROM STUDENTS_TIME_TBL;
SELECT * FROM SCORES_TBL;

-- 학생이 과목에 수강신청을 한다
--주소
    SELECT *
    FROM COMMONS_TBL;
    

--1. 학생리스트 출력
-- 학생아이디, 학생이름,  학생주소,  학생학과
    

--2. 교수리스트 출력
--교수아이디   교수이름   교수주소   소속학과


--3. 과목리스트
-- 등록년도   등록학기   해당학과   과목    학점
    /*
    SELECT * FROM SUBJECTS_TBL;
    SELECT * FROM COMMONS_TBL WHERE GRP_ID='GRP002';
    
    SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
        T2.COM_VAL AS 단과대학,
        T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
        T3.COM_VAL AS 학과 
    FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
    WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
        AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
        AND T1.GRP_ID='GRP002'; -- T2까지만 하고 조건에 T2.COM_LVL=2 추가해도 가능
    */
        
    SELECT A.DO_YEAR||'년 ' AS 등록년도,
        A.SEMESTER||'학기 ' AS 등록학기,
        B.CVAL1||' '||B.CVAL2 AS 해당학과,
        A.SUB_NAME AS 과목,
        A.SUB_CREDIT AS 학점
    FROM SUBJECTS_TBL A,
    (
        SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
            T2.COM_VAL AS CVAL1,
            T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
            T3.COM_VAL AS CVAL2 
        FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
        WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
            AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
            AND T1.GRP_ID='GRP002'
    ) B
    WHERE A.DEPT_GRP=B.GID2 AND A.DEPT_CODE=B.CID2;




--4. 학과별 과목리스트
-- 학과아이디, 학과명,   해당과목아이디, 해당과목,  학점
    --SJ, C
    SELECT C.CID2 AS 학과아이디,
        C.CVAL1||' '||C.CVAL2 AS 학과명,
        SJ.SUB_ID AS 해당과목아이디,
        SJ.SUB_NAME AS 해당과목,
        SJ.SUB_CREDIT AS 학점
    FROM SUBJECTS_TBL SJ,
        (
            SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                T2.COM_VAL AS CVAL1,
                T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                T3.COM_VAL AS CVAL2 
            FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
            WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                AND T1.GRP_ID='GRP002'
        ) C
    WHERE SJ.DEPT_GRP=C.GID1 AND SJ.DEPT_GRP=C.GID2
        AND SJ.DEPT_CODE=C.CID2;




--5.1 학생별 신청과목 리스트
--학생아이디  학생이름  소속학과  신청과목아이디  신청과목  학점
    --ST, STT, SJ, C
    SELECT ST.STU_ID AS 학생아이디,
        ST.STU_NAME AS 학생이름,
        C.CVAL1||' '||C.CVAL2 AS 소속학과,
        SJ.SUB_ID AS 신청과목아이디,
        SJ.SUB_NAME AS 신청과목,
        SJ.SUB_CREDIT AS 학점
    FROM STUDENTS_TBL ST,
        SUBJECTS_TBL SJ,
        STUDENTS_TIME_TBL STT,
        (
            SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                T2.COM_VAL AS CVAL1,
                T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                T3.COM_VAL AS CVAL2 
            FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
            WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                AND T1.GRP_ID='GRP002'
        ) C
    WHERE ST.STU_ID=STT.STU_ID AND SJ.SUB_ID=STT.SUB_ID
        AND ST.STU_DEPT_GRP=C.GID1 AND ST.STU_DEPT_GRP=C.GID2
        AND ST.STU_DEPT=C.CID2 --AND ST.STU_ID= :IN_STU_ID (학생ID값 입력받기)
        ;
    
    
    
--5.2 각 학생별 총신청 학점 : 학생이름 학과 학점
    SELECT ST.STU_ID AS 학생아이디,
        ST.STU_NAME AS 학생이름,
        C.CVAL1||' '||C.CVAL2 AS 소속학과,
        NVL(SUM(SJ.SUB_CREDIT),0) AS 총신청학점
    FROM STUDENTS_TBL ST,
        SUBJECTS_TBL SJ,
        STUDENTS_TIME_TBL STT,
    (
            SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                T2.COM_VAL AS CVAL1,
                T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                T3.COM_VAL AS CVAL2 
            FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
            WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                AND T1.GRP_ID='GRP002'
    ) C
    WHERE ST.STU_ID=STT.STU_ID(+) AND STT.SUB_ID=SJ.SUB_ID(+)
        AND ST.STU_DEPT_GRP=C.GID1 AND ST.STU_DEPT_GRP=C.GID2
        AND ST.STU_DEPT=C.CID2
    GROUP BY ST.STU_ID, ST.STU_NAME,C.CVAL1||' '||C.CVAL2
    ;



--6. 교수별 강의 리스트
-- 교수아이디    교수명    소속학과    강의과목아이디    과목명
    -- P, C, SJ
    SELECT P.PRO_ID AS 교수아이디,
        P.PRO_NAME AS 교수명,
        C.CVAL1||' '||C.CVAL2 AS 소속학과,
        SJ.SUB_ID AS 강의과목아이디,
        SJ.SUB_NAME AS 과목명
    FROM PROFESSORS_TBL P,
        SUBJECTS_TBL SJ,
        (
            SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                T2.COM_VAL AS CVAL1,
                T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                T3.COM_VAL AS CVAL2 
            FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
            WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                AND T1.GRP_ID='GRP002'            
        ) C
    WHERE P.PRO_ID=SJ.PRO_ID(+)
        AND P.PRO_DEPT_GRP=C.GID1 AND P.PRO_DEPT_GRP=C.GID2
        AND P.PRO_DEPT=C.CID2
        ;
    


--7. 각 학과별 학생숫자
--학과명    학생수
    --ST, C
    SELECT C.FULLNAME,
        COUNT(ST.STU_ID) AS 학생수
    FROM STUDENTS_TBL ST,
    (
            SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                T2.COM_VAL AS CVAL1,
                T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                T3.COM_VAL AS CVAL2,
                T2.COM_VAL||' '||T3.COM_VAL AS FULLNAME
            FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
            WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                AND T1.GRP_ID='GRP002' 
    ) C
    WHERE ST.STU_DEPT_GRP(+)=C.GID1 AND ST.STU_DEPT_GRP(+)=C.GID2
        AND ST.STU_DEPT(+)=C.CID2
    GROUP BY C.FULLNAME;


--8. 각 학과별 교수숫자
--학과명    교수수
    --P, C
    SELECT C.FULLNAME,
        COUNT(P.PRO_ID) AS 교수수
    FROM PROFESSORS_TBL P,
    (
            SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                T2.COM_VAL AS CVAL1,
                T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                T3.COM_VAL AS CVAL2,
                T2.COM_VAL||' '||T3.COM_VAL AS FULLNAME
            FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
            WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                AND T1.GRP_ID='GRP002' 
    ) C
    WHERE P.PRO_DEPT_GRP(+)=C.GID1 AND P.PRO_DEPT_GRP(+)=C.GID2
        AND P.PRO_DEPT(+)=C.CID2
    GROUP BY C.FULLNAME;


--9. 각 학과별 학생숫자 , 소속교수숫자
--학과명    학생수,   교수수
    SELECT A.DNAME AS 학과명,
        A.COUNT_S AS 학생수,
        B.COUNT_P AS 교수수
    FROM
    (
            SELECT C.CID2,C.CID1,C.GID1,
                C.CVAL1||' '||C.CVAL2 AS DNAME,
                COUNT(ST.STU_ID) AS COUNT_S
            FROM STUDENTS_TBL ST,
            (
                    SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                        T2.COM_VAL AS CVAL1,
                        T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                        T3.COM_VAL AS CVAL2 
                    FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
                    WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                        AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                        AND T1.GRP_ID='GRP002' 
            ) C
            WHERE ST.STU_DEPT_GRP(+)=C.GID1 AND ST.STU_DEPT_GRP(+)=C.GID2
                AND ST.STU_DEPT(+)=C.CID2
            GROUP BY C.CID2,C.CID1,C.GID1, C.CVAL1||' '||C.CVAL2
    ) A, (
            SELECT C.CID2,C.CID1,C.GID1,
                C.CVAL1||' '||C.CVAL2 AS 학과명,
                COUNT(P.PRO_ID) AS COUNT_P
            FROM PROFESSORS_TBL P,
            (
                    SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                        T2.COM_VAL AS CVAL1,
                        T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                        T3.COM_VAL AS CVAL2 
                    FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
                    WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                        AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                        AND T1.GRP_ID='GRP002' 
            ) C
            WHERE P.PRO_DEPT_GRP(+)=C.GID1 AND P.PRO_DEPT_GRP(+)=C.GID2
                AND P.PRO_DEPT(+)=C.CID2
            GROUP BY C.CID2,C.CID1,C.GID1, C.CVAL1||' '||C.CVAL2
    ) B
    WHERE A.CID2=B.CID2 AND A.CID1=B.CID1 AND A.GID1=B.GID1
    ;


--10. 각 지역별 학생숫자 , 소속교수숫자,
--지역명    학생수,   교수수
    --주소테이블
        SELECT T1.GRP_ID AS GID,
            T1.COM_ID AS CID1, T2.COM_ID AS CID2, T3.COM_ID AS CID3, T4.COM_ID AS CID4,
            DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS
        FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
        WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.COM_ID=T2.PARENT_ID(+) 
            AND T2.GRP_ID=T3.GRP_ID(+) AND T2.COM_ID=T3.PARENT_ID(+) 
            AND T3.GRP_ID=T4.GRP_ID(+) AND T3.COM_ID=T4.PARENT_ID(+) 
            AND T1.GRP_ID='GRP001' AND T1.COM_LVL=1;
            
            
    /*-------------------
    SELECT COM_ID, LPAD(' ',COM_LVL*1)||COM_VAL, COM_LVL
    FROM COMMONS_TBL 
    WHERE GRP_ID='GRP001'
    START WITH PARENT_ID='COM0000'
    CONNECT BY PRIOR COM_ID=PARENT_ID;
    --------------------*/
    
    --A. 지역별 학생 : GRPID COMID 주소 학생수
    SELECT C.GID AS GID_ST,
        C.CID1 AS CID1_ST,
        C.CID2 AS CID2_ST,
        C.CID3 AS CID3_ST,
        C.CID4 AS CID4_ST,
        C.ADDRESS AS ADDR_ST,
        COUNT(ST.STU_ID) AS CNT_ST
    FROM STUDENTS_TBL ST,
    (
        --주소테이블
        SELECT T1.GRP_ID AS GID,
            T1.COM_ID AS CID1, T2.COM_ID AS CID2, T3.COM_ID AS CID3, T4.COM_ID AS CID4,
            DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS
        FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
        WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.COM_ID=T2.PARENT_ID(+) 
            AND T2.GRP_ID=T3.GRP_ID(+) AND T2.COM_ID=T3.PARENT_ID(+) 
            AND T3.GRP_ID=T4.GRP_ID(+) AND T3.COM_ID=T4.PARENT_ID(+) 
            AND T1.GRP_ID='GRP001' AND T1.COM_LVL=1
    ) C
    WHERE ST.STU_ADDR_GRP=C.GID AND ST.STU_ADDR2=C.CID1 
        --AND ST.STU_ADDR=C.CID2 
        --AND ST.STU_ADDR=C.CID3 
        --AND ST.STU_ADDR=C.CID4
        AND ST.STU_ADDR=CID2 OR ST.STU_ADDR=C.CID3 OR ST.STU_ADDR=C.CID4
    GROUP BY C.GID, C.CID1, C.CID2, C.CID3, C.CID4, C.ADDRESS
    ;
    
    
    --B. 지역별 교수 : GRPID COMID 주소 교수수
    SELECT C.GID AS GID_P,
        C.CID1 AS CID1_P,
        C.CID2 AS CID2_P,
        C.CID3 AS CID3_P,
        C.CID4 AS CID4_P,
        C.ADDRESS AS ADDR_P,
        COUNT(P.PRO_ID) AS CNT_P
    FROM PROFESSORS_TBL P,
    (
        --주소테이블
        SELECT T1.GRP_ID AS GID,
            T1.COM_ID AS CID1, T2.COM_ID AS CID2, T3.COM_ID AS CID3, T4.COM_ID AS CID4,
            DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS
        FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
        WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.COM_ID=T2.PARENT_ID(+) 
            AND T2.GRP_ID=T3.GRP_ID(+) AND T2.COM_ID=T3.PARENT_ID(+) 
            AND T3.GRP_ID=T4.GRP_ID(+) AND T3.COM_ID=T4.PARENT_ID(+) 
            AND T1.GRP_ID='GRP001' AND T1.COM_LVL=1
    ) C
    WHERE P.PRO_ADDR_GRP=C.GID AND P.PRO_ADDR2=C.CID1 
        AND P.PRO_ADDR=CID2 OR P.PRO_ADDR=CID3 OR P.PRO_ADDR=CID4
    GROUP BY C.GID, C.CID1, C.CID2, C.CID3, C.CID4, C.ADDRESS
    ;
    
             
    --합치기
    
        --???
    
    -----------------

    SELECT A.ADDR_ST, B.ADDR_P, NVL(A.CNT_ST,0) AS STUCNT, NVL(B.CNT_P,0) AS PCNT
    FROM 
    (
            --A. 지역별 학생 : GRPID COMID 주소 학생수
            SELECT C.GID AS GID_ST,
                C.CID1 AS CID1_ST,
                C.CID2 AS CID2_ST,
                C.CID3 AS CID3_ST,
                C.CID4 AS CID4_ST,
                C.ADDRESS AS ADDR_ST,
                COUNT(ST.STU_ID) AS CNT_ST
            FROM STUDENTS_TBL ST,
            (
                --주소테이블
                SELECT T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1, T2.COM_ID AS CID2, T3.COM_ID AS CID3, T4.COM_ID AS CID4,
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS
                FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
                WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.COM_ID=T2.PARENT_ID(+) 
                    AND T2.GRP_ID=T3.GRP_ID(+) AND T2.COM_ID=T3.PARENT_ID(+) 
                    AND T3.GRP_ID=T4.GRP_ID(+) AND T3.COM_ID=T4.PARENT_ID(+) 
                    AND T1.GRP_ID='GRP001' AND T1.COM_LVL=1
            ) C
            WHERE ST.STU_ADDR_GRP=C.GID AND ST.STU_ADDR2=C.CID1 
                AND ST.STU_ADDR=CID2 OR ST.STU_ADDR=CID3 OR ST.STU_ADDR=CID4
            GROUP BY C.GID, C.CID1, C.CID2, C.CID3, C.CID4, C.ADDRESS
    ) A FULL OUTER JOIN
    (
            --B. 지역별 교수 : GRPID COMID 주소 교수수
            SELECT C.GID AS GID_P,
                C.CID1 AS CID1_P,
                C.CID2 AS CID2_P,
                C.CID3 AS CID3_P,
                C.CID4 AS CID4_P,
                C.ADDRESS AS ADDR_P,
                COUNT(P.PRO_ID) AS CNT_P
            FROM PROFESSORS_TBL P,
            (
                --주소테이블
                SELECT T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1, T2.COM_ID AS CID2, T3.COM_ID AS CID3, T4.COM_ID AS CID4,
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS
                FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
                WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.COM_ID=T2.PARENT_ID(+) 
                    AND T2.GRP_ID=T3.GRP_ID(+) AND T2.COM_ID=T3.PARENT_ID(+) 
                    AND T3.GRP_ID=T4.GRP_ID(+) AND T3.COM_ID=T4.PARENT_ID(+) 
                    AND T1.GRP_ID='GRP001' AND T1.COM_LVL=1
            ) C
            WHERE P.PRO_ADDR_GRP=C.GID AND P.PRO_ADDR2=C.CID1 
                AND P.PRO_ADDR=CID2 OR P.PRO_ADDR=CID3 OR P.PRO_ADDR=CID4
            GROUP BY C.GID, C.CID1, C.CID2, C.CID3, C.CID4, C.ADDRESS        
    ) B
    ON A.GID_ST=B.GID_P 
        AND NVL(A.CID1_ST,0)=NVL(B.CID1_P,0) AND NVL(A.CID2_ST,0)=NVL(B.CID2_P,0) AND NVL(A.CID3_ST,0)=NVL(B.CID3_P,0) AND NVL(A.CID4_ST,0)=NVL(B.CID4_P,0)
        --AND ADDR_ST=ADDR_P
        ;



--11. 가장많은 학점을 듣고 있는 학생을 찾아주세요 : DENSE_RANK() OVER()
-- 여러명일수도 있어요
--가장많은학점이 얼마인지 + 그만큼 듣는 학생 전부 출력
--SJ, ST, STT, C : 학생ID 이름 학과 학점
    
    --가장 많이 신청한 학점이 몇인지
    SELECT MAX(SUM(SJ.SUB_CREDIT)) AS MAXCREDIT
    FROM STUDENTS_TIME_TBL STT, SUBJECTS_TBL SJ
    WHERE STT.SUB_ID=SJ.SUB_ID
    GROUP BY STT.STU_ID
    ;
    
    --학생들이 신청한 학점 + 순위
    SELECT ST.STU_ID, ST.STU_NAME, SUM(SJ.SUB_CREDIT),
        DENSE_RANK() OVER(ORDER BY SUM(SJ.SUB_CREDIT) DESC) AS RANKING
    FROM STUDENTS_TBL ST, SUBJECTS_TBL SJ, STUDENTS_TIME_TBL STT
    WHERE ST.STU_ID=STT.STU_ID AND SJ.SUB_ID=STT.SUB_ID
    GROUP BY ST.STU_ID, ST.STU_NAME ORDER BY SUM(SJ.SUB_CREDIT) DESC;
    
    --가장많은학점(22)만큼 신청한 학생들
    --RANK() 없이
    SELECT B.STU_ID AS 학생ID,
        B.STU_NAME AS 이름,
        A.MAXCREDIT AS 신청학점
    FROM 
    (
        SELECT MAX(SUM(SJ.SUB_CREDIT)) AS MAXCREDIT
        FROM STUDENTS_TIME_TBL STT, SUBJECTS_TBL SJ
        WHERE STT.SUB_ID=SJ.SUB_ID
        GROUP BY STT.STU_ID
    ) A, 
    (
        SELECT ST.STU_ID, ST.STU_NAME, SUM(SJ.SUB_CREDIT) AS TOTALCREDIT
        FROM STUDENTS_TBL ST, SUBJECTS_TBL SJ, STUDENTS_TIME_TBL STT
        WHERE ST.STU_ID=STT.STU_ID AND SJ.SUB_ID=STT.SUB_ID
        GROUP BY ST.STU_ID, ST.STU_NAME ORDER BY SUM(SJ.SUB_CREDIT) DESC
    ) B
    WHERE A.MAXCREDIT=B.TOTALCREDIT;
    

--12. 가장많은 강의 시간을 가지고 있는 교수를 찾아주세요
--가장많은시간이 얼마인지 + 그만큼 강의하는 교수 전부 출력
--수강신청 없는 강의는 제외해야 함

--13. 2018년 2월1일 부터 ~ 2월 28일까지 각 날짜별로 수강신청 현황을 보여주세요
    --날짜, 학생수, 수강신청수
    
    --날짜별 학생별 수강신청수
    SELECT REG_TIME, STU_ID, COUNT(*) 
    FROM STUDENTS_TIME_TBL
    GROUP BY REG_TIME, STU_ID;
    
    --날짜별 수강신청수----------------------------------수정필요
    SELECT C.REG_TIME, COUNT(B.STU_ID), MAX(C.CNT) 
    FROM STUDENTS_TIME_TBL B,
    (
        SELECT TO_CHAR(TO_DATE('20180201', 'YYYYMMDD'),'YYYYMM')||TO_CHAR(LEVEL, 'FM00') AS RESULTDATE
        FROM DUAL
        CONNECT BY LEVEL<= TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE('20180201', 'YYYYMMDD')),'DD'))
    ) A,
    (
        SELECT REG_TIME, STU_ID, COUNT(*) AS CNT
        FROM STUDENTS_TIME_TBL
        GROUP BY REG_TIME, STU_ID
    ) C
    WHERE A.RESULTDATE=TO_CHAR(B.REG_TIME(+),'YYYYMMDD')
    GROUP BY C.REG_TIME
    ;
    
    
    
    
    SELECT LAST_DAY(SYSDATE) FROM DUAL;
    
    SELECT TO_CHAR(TO_DATE('20180201', 'YYYYMMDD'),'YYYYMM')||TO_CHAR(LEVEL, 'FM00')
    FROM DUAL
    CONNECT BY LEVEL<= TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE('20180201', 'YYYYMMDD')),'DD'));-- :IN_DATE

    --날짜별 수강신청 수
    SELECT A.RESULTDATE, COUNT(B.STU_ID) AS CNT
    FROM STUDENTS_TIME_TBL B,
    (
        SELECT TO_CHAR(TO_DATE('20180201', 'YYYYMMDD'),'YYYYMM')||TO_CHAR(LEVEL, 'FM00') AS RESULTDATE
        FROM DUAL
        CONNECT BY LEVEL<= TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE('20180201', 'YYYYMMDD')),'DD'))
    ) A
    WHERE A.RESULTDATE=TO_CHAR(B.REG_TIME(+), 'YYYYMMDD')
    GROUP BY A.RESULTDATE
    ORDER BY A.RESULTDATE ASC;

--14. 가장 수강신청이 많은 날짜를 찾아주세요


--15. 가장 수강신청이 많은 과목 해당과목 교수님을 찾아주세요


--16. 학생이 한명도 없는 학과의 교수명단 리스트를 보여주세요
    --학생 학과 인원수 : 학생수가 0인 학과 찾기
        SELECT C.CVAL1||' '||C.CVAL2 AS 학과명,
            COUNT(ST.STU_ID) AS 학생수
        FROM STUDENTS_TBL ST,
        (
                SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                    T2.COM_VAL AS CVAL1,
                    T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                    T3.COM_VAL AS CVAL2 
                FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
                WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                    AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                    AND T1.GRP_ID='GRP002' 
        ) C
        WHERE ST.STU_DEPT_GRP(+)=C.GID1 AND ST.STU_DEPT_GRP(+)=C.GID2
            AND ST.STU_DEPT(+)=C.CID2
        GROUP BY C.CID2, C.CVAL1||' '||C.CVAL2;
    
    SELECT A.DEPT, A.CNT
    FROM
    (
        SELECT C.CVAL1||' '||C.CVAL2 AS DEPT,
            COUNT(ST.STU_ID) AS CNT
        FROM STUDENTS_TBL ST,
        (
                SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                    T2.COM_VAL AS CVAL1,
                    T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                    T3.COM_VAL AS CVAL2 
                FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
                WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                    AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                    AND T1.GRP_ID='GRP002' 
        ) C
        WHERE ST.STU_DEPT_GRP(+)=C.GID1 AND ST.STU_DEPT_GRP(+)=C.GID2
            AND ST.STU_DEPT(+)=C.CID2
        GROUP BY C.CID2, C.CVAL1||' '||C.CVAL2
    ) A
    WHERE A.CNT=0;
    
    SELECT P.PRO_ID, P.PRO_NAME, B.DEPT
    FROM PROFESSORS_TBL P,
    (
    
    ) B
    WHERE 

--17. 각 학과별 학생들의 시험성적 평균과 합계를 보여주세요
    --중간/기말/전체

--18. 전체 학생 성적리스트 
     -- 소속학과  학생명  평균   총점  신청학점  순위 순으로 보여주세요


--19. 출제한 교수 별 시험결과
    -- 소속학과  교수명  평균    총점 
    -- P, SJ, SC, C
    SELECT C.CVAL1||' '||C.CVAL2 AS 소속학과,
        P.PRO_ID,
        P.PRO_NAME AS 교수명,
        ROUND(AVG(SC.SCORE),2) AS 평균,
        SUM(SC.SCORE) AS 총점
    FROM PROFESSORS_TBL P,
        SUBJECTS_TBL SJ,
        SCORES_TBL SC,
        (
                SELECT T2.GRP_ID AS GID1, T2.COM_ID AS CID1, 
                    T2.COM_VAL AS CVAL1,
                    T3.GRP_ID AS GID2, T3.COM_ID AS CID2, 
                    T3.COM_VAL AS CVAL2 
                FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
                WHERE T1.GRP_ID=T2.GRP_ID AND T1.COM_ID=T2.PARENT_ID
                    AND T2.GRP_ID=T3.GRP_ID AND T2.COM_ID=T3.PARENT_ID
                    AND T1.GRP_ID='GRP002' 
        ) C
    WHERE P.PRO_ID=SJ.PRO_ID
        AND SJ.SUB_ID=SC.SUB_ID
        AND P.PRO_DEPT_GRP=C.GID1 AND P.PRO_DEPT_GRP=C.GID2
        AND P.PRO_DEPT=C.CID2
    GROUP BY C.CVAL1||' '||C.CVAL2, P.PRO_ID, P.PRO_NAME;
    
--20. 다음과 같은 룰로 학생들의 총 학점을 구해주세요
/*
    90점 이상                  :  A     -  4.5
    80점 이상 90점미만       :  B     -  3.5
    70점 이상 80점미만       :  C     -  2.5
    60점 이상 70점미만       :  D     -  1.5
    60점 미만                  :  F     -  1.0
    
    소속학과   학생명    총신청학점      총점    평균     학점     순위
*/




SELECT * FROM COMMONS_TBL
WHERE GRP_ID='GRP001' AND COM_ID='COM0050';

SELECT * FROM COMMONS_TBL
WHERE GRP_ID='GRP001' AND COM_VAL='전하동';














