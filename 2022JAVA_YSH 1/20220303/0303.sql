





    SELECT COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID
    FROM COMMONS_TBL
    WHERE COM_VAL LIKE '%%'
        AND COM_ID LIKE '%%'
        AND COM_LVL LIKE '%%'
    START WITH PARENT_ID='ROOT' 
        AND GRP_ID='GRP002'
    CONNECT BY PRIOR COM_ID=PARENT_ID 
        AND GRP_ID='GRP002'
    ;


    --삭제할 때는 해당 COM_ID를 PARENT로 갖는 데이터들도 같이 삭제해야 한다
    DELETE FROM COMMONS_TBL
    WHERE GRP_ID='GRP002'
        AND COM_ID='COM0015'
        ;
        
    --COM_ID와 그에 딸린 자식 데이터들을 선택할 수 있는 방법?
    SELECT COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID
    FROM COMMONS_TBL
    WHERE COM_VAL LIKE '%%'
        AND COM_ID LIKE '%%'
        AND COM_LVL LIKE '%%'
    START WITH COM_ID='ROOT' 
        AND GRP_ID='GRP002'
    CONNECT BY PRIOR COM_ID=PARENT_ID 
        AND GRP_ID='GRP002'
    ;


---------------------------------------------
    --점수 CRUD
    
    SELECT * FROM SCORES_TBL;
    
    --단과대학목록
    SELECT COM_ID, GRP_ID, COM_VAL
    FROM COMMONS_TBL
    WHERE GRP_ID='GRP002'
        AND COM_LVL=1
    ORDER BY COM_VAL ASC
    ;
    --해당 단과대 소속 학과
    SELECT COM_ID, GRP_ID, COM_VAL
    FROM COMMONS_TBL
    WHERE GRP_ID='GRP002'
        AND COM_LVL=2
        AND PARENT_ID='COM0002'
    ORDER BY COM_VAL ASC
    ;
    
    
    --과목선택
    SELECT SUD_ID, SUB_NAME
    FROM SUBJECTS_TBL
    WHERE DEPT_GRP=IN_GRP_ID
        AND DEPT_CODE=IN_COM_ID
    ;
    
    
    SELECT T3.STU_ID, T3.STU_NAME, T2.SCORE, TO_CHAR(T2.EXAM_DATE, 'YYYY-MM-DD') AS EXAM_DATE
    FROM SUBJECTS_TBL T1, SCORES_TBL T2, STUDENTS_TBL T3
    WHERE T1.SUB_ID=T2.SUB_ID
        AND T1.DO_YEAR=T2.DO_YEAR
        AND T1.SEMESTER=T2.SEMESTER
        AND T2.STU_ID=T3.STU_ID
        AND T2.DO_YEAR=IN_DO_YEAR
        AND T2.SEMESTER=IN_SEMESTER
        AND T2.GUBUN=IN_GBN
        AND T1.DEPT_GRP=IN_GRP_ID
        AND T1.DEPT=IN_COM_ID
        AND T1.SUB_UD=IN_SUB_ID
    ;
    
    
    
    
    
    --수강신청 X 1&2학기 모두 친 걸로 가정한 TABLE
    SELECT A.STU_ID, A.STU_NAME, A.SUB_ID, A.SUB_NAME, A.DO_YEAR, A.SEMESTER, C.GUBUN, NVL(B.SCORE,0) AS SCORE
    FROM
    (
        --학생들이 수강신청한 과목
        SELECT T1.STU_ID, T1.STU_NAME,
            T3.SUB_ID, T3.SUB_NAME, T3.DO_YEAR, T3.SEMESTER

        FROM STUDENTS_TBL T1, STUDENTS_TIME_TBL T2, SUBJECTS_TBL T3
        WHERE T1.STU_ID=T2.STU_ID
            AND T2.SUB_ID=T3.SUB_ID
            AND T2.DO_YEAR=T3.DO_YEAR
            AND T2.SEMESTER=T3.SEMESTER
            AND T1.STU_DEPT_GRP=T4.GRP_ID
            AND T1.STU_DEPT=T4.COM_ID
            
    ) A, 
    (
        --중간/기말
        SELECT GUBUN
        FROM SCORES_TBL
        GROUP BY GUBUN
    ) C, SCORES_TBL B
    WHERE A.STU_ID=B.STU_ID(+)
        AND A.SUB_ID=B.SUB_ID(+)
        AND A.DO_YEAR=B.DO_YEAR(+)
        AND A.SEMESTER=B.SEMESTER(+)

    ;--958개
    
    
    --학생ID, 이름, 총점, 평균, 순위
    SELECT A.STU_ID, A.STU_NAME,
        --학과별 그룹 아님을 의미(학생별 학과별 X)
        MAX(A.COM_ID) AS COM_ID, MAX(A.COM_VAL) AS COM_VAL,
        SUM(NVL(B.SCORE,0)) AS TOTALSCORE,
        ROUND(AVG(NVL(B.SCORE,0))) AS AVG,
        RANK() OVER(ORDER BY AVG(NVL(B.SCORE,0)) DESC) AS RANKING
    FROM
    (
        --학생들이 수강신청한 과목
        SELECT T1.STU_ID, T1.STU_NAME,
            T3.SUB_ID, T3.SUB_NAME, T3.DO_YEAR, T3.SEMESTER,
            T4.GRP_ID, T4.COM_ID, T4.COM_VAL
        FROM STUDENTS_TBL T1, STUDENTS_TIME_TBL T2, SUBJECTS_TBL T3, COMMONS_TBL T4
        WHERE T1.STU_ID=T2.STU_ID
            AND T2.SUB_ID=T3.SUB_ID
            AND T2.DO_YEAR=T3.DO_YEAR
            AND T2.SEMESTER=T3.SEMESTER
    ) A, 
    (
        --중간/기말
        SELECT GUBUN
        FROM SCORES_TBL
        GROUP BY GUBUN
    ) C, SCORES_TBL B
    WHERE A.STU_ID=B.STU_ID(+)
        AND A.SUB_ID=B.SUB_ID(+)
        AND A.DO_YEAR=B.DO_YEAR(+)
        AND A.SEMESTER=B.SEMESTER(+)
        AND C.GUBUN=B.GUBUN(+)
        AND C.GUBUN=B.GUBUN(+)
        AND C.GUBUN LIKE '%'||:IN_GUBUN||'%' --학기선택
    GROUP BY A.STU_ID,A.STU_NAME
    ;


