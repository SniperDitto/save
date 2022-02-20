
--INLINE VIEW
--1회용 VIEW
--FROM절에 VIEW의 서브쿼리 부분을 바로 적어 한 번만 임시로 사용
--WHERE절에 사용되는 서브쿼리와 다름


--다중컬럼 서브쿼리 이용 시
--학생들의 최고점수
SELECT *
FROM STUDENTS ST,
     SCORES SC
WHERE (ST.SID, SC.SCORE) 
    IN (
        SELECT SID, MAX(SCORE)
        FROM SCORES
        GROUP BY SID
    )
    AND ST.SID=SC.SID;

--각 그룹별(학과별)비교 불가능


-- 인라인 뷰 이용
-- 지역별 최고점수
SELECT MAX(M1)
FROM(
    SELECT ST.SADDR ,MAX(MAXSCORE) AS M1
    FROM STUDENTS ST,(
        SELECT SC.SID, ST.SADDR, MAX(SCORE) AS MAXSCORE
        FROM SCORES SC, STUDENTS ST
        WHERE SC.SID=ST.SID
        GROUP BY SC.SID, ST.SADDR
    ) A
    WHERE ST.SID=A.SID
    GROUP BY ST.SADDR
) X
;














