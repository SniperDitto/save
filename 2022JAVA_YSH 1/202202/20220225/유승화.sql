
--주소
    SELECT DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS,
        T1.GRP_ID AS GID,
        T1.COM_ID AS CID1,
        T2.COM_ID AS CID2,
        T3.COM_ID AS CID3,
        T4.COM_ID AS CID4
    FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
    WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.GRP_ID=T3.GRP_ID(+) AND T1.GRP_ID=T4.GRP_ID(+)
        AND T1.GRP_ID='GRP001'
        AND T1.COM_LVL=1
        AND T1.COM_ID=T2.PARENT_ID(+)
        AND T2.COM_ID=T3.PARENT_ID(+)
        AND T3.COM_ID=T4.PARENT_ID(+)
        ;
        
        
        
--학과
    SELECT 
        DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
        T1.GRP_ID AS GID,
        T1.COM_ID AS CID1,
        T2.COM_ID AS CID2
    FROM COMMONS_TBL T1, COMMONS_TBL T2
    WHERE T1.COM_ID=T2.PARENT_ID(+)
        AND T1.GRP_ID='GRP002' 
        AND T1.GRP_ID=T2.GRP_ID
        AND T2.COM_LVL=2
        ;
    
    

--1. 학생리스트 출력
-- 학생아이디, 학생이름,  학생주소,  학생학과

    SELECT ST.STU_ID AS 학생아이디,
        ST.STU_NAME AS 학생이름,
        A.SADDR AS 학생주소,
        B.SDEPT AS 학과
    FROM STUDENTS_TBL ST,
    (
        --학생&주소
        SELECT ST.STU_ID AS SID1,
            ST.STU_NAME AS SNAME1,
            C.ADDRESS AS SADDR
        FROM STUDENTS_TBL ST,
            (
                --주소
                SELECT DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2,
                    T3.COM_ID AS CID3,
                    T4.COM_ID AS CID4
                FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
                WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.GRP_ID=T3.GRP_ID(+) AND T1.GRP_ID=T4.GRP_ID(+)
                    AND T1.GRP_ID='GRP001'
                    AND T1.COM_LVL=1
                    AND T1.COM_ID=T2.PARENT_ID(+)
                    AND T2.COM_ID=T3.PARENT_ID(+)
                    AND T3.COM_ID=T4.PARENT_ID(+)
            
            ) C
        WHERE ST.STU_ADDR_GRP=C.GID AND ST.STU_ADDR2=C.CID1
            AND ST.STU_ADDR=C.CID2 OR ST.STU_ADDR=C.CID3 OR ST.STU_ADDR=C.CID4
    ) A, 
    (
        --학생&학과
        SELECT ST.STU_ID AS SID2,
            ST.STU_NAME AS SNAME2,
            D.DEPT AS SDEPT
        FROM STUDENTS_TBL ST,
            (
                --학과
                SELECT 
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2
                FROM COMMONS_TBL T1, COMMONS_TBL T2
                WHERE T1.COM_ID=T2.PARENT_ID(+)
                    AND T1.GRP_ID='GRP002' 
                    AND T1.GRP_ID=T2.GRP_ID(+)
                    AND T2.COM_LVL=2
            ) D
        WHERE ST.STU_DEPT_GRP=D.GID AND STU_DEPT=D.CID2
        
    ) B
    WHERE ST.STU_ID=A.SID1 AND ST.STU_ID=B.SID2
    ORDER BY ST.STU_ID ASC;

--2. 교수리스트 출력
--교수아이디   교수이름   교수주소   소속학과
    
    SELECT P.PRO_ID AS 교수아이디,
        P.PRO_NAME AS 교수이름,
        A.PADDR AS 주소,
        B.PDEPT AS 학과
    FROM PROFESSORS_TBL P,
    (
        --교수&주소
        SELECT P.PRO_ID AS PID1,
            P.PRO_NAME AS PNAME1,
            C.ADDRESS AS PADDR
        FROM PROFESSORS_TBL P,
        (
                --주소
                SELECT DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2,
                    T3.COM_ID AS CID3,
                    T4.COM_ID AS CID4
                FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
                WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.GRP_ID=T3.GRP_ID(+) AND T1.GRP_ID=T4.GRP_ID(+)
                    AND T1.GRP_ID='GRP001'
                    AND T1.COM_LVL=1
                    AND T1.COM_ID=T2.PARENT_ID(+)
                    AND T2.COM_ID=T3.PARENT_ID(+)
                    AND T3.COM_ID=T4.PARENT_ID(+)
        ) C
        WHERE P.PRO_ADDR_GRP=C.GID AND P.PRO_ADDR2=C.CID1
            AND P.PRO_ADDR=C.CID2 OR P.PRO_ADDR=C.CID3 OR P.PRO_ADDR=C.CID4
    ) A, 
    (
        --교수&학과
        SELECT P.PRO_ID AS PID2,
            P.PRO_NAME AS PNAME2,
            D.DEPT AS PDEPT
        FROM PROFESSORS_TBL P,
        (
                --학과
                SELECT 
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2
                FROM COMMONS_TBL T1, COMMONS_TBL T2
                WHERE T1.COM_ID=T2.PARENT_ID
                    AND T1.GRP_ID='GRP002' 
                    AND T1.GRP_ID=T2.GRP_ID
                    AND T2.COM_LVL=2
        ) D
        WHERE P.PRO_DEPT_GRP=D.GID AND P.PRO_DEPT=D.CID2
    ) B
    WHERE P.PRO_ID=A.PID1 AND P.PRO_ID=B.PID2
    ORDER BY P.PRO_ID ASC;

--3. 과목리스트
-- 등록년도   등록학기   해당학과   과목    학점
    SELECT SJ.DO_YEAR AS 등록년도,
        SJ.SEMESTER AS 등록학기,
        D.DEPT AS 학과,
        SJ.SUB_NAME AS 과목,
        SJ.SUB_CREDIT AS 학점
    FROM SUBJECTS_TBL SJ,
    (
            --학과
            SELECT 
                DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                T1.GRP_ID AS GID,
                T1.COM_ID AS CID1,
                T2.COM_ID AS CID2
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.COM_ID=T2.PARENT_ID
                AND T1.GRP_ID='GRP002' 
                AND T1.GRP_ID=T2.GRP_ID
                AND T2.COM_LVL=2
    ) D
    WHERE SJ.DEPT_GRP=D.GID AND SJ.DEPT_CODE=D.CID2
    ORDER BY SJ.SUB_ID ASC;


--4. 학과별 과목리스트
-- 학과아이디, 학과명,   해당과목아이디, 해당과목,  학점
    SELECT SJ.DEPT_CODE AS 학과아이디,
        D.DEPT AS 학과명,
        SJ.SUB_ID AS 과목아이디,
        SJ.SUB_NAME AS 과목,
        SJ.SUB_CREDIT AS 학점
    FROM SUBJECTS_TBL SJ,
    (
            --학과
            SELECT 
                DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                T1.GRP_ID AS GID,
                T1.COM_ID AS CID1,
                T2.COM_ID AS CID2
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.COM_ID=T2.PARENT_ID
                AND T1.GRP_ID='GRP002' 
                AND T1.GRP_ID=T2.GRP_ID
                AND T2.COM_LVL=2
    ) D
    WHERE SJ.DEPT_GRP=D.GID AND SJ.DEPT_CODE=D.CID2
    ORDER BY SJ.SUB_ID ASC;


--5.1 학생별 신청과목 리스트
--학생아이디  학생이름  소속학과  신청과목아이디  신청과목  학점
    SELECT ST.STU_ID AS 학생아이디,
        ST.STU_NAME AS 이름,
        D.DEPT AS 소속학과,
        SJ.SUB_ID AS 신청과목아이디,
        SJ.SUB_NAME AS 신청과목,
        SJ.SUB_CREDIT AS 학점
    FROM STUDENTS_TBL ST,
        SUBJECTS_TBL SJ,
        STUDENTS_TIME_TBL STT,
    (
            --학과
            SELECT 
                DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                T1.GRP_ID AS GID,
                T1.COM_ID AS CID1,
                T2.COM_ID AS CID2
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.COM_ID=T2.PARENT_ID
                AND T1.GRP_ID='GRP002' 
                AND T1.GRP_ID=T2.GRP_ID
                AND T2.COM_LVL=2
    ) D
    WHERE ST.STU_ID=STT.STU_ID
        AND SJ.SUB_ID=STT.SUB_ID
        AND ST.STU_DEPT_GRP=D.GID AND ST.STU_DEPT=D.CID2
    ORDER BY ST.STU_ID ASC
        ;



--5.2 각 학생별 총신청 학점 : 학생이름 학과 학점

    SELECT A.SNAME2 AS 학생이름,
        A.SDEPT AS 학과,
        NVL(SUM(SJ.SUB_CREDIT),0) AS 총신청학점
    FROM STUDENTS_TIME_TBL STT,
        SUBJECTS_TBL SJ,
    (
            --학생&학과
        SELECT ST.STU_ID AS SID2,
            ST.STU_NAME AS SNAME2,
            D.DEPT AS SDEPT
        FROM STUDENTS_TBL ST,
            (
                --학과
                SELECT 
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2
                FROM COMMONS_TBL T1, COMMONS_TBL T2
                WHERE T1.COM_ID=T2.PARENT_ID(+)
                    AND T1.GRP_ID='GRP002' 
                    AND T1.GRP_ID=T2.GRP_ID(+)
                    AND T2.COM_LVL=2
            ) D
        WHERE ST.STU_DEPT_GRP=D.GID AND STU_DEPT=D.CID2
    ) A
    WHERE A.SID2=STT.STU_ID(+) AND STT.SUB_ID=SJ.SUB_ID(+)
    GROUP BY A.SNAME2, A.SID2, A.SDEPT
    ORDER BY A.SNAME2;
    



--6. 교수별 강의 리스트
-- 교수아이디    교수명    소속학과    강의과목아이디    과목명
    SELECT P.PRO_ID AS 교수아이디,
        P.PRO_NAME AS 교수명,
        D.DEPT AS 학과,
        SJ.SUB_ID AS 강의과목아이디,
        SJ.SUB_NAME AS 과목명
    FROM PROFESSORS_TBL P,
        SUBJECTS_TBL SJ,
        (
            --학과
            SELECT 
                DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                T1.GRP_ID AS GID,
                T1.COM_ID AS CID1,
                T2.COM_ID AS CID2
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.COM_ID=T2.PARENT_ID
                AND T1.GRP_ID='GRP002' 
                AND T1.GRP_ID=T2.GRP_ID
                AND T2.COM_LVL=2
        ) D
    WHERE P.PRO_ID=SJ.PRO_ID(+)
        AND P.PRO_DEPT_GRP=D.GID
        AND P.PRO_DEPT=D.CID2
    ORDER BY P.PRO_ID ASC
        ;


--7. 각 학과별 학생숫자
--학과명    학생수
    SELECT D.DEPT AS 학과명,
        COUNT(ST.STU_ID) AS 학생수
    FROM STUDENTS_TBL ST,
        (
            --학과
            SELECT 
                DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                T1.GRP_ID AS GID,
                T1.COM_ID AS CID1,
                T2.COM_ID AS CID2
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.COM_ID=T2.PARENT_ID
                AND T1.GRP_ID='GRP002' 
                AND T1.GRP_ID=T2.GRP_ID
                AND T2.COM_LVL=2
        ) D
    WHERE ST.STU_DEPT_GRP(+)=D.GID
        AND ST.STU_DEPT(+)=D.CID2
    GROUP BY D.CID2, D.DEPT;


--8. 각 학과별 교수숫자
--학과명    교수수
    SELECT D.DEPT AS 학과명,
        COUNT(P.PRO_ID) AS 교수수
    FROM PROFESSORS_TBL P,
    (
            --학과
            SELECT 
                DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                T1.GRP_ID AS GID,
                T1.COM_ID AS CID1,
                T2.COM_ID AS CID2
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.COM_ID=T2.PARENT_ID
                AND T1.GRP_ID='GRP002' 
                AND T1.GRP_ID=T2.GRP_ID
                AND T2.COM_LVL=2
    ) D
    WHERE P.PRO_DEPT_GRP(+)=D.GID AND P.PRO_DEPT(+)=D.CID2
    GROUP BY D.CID2, D.DEPT
    ;



--9. 각 학과별 학생숫자 , 소속교수숫자
--학과명    학생수,   교수수
    SELECT A.DEPT1 AS 학과명,
        A.STUCNT AS 학생수,
        B.PROCNT AS 교수수
    FROM 
    (
        SELECT D.CID2 AS STUCID,
            D.DEPT AS DEPT1,
            COUNT(ST.STU_ID) AS STUCNT
        FROM STUDENTS_TBL ST,
            (
                --학과
                SELECT 
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2
                FROM COMMONS_TBL T1, COMMONS_TBL T2
                WHERE T1.COM_ID=T2.PARENT_ID
                    AND T1.GRP_ID='GRP002' 
                    AND T1.GRP_ID=T2.GRP_ID
                    AND T2.COM_LVL=2
            ) D
        WHERE ST.STU_DEPT_GRP(+)=D.GID
            AND ST.STU_DEPT(+)=D.CID2
        GROUP BY D.CID2, D.DEPT
    ) A,
    (
        SELECT D.CID2 AS PROCID,
            D.DEPT AS DEPT2,
            COUNT(P.PRO_ID) AS PROCNT
        FROM PROFESSORS_TBL P,
        (
                --학과
                SELECT 
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2
                FROM COMMONS_TBL T1, COMMONS_TBL T2
                WHERE T1.COM_ID=T2.PARENT_ID
                    AND T1.GRP_ID='GRP002' 
                    AND T1.GRP_ID=T2.GRP_ID
                    AND T2.COM_LVL=2
        ) D
        WHERE P.PRO_DEPT_GRP(+)=D.GID AND P.PRO_DEPT(+)=D.CID2
        GROUP BY D.CID2, D.DEPT
    ) B
    WHERE A.STUCID=B.PROCID AND A.DEPT1=B.DEPT2
    ORDER BY A.STUCID;



--10. 각 지역별 학생숫자 , 소속교수숫자,
--지역명    학생수,   교수수
    
        SELECT C.ADDRESS AS 지역,
        NVL(A.SCNT,0) AS 학생수,
        NVL(B.PCNT,0) AS 교수수
    FROM
        (
            --지역&학생(INNER) : OR 때문에 OUTER JOIN 불가
            SELECT C.CID1, C.CID2, C.CID3, C.CID4, C.ADDRESS, COUNT(ST.STU_ID) AS SCNT
            FROM STUDENTS_TBL ST,
                (
                    --주소
                    SELECT DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS,
                        T1.GRP_ID AS GID,
                        T1.COM_ID AS CID1,
                        T2.COM_ID AS CID2,
                        T3.COM_ID AS CID3,
                        T4.COM_ID AS CID4
                    FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
                    WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.GRP_ID=T3.GRP_ID(+) AND T1.GRP_ID=T4.GRP_ID(+)
                        AND T1.GRP_ID='GRP001'
                        AND T1.COM_LVL=1
                        AND T1.COM_ID=T2.PARENT_ID(+)
                        AND T2.COM_ID=T3.PARENT_ID(+)
                        AND T3.COM_ID=T4.PARENT_ID(+)
                ) C
            WHERE ST.STU_ADDR_GRP=C.GID
                AND ST.STU_ADDR2=C.CID1
                AND ST.STU_ADDR=C.CID2 OR ST.STU_ADDR=C.CID3 OR ST.STU_ADDR=C.CID4
            GROUP BY C.CID1, C.CID2, C.CID3, C.CID4, C.ADDRESS
        ) A, 
        (
                --지역&교수(INNER) : OR 때문에 OUTER JOIN 불가
                SELECT C.CID1, C.CID2, C.CID3, C.CID4, C.ADDRESS, COUNT(P.PRO_ID) AS PCNT
                FROM PROFESSORS_TBL P,
                    (
                        --주소
                        SELECT DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS,
                            T1.GRP_ID AS GID,
                            T1.COM_ID AS CID1,
                            T2.COM_ID AS CID2,
                            T3.COM_ID AS CID3,
                            T4.COM_ID AS CID4
                        FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
                        WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.GRP_ID=T3.GRP_ID(+) AND T1.GRP_ID=T4.GRP_ID(+)
                            AND T1.GRP_ID='GRP001'
                            AND T1.COM_LVL=1
                            AND T1.COM_ID=T2.PARENT_ID(+)
                            AND T2.COM_ID=T3.PARENT_ID(+)
                            AND T3.COM_ID=T4.PARENT_ID(+)
                    ) C
                WHERE P.PRO_ADDR_GRP=C.GID
                    AND P.PRO_ADDR2=C.CID1
                    AND P.PRO_ADDR=C.CID2 OR P.PRO_ADDR=C.CID3 OR P.PRO_ADDR=C.CID4
                GROUP BY C.CID1, C.CID2, C.CID3, C.CID4, C.ADDRESS
        ) B, 
        (
                        
                    --주소
                    SELECT DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL||' '||T3.COM_VAL||' '||T4.COM_VAL AS ADDRESS,
                        T1.GRP_ID AS GID,
                        T1.COM_ID AS CID1,
                        T2.COM_ID AS CID2,
                        T3.COM_ID AS CID3,
                        T4.COM_ID AS CID4
                    FROM COMMONS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3, COMMONS_TBL T4
                    WHERE T1.GRP_ID=T2.GRP_ID(+) AND T1.GRP_ID=T3.GRP_ID(+) AND T1.GRP_ID=T4.GRP_ID(+)
                        AND T1.GRP_ID='GRP001'
                        AND T1.COM_LVL=1
                        AND T1.COM_ID=T2.PARENT_ID(+)
                        AND T2.COM_ID=T3.PARENT_ID(+)
                        AND T3.COM_ID=T4.PARENT_ID(+)
                    
        ) C
    WHERE NVL(A.CID1(+),0)=NVL(C.CID1,0) AND NVL(B.CID1(+),0)=NVL(C.CID1,0)
        AND NVL(A.CID2(+),0)=NVL(C.CID2,0) AND NVL(B.CID2(+),0)=NVL(C.CID2,0)
        AND NVL(A.CID3(+),0)=NVL(C.CID3,0) AND NVL(B.CID3(+),0)=NVL(C.CID3,0)
        AND NVL(A.CID4(+),0)=NVL(C.CID4,0) AND NVL(B.CID4(+),0)=NVL(C.CID4,0)
    ORDER BY A.CID1 ASC
    ;

--11. 가장많은 학점을 듣고 있는 학생을 찾아주세요 : DENSE_RANK() OVER()
-- 여러명일수도 있어요
    
    --가장많은학점(22)만큼 신청한 학생들
    --RANK() 없이
    SELECT B.STU_ID AS 학생ID,
        B.STU_NAME AS 이름,
        A.MAXCREDIT AS 신청학점
    FROM 
    (   
        --가장 많이 신청한 학점이 몇인지
        SELECT MAX(SUM(SJ.SUB_CREDIT)) AS MAXCREDIT
        FROM STUDENTS_TIME_TBL STT, SUBJECTS_TBL SJ
        WHERE STT.SUB_ID=SJ.SUB_ID
        GROUP BY STT.STU_ID
    ) A, 
    (
        --학생들이 신청한 학점
        SELECT ST.STU_ID, ST.STU_NAME, SUM(SJ.SUB_CREDIT) AS TOTALCREDIT
        FROM STUDENTS_TBL ST, SUBJECTS_TBL SJ, STUDENTS_TIME_TBL STT
        WHERE ST.STU_ID=STT.STU_ID AND SJ.SUB_ID=STT.SUB_ID
        GROUP BY ST.STU_ID, ST.STU_NAME ORDER BY SUM(SJ.SUB_CREDIT) DESC
    ) B
    WHERE A.MAXCREDIT=B.TOTALCREDIT;
    
    --RANK() 이용
    SELECT B.STU_ID AS 학생ID,
        B.STU_NAME AS 이름,
        B.TOTALCREDIT AS 신청학점
    FROM 
    (
        SELECT ST.STU_ID, ST.STU_NAME, SUM(SJ.SUB_CREDIT) AS TOTALCREDIT,
            DENSE_RANK() OVER(ORDER BY SUM(SJ.SUB_CREDIT) DESC) AS RANKING
        FROM STUDENTS_TBL ST, SUBJECTS_TBL SJ, STUDENTS_TIME_TBL STT
        WHERE ST.STU_ID=STT.STU_ID AND SJ.SUB_ID=STT.SUB_ID
        GROUP BY ST.STU_ID, ST.STU_NAME ORDER BY SUM(SJ.SUB_CREDIT) DESC
    ) B
    WHERE B.RANKING=1;

--12. 가장많은 강의 시간을 가지고 있는 교수를 찾아주세요
--가장많은시간이 얼마인지 + 그만큼 강의하는 교수 전부 출력
--수강신청 없는 강의는 제외해야 함
    
    
    SELECT T1.PRO_ID, T1.PRO_NAME, SUM(T1.SUB_CREDIT) AS CSUM,
        DENSE_RANK() OVER(ORDER BY SUM(T1.SUB_CREDIT) DESC) AS CRANKING
    FROM
    (
        --과목&교수
        SELECT P.PRO_ID, P.PRO_NAME, SJ.SUB_ID, SJ.SUB_NAME, SJ.SUB_CREDIT
        FROM SUBJECTS_TBL SJ,
            PROFESSORS_TBL P
        WHERE SJ.PRO_ID(+)=P.PRO_ID
    ) T1, 
    (
        --수강신청 한 강의
        SELECT A.SUB_ID, A.SJCNT, A.PRO_ID
        FROM
        (
            SELECT SJ.SUB_ID,SJ.PRO_ID, COUNT(STT.SUB_ID) AS SJCNT
            FROM STUDENTS_TIME_TBL STT,
                SUBJECTS_TBL SJ
            WHERE STT.SUB_ID(+)=SJ.SUB_ID
            GROUP BY SJ.SUB_ID,SJ.PRO_ID
        ) A
        WHERE A.SJCNT>0
    ) T2
    WHERE T1.SUB_ID=T2.SUB_ID
    GROUP BY T1.PRO_ID, T1.PRO_NAME;


--13. 2018년 2월1일 부터 ~ 2월 28일까지 각 날짜별로 수강신청 현황을 보여주세요
    --날짜, 학생수, 수강신청수
    
    SELECT B.DATES AS 날짜,
        NVL(A.SCNT, 0) AS 학생수,
        NVL(C.RCNT, 0) AS 신청수
    FROM 
    (
            --날짜별 수강신청한 학생수
            SELECT A.REG_TIME, COUNT(A.STU_ID) AS SCNT
            FROM
            (
                SELECT STU_ID, REG_TIME
                FROM STUDENTS_TIME_TBL
                GROUP BY STU_ID, REG_TIME
            ) A
            GROUP BY A.REG_TIME
            ORDER BY A.REG_TIME
    ) A, 
    (
        --20180201~20180228까지 날짜 만들기
        SELECT TO_DATE('20180201','YYYYMMDD')+(LEVEL-1) AS DATES
        FROM DUAL
        CONNECT BY LEVEL<=(TO_DATE('20180228','YYYYMMDD')+1-TO_DATE('20180201','YYYYMMDD'))
    ) B,
    (
            --날짜별 수강신청수
            SELECT REG_TIME, COUNT(*) AS RCNT
            FROM STUDENTS_TIME_TBL
            GROUP BY REG_TIME
            ORDER BY REG_TIME
    ) C
    WHERE A.REG_TIME(+)=B.DATES AND C.REG_TIME(+)=B.DATES
    ORDER BY B.DATES
    ;


--14. 가장 수강신청이 많은 날짜를 찾아주세요
        
    SELECT A.REG_TIME AS 날짜,
        A.RCNT AS 수강신청수
    FROM 
    (
        --날짜별 수강신청수
        SELECT REG_TIME, COUNT(*) AS RCNT,
            DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS RANKING
        FROM STUDENTS_TIME_TBL
        GROUP BY REG_TIME
    ) A
    WHERE A.RANKING=1;

--15. 가장 수강신청이 많은 과목 해당과목 교수님을 찾아주세요
        
    SELECT P.PRO_ID AS 교수ID,
        P.PRO_NAME AS 교수명,
        A.SUB_ID AS 과목ID,
        A.SUB_NAME AS 과목명,
        A.SUBCNT AS 수강신청수
    FROM PROFESSORS_TBL P,
        (
            --과목별 수강신청 수
            SELECT SJ.SUB_ID, SJ.SUB_NAME, SJ.PRO_ID, COUNT(SJ.SUB_ID) AS SUBCNT,
                DENSE_RANK() OVER(ORDER BY COUNT(SJ.SUB_ID) DESC) AS SUBRANK
            FROM STUDENTS_TIME_TBL STT,
                SUBJECTS_TBL SJ
            WHERE STT.SUB_ID=SJ.SUB_ID
            GROUP BY SJ.SUB_ID, SJ.SUB_NAME, SJ.PRO_ID
        ) A
    WHERE P.PRO_ID=A.PRO_ID AND A.SUBRANK=1
    ;
        

--16. 학생이 한명도 없는 학과의 교수명단 리스트를 보여주세요

    SELECT A.SDEPT AS 학과,
        P.PRO_ID AS 교수ID,
        P.PRO_NAME AS 교수명,
        A.SNUM AS 학생수
    FROM PROFESSORS_TBL P,
    (
        --학과 학생수
        SELECT D.DEPT AS SDEPT,
            D.CID2 AS SDEPTID,
            COUNT(ST.STU_DEPT) AS SNUM
        FROM STUDENTS_TBL ST,
            (
                    --학과
                    SELECT 
                        DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                        T1.GRP_ID AS GID,
                        T1.COM_ID AS CID1,
                        T2.COM_ID AS CID2
                    FROM COMMONS_TBL T1, COMMONS_TBL T2
                    WHERE T1.COM_ID=T2.PARENT_ID
                        AND T1.GRP_ID='GRP002' 
                        AND T1.GRP_ID=T2.GRP_ID
                        AND T2.COM_LVL=2
            ) D
        WHERE ST.STU_DEPT_GRP(+)=D.GID AND ST.STU_DEPT(+)=D.CID2
        GROUP BY D.CID2, D.DEPT
    ) A
    WHERE P.PRO_DEPT=A.SDEPTID AND A.SNUM=0
    ORDER BY A.SDEPT ASC
    ;


--17. 각 학과별 학생들의 시험성적 평균과 합계를 보여주세요
    --중간/기말/전체

    --1학기 전체
    SELECT C.DEPT AS 학과,
        NVL(A.AVG1_1,0) AS AVG_SEM1_1,
        NVL(A.SUM1_1,0) AS SUM_SEM1_1,
        NVL(B.AVG1_2,0) AS AVG_SEM1_2,
        NVL(B.SUM1_2,0) AS SUM_SEM1_2
    FROM 
    (
        --1학기 중간
        SELECT D.CID2, D.DEPT,
            ROUND(AVG(NVL(SC.SCORE,0)),2) AS AVG1_1,
            SUM(NVL(SC.SCORE,0)) AS SUM1_1
        FROM STUDENTS_TBL ST,
            SCORES_TBL SC,
            (
                --학과
                SELECT 
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2
                FROM COMMONS_TBL T1, COMMONS_TBL T2
                WHERE T1.COM_ID=T2.PARENT_ID
                    AND T1.GRP_ID='GRP002' 
                    AND T1.GRP_ID=T2.GRP_ID
                    AND T2.COM_LVL=2
            ) D
        WHERE ST.STU_ID=SC.STU_ID(+)
            AND ST.STU_DEPT_GRP=D.GID AND ST.STU_DEPT=D.CID2
            AND SC.SEMESTER=1
            AND SC.GUBUN=1 
        GROUP BY D.CID2, D.DEPT
    ) A, 
    (
        --1학기 기말
        SELECT D.CID2, D.DEPT,
            ROUND(AVG(NVL(SC.SCORE,0)),2) AS AVG1_2,
            SUM(NVL(SC.SCORE,0)) AS SUM1_2
        FROM STUDENTS_TBL ST,
            SCORES_TBL SC,
            (
                --학과
                SELECT 
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2
                FROM COMMONS_TBL T1, COMMONS_TBL T2
                WHERE T1.COM_ID=T2.PARENT_ID
                    AND T1.GRP_ID='GRP002' 
                    AND T1.GRP_ID=T2.GRP_ID
                    AND T2.COM_LVL=2
            ) D
        WHERE ST.STU_ID=SC.STU_ID(+)
            AND ST.STU_DEPT_GRP=D.GID AND ST.STU_DEPT=D.CID2
            AND SC.SEMESTER=1
            AND SC.GUBUN=2
        GROUP BY D.CID2, D.DEPT
    ) B, 
    (
            --학과
            SELECT 
                DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                T1.GRP_ID AS GID,
                T1.COM_ID AS CID1,
                T2.COM_ID AS CID2
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.COM_ID=T2.PARENT_ID
                AND T1.GRP_ID='GRP002'
                AND T1.GRP_ID=T2.GRP_ID
                AND T2.COM_LVL=2
    ) C
    WHERE A.CID2(+)=C.CID2 AND B.CID2(+)=C.CID2
    ;
    
    --수강신청해놓고 시험 안본사람을 0점처리하면 어떻게 될지
        
    
        
--18. 전체 학생 성적리스트 
     -- 소속학과  학생명  평균   총점  신청학점  순위 순으로 보여주세요
    SELECT D.DEPT AS 학과,
        ST.STU_NAME AS 학생명,
        NVL(B.AVGSC,0) AS AVGSCORE,
        NVL(B.SUMSC,0) AS SUMSCORE,
        NVL(A.CREDIT,0) AS 신청학점,
        DENSE_RANK() OVER(ORDER BY NVL(B.AVGSC,0) DESC) AS RANKING
    FROM STUDENTS_TBL ST,
    (
        --학생 신청학점
        SELECT ST.STU_ID, SUM(SJ.SUB_CREDIT) AS CREDIT
        FROM STUDENTS_TBL ST,
            STUDENTS_TIME_TBL STT,
            SUBJECTS_TBL SJ
        WHERE ST.STU_ID=STT.STU_ID
            AND SJ.SUB_ID=STT.SUB_ID
        GROUP BY ST.STU_ID, ST.STU_NAME
    ) A,
    (
        --점수
        SELECT ST.STU_ID, 
            ROUND(AVG(SC.SCORE),2) AS AVGSC,
            SUM(SC.SCORE) AS SUMSC
        FROM STUDENTS_TBL ST,
            SCORES_TBL SC
        WHERE ST.STU_ID=SC.STU_ID
        GROUP BY ST.STU_ID
    ) B,
    (
        --학과
        SELECT 
            DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
            T1.GRP_ID AS GID,
            T1.COM_ID AS CID1,
            T2.COM_ID AS CID2
        FROM COMMONS_TBL T1, COMMONS_TBL T2
        WHERE T1.COM_ID=T2.PARENT_ID
            AND T1.GRP_ID='GRP002'
            AND T1.GRP_ID=T2.GRP_ID
            AND T2.COM_LVL=2
    ) D
    WHERE ST.STU_ID=A.STU_ID(+) AND ST.STU_ID=B.STU_ID(+)
        AND ST.STU_DEPT_GRP=D.GID AND ST.STU_DEPT=D.CID2
    ;
    

--19. 출제한 교수 별 시험결과
    -- 소속학과  교수명  평균    총점
    
    --시험친사람만
    SELECT D.CID2 AS 학과ID,
        D.DEPT AS 소속학과,
        P.PRO_ID AS 교수ID,
        P.PRO_NAME AS 교수명,
        ROUND(AVG(SC.SCORE),2) AS 평균,
        SUM(SC.SCORE) AS 총점
    FROM PROFESSORS_TBL P,
        SUBJECTS_TBL SJ,
        SCORES_TBL SC,
            (
                --학과
                SELECT 
                    DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
                    T1.GRP_ID AS GID,
                    T1.COM_ID AS CID1,
                    T2.COM_ID AS CID2
                FROM COMMONS_TBL T1, COMMONS_TBL T2
                WHERE T1.COM_ID=T2.PARENT_ID
                    AND T1.GRP_ID='GRP002' 
                    AND T1.GRP_ID=T2.GRP_ID
                    AND T2.COM_LVL=2
            ) D
    WHERE P.PRO_ID=SJ.PRO_ID
        AND SJ.SUB_ID=SC.SUB_ID
        AND P.PRO_DEPT_GRP=D.GID
        AND P.PRO_DEPT=D.CID2
    GROUP BY D.CID2, D.DEPT, P.PRO_ID, P.PRO_NAME
    ORDER BY D.CID2 ASC
    ;
    
    --수강신청했는데 시험 안친 사람 체크하기(0점)
    

    
--20. 다음과 같은 룰로 학생들의 총 학점을 구해주세요
/*
    90점 이상                  :  A     -  4.5
    80점 이상 90점미만       :  B     -  3.5
    70점 이상 80점미만       :  C     -  2.5
    60점 이상 70점미만       :  D     -  1.5
    60점 미만                  :  F     -  1.0
    
    소속학과   학생명    총신청학점      총점    평균     학점     순위
*/

--검색해서 찾음(CASE)
--학기, 중간/기말 구분 생각하지 않음
--CREDIT에 따른 반영 비율 생각하지 않음

    SELECT D.DEPT AS 학과,
        ST.STU_NAME AS 학생명,
        A.CREDIT AS 신청학점,
        NVL(SUM(B.SCORE),0) AS 총점,
        NVL(ROUND(AVG(B.SCORE),2),0) AS 평균,
        NVL(ROUND(AVG(B.GRADE_NUM),2),0) AS 평점,
        DENSE_RANK() OVER(ORDER BY NVL(ROUND(AVG(B.GRADE_NUM),2),0) DESC) AS RANKING
    FROM STUDENTS_TBL ST,
    (
        --학생 신청학점
        SELECT ST.STU_ID, SUM(SJ.SUB_CREDIT) AS CREDIT
        FROM STUDENTS_TBL ST,
            STUDENTS_TIME_TBL STT,
            SUBJECTS_TBL SJ
        WHERE ST.STU_ID=STT.STU_ID
            AND SJ.SUB_ID=STT.SUB_ID
        GROUP BY ST.STU_ID, ST.STU_NAME
    ) A,
    (
        --학생 모든점수 & 학점
        SELECT ST.STU_ID, SC.SUB_ID, SC.SCORE,
            CASE WHEN SC.SCORE>=90 THEN 4.5
                 WHEN SC.SCORE>=80 THEN 3.5
                 WHEN SC.SCORE>=70 THEN 2.5
                 WHEN SC.SCORE>=60 THEN 1.5
                 WHEN SC.SCORE<60 THEN 1.0
            END AS GRADE_NUM
        FROM STUDENTS_TBL ST,
            SCORES_TBL SC
        WHERE ST.STU_ID=SC.STU_ID(+)
    ) B,
    (
        --학과
        SELECT 
            DECODE(T1.COM_VAL,'ROOT','',T1.COM_VAL)||' '||T2.COM_VAL AS DEPT,
            T1.GRP_ID AS GID,
            T1.COM_ID AS CID1,
            T2.COM_ID AS CID2
        FROM COMMONS_TBL T1, COMMONS_TBL T2
        WHERE T1.COM_ID=T2.PARENT_ID
            AND T1.GRP_ID='GRP002' 
            AND T1.GRP_ID=T2.GRP_ID
            AND T2.COM_LVL=2
    ) D
    WHERE ST.STU_ID=A.STU_ID(+) AND ST.STU_ID=B.STU_ID(+)
        AND ST.STU_DEPT_GRP=D.GID AND ST.STU_DEPT=D.CID2
    GROUP BY D.CID2, D.DEPT, ST.STU_ID, ST.STU_NAME, A.CREDIT
    ;











