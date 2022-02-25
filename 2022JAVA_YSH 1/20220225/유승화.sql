
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

    --학생&주소------------
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
        ORDER BY ST.STU_ID ASC
        ;
        
    --학생&학과---------
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
        ORDER BY ST.STU_ID ASC
        ;
        
    --학생리스트--------------------------------------
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
    
    --교수&주소----------------
    SELECT *
    FROM PROFESSORS_TBL P,
    (
        
    ) C
    WHERE P.PRO_ADDR_GRP=C.GID AND P.PRO_ADDR2=C.CID1
        AND P.PRO_ADDR=C.CID2 OR P.PRO_ADDR=C.CID3 OR P.PRO_ADDR=C.CID4
        
    
    --교수&학과----------------
    
    --교수리스트-------------------------------------

--3. 과목리스트
-- 등록년도   등록학기   해당학과   과목    학점


--4. 학과별 과목리스트
-- 학과아이디, 학과명,   해당과목아이디, 해당과목,  학점



--5.1 학생별 신청과목 리스트
--학생아이디  학생이름  소속학과  신청과목아이디  신청과목  학점

--5.2 각 학생별 총신청 학점 : 학생이름 학과 학점





--6. 교수별 강의 리스트
-- 교수아이디    교수명    소속학과    강의과목아이디    과목명



--7. 각 학과별 학생숫자
--학과명    학생수



--8. 각 학과별 교수숫자
--학과명    교수수





--9. 각 학과별 학생숫자 , 소속교수숫자
--학과명    학생수,   교수수



--10. 각 지역별 학생숫자 , 소속교수숫자,
--지역명    학생수,   교수수



--11. 가장많은 학점을 듣고 있는 학생을 찾아주세요 : DENSE_RANK() OVER()
-- 여러명일수도 있어요
    --가장많은학점이 얼마인지 + 그만큼 듣는 학생 전부 출력



--12. 가장많은 강의 시간을 가지고 있는 교수를 찾아주세요
--가장많은시간이 얼마인지 + 그만큼 강의하는 교수 전부 출력
--수강신청 없는 강의는 제외해야 함



--13. 2018년 2월1일 부터 ~ 2월 28일까지 각 날짜별로 수강신청 현황을 보여주세요
    --날짜, 학생수, 수강신청수



--14. 가장 수강신청이 많은 날짜를 찾아주세요


--15. 가장 수강신청이 많은 과목 해당과목 교수님을 찾아주세요


--16. 학생이 한명도 없는 학과의 교수명단 리스트를 보여주세요


--17. 각 학과별 학생들의 시험성적 평균과 합계를 보여주세요
    --중간/기말/전체

--18. 전체 학생 성적리스트 
     -- 소속학과  학생명  평균   총점  신청학점  순위 순으로 보여주세요


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















