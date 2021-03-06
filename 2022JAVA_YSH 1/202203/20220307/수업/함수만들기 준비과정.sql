SELECT 'STU' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID), 'STU000'), 4, 3)) + 1, 'FM000')
FROM STUDENTS_TBL
;

SELECT 'GRP' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(GRP_ID), 'GRP000'), 4, 3) + 1), 'FM000')
FROM GRPCOMMONS_TBL
;

SELECT 'COM' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(COMMON_ID), 'COM0000'), 4, 4)) + 1, 'FM0000')
FROM COMMONS_TBL
;

SELECT 'STU' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID), 'STU000'), 4, 3)) + 1, 'FM000')
FROM STUDENTS_TBL
;
SELECT 'STU' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX('STU_ID'), 'STU000'), '4', '3')) + 1, 'FM000') 
FROM STUDENTS_TBL
;

SELECT 'STU'TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID), 'STU000'), '4', '3')) + 1, 'FM000') FROM STUDENTS_TBL;


SELECT STU|| TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID), STU000), '4', '3')) + 1, 'FM000') FROM STUDENTS_TBL
;

SELECT 'STU'|| TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID), STU000), '4', '3')) + 1, 'FM000') FROM STUDENTS_TBL;

SELECT '''' || 'ADFASD' || ''''
FROM DUAL;

SELECT 'STU'|| TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID), 'STU000'), '4', '3')) + 1, 'FM000') FROM STUDENTS_TBL
;

SELECT 'COM'|| TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(COM_ID), 'COM0000'), 4, 4)) + 1, 'FM0000') FROM COMMONS_TBL
;

SELECT 'COM'|| TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(COM_ID), 'COM0000'), 4, 4)) + 1, 'FM0000') FROM COMMONS_TBL WHERE GRP_ID='GRP001'
;

SELECT * FROM STUDENTS_TIME_TBL
;

SELECT GUBUN
FROM SCORES_TBL
WHERE DO_YEAR = '2018' AND SEMESTER = '1'
GROUP BY GUBUN
;

SELECT * FROM SCORES_TBL
;

SELECT * FROM STUDENTS_TIME_TBL
;
--학생, 학과, 년도, 학기, ---> 수강신청결과 
SELECT A.STU_ID, A.STU_NAME, A.COM_ID, A.COM_VAL, A.DO_YEAR, A.SEMESTER, C.SCORE
FROM
(
    SELECT T1.STU_ID, T1.STU_NAME, T2.COM_ID, T2.COM_VAL, T3.DO_YEAR, T3.SEMESTER, T4.SUB_ID, T4.SUB_NAME
    FROM STUDENTS_TBL T1, COMMONS_TBL T2, STUDENTS_TIME_TBL T3, SUBJECTS_TBL T4
    WHERE T1.STU_DEPT_GRP = T2.GRP_ID
    AND T1.STU_DEPT = T2. COM_ID
    AND T1.STU_ID = T3.STU_ID
    AND T3.SUB_ID = T4.SUB_ID
    AND T3.DO_YEAR = '2018' AND T3.SEMESTER = '1'
) A
,
(
    SELECT GUBUN
    FROM SCORES_TBL
    WHERE DO_YEAR = '2018' AND SEMESTER = '1'
    GROUP BY GUBUN
) B
,SCORES_TBL C
WHERE A.STU_ID = C.STU_ID(+)  AND  A.SUB_ID = C.SUB_ID(+) AND B.GUBUN = C.GUBUN(+)
AND B.GUBUN = '1' --중간고사
;
