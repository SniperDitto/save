create or replace NONEDITIONABLE PACKAGE BODY PKG_SCORES AS

    --점수로 학점을 가져오는 함수
    --PKG_SCORES.FUNC_GET_GRADE()
    FUNCTION FUNC_GET_GRADE(
        IN_SCORE            IN      NUMBER
    )
    RETURN VARCHAR2
    AS
    
        V_RESULT            VARCHAR2(3);
    
    BEGIN
        
        SELECT EXP_VAL1 
        INTO V_RESULT
        FROM COMMONS_TBL
        WHERE GRP_ID = 'GRP004'
        AND COM_LVL = 1
        AND EXP_VAL3 > IN_SCORE AND EXP_VAL2 <= IN_SCORE
        ;
        
        RETURN V_RESULT
        ;
        
    END FUNC_GET_GRADE
    ;

    --PKG_SCORES.FUNC_GET_AVERAGE
    --학점 만드는 함수
    FUNCTION FUNC_GET_AVERAGE(
        IN_STU_ID           IN      VARCHAR2,
        IN_DO_YEAR          IN      VARCHAR2,
        IN_SEMESTER         IN      VARCHAR2
    )
    RETURN NUMBER
    AS
        V_RESULT            NUMBER(10, 2);
    BEGIN
        
        SELECT ROUND(SUM(TLT_GRADE_POINT) / SUM(SUB_CREDIT),2) AS YOUR_GRADE
        INTO V_RESULT
        FROM
        (
            SELECT SUB_ID, SCORE, SUB_CREDIT 
                   ,PKG_SCORES.FUNC_GET_GRADE(NVL(SCORE, 0)) AS GRADE_POINT
                   ,SUB_CREDIT * PKG_SCORES.FUNC_GET_GRADE(NVL(SCORE, 0)) AS TLT_GRADE_POINT
            FROM
            (
                SELECT D.SUB_ID, AVG(D.SCORE) AS SCORE, MAX(D.SUB_CREDIT) AS SUB_CREDIT
                FROM
                (
                    SELECT A.STU_ID, A.DO_YEAR, A.SEMESTER, A.SUB_ID, A.SUB_CREDIT, NVL(C.SCORE, 0) AS SCORE, B.GUBUN
                           --,PKG_SCORES.FUNC_GET_GRADE(NVL(C.SCORE, 0)) AS GRADE_POINT
                           --,A.SUB_CREDIT * PKG_SCORES.FUNC_GET_GRADE(NVL(C.SCORE, 0)) AS TLT_GRADE_POINT
                    FROM
                    (
                        SELECT T1.STU_ID, T2.SUB_ID, T2.SUB_CREDIT, T1.DO_YEAR, T1.SEMESTER
                        FROM STUDENTS_TIME_TBL T1, SUBJECTS_TBL T2
                        WHERE T1.SUB_ID = T2.SUB_ID AND T1.STU_ID = IN_STU_ID
                        AND T1.DO_YEAR = IN_DO_YEAR AND T1.SEMESTER = IN_SEMESTER
                    ) A
                    ,
                    ( SELECT GUBUN FROM SCORES_TBL WHERE DO_YEAR = IN_DO_YEAR AND SEMESTER = IN_SEMESTER GROUP BY GUBUN  ) B
                    , SCORES_TBL C
                    WHERE A.STU_ID = C.STU_ID(+) AND A.SUB_ID = C.SUB_ID(+) AND B.GUBUN = C.GUBUN(+)
                ) D
                GROUP BY D.SUB_ID
            )
        )
        ;
        
        RETURN V_RESULT;
        
    END FUNC_GET_AVERAGE;



  --SCORES_TBL  INSERT
  PROCEDURE PROC_INS_SCORES
    (
        IN_STU_ID           IN      VARCHAR2,
        IN_SUB_ID           IN      VARCHAR2,
        IN_YEAR             IN      VARCHAR2,
        IN_SEMESTER         IN      VARCHAR2,
        IN_GBN              IN      VARCHAR2,
        IN_SCORE            IN      VARCHAR2,
        IN_DATE             IN      VARCHAR2
    ) AS
  BEGIN
    
    INSERT INTO SCORES_TBL
    (
        STU_ID
        ,SUB_ID
        ,DO_YEAR
        ,SEMESTER
        ,GUBUN
        ,SCORE
        ,EXAM_DATE
    )
    VALUES
    (
         IN_STU_ID
        ,IN_SUB_ID
        ,IN_YEAR
        ,IN_SEMESTER
        ,IN_GBN
        ,IN_SCORE
        ,TO_DATE(IN_DATE, 'YYYY-MM-DD')
    )
    ;
    
  END PROC_INS_SCORES;
  
    --선택된 학과에대한 과목 SELECT
    PROCEDURE PROC_SEL_SUBJECTS
    (
        IN_GRP_ID       IN   VARCHAR2,
        IN_COM_ID       IN   VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR
    )
    AS
    BEGIN
    
        OPEN O_CUR FOR
        SELECT SUB_ID, SUB_NAME FROM SUBJECTS_TBL
        WHERE DEPT_GRP = IN_GRP_ID AND DEPT_CODE = IN_COM_ID
        ;
        
    END PROC_SEL_SUBJECTS;
    
    
        --성적등록 페이지 리스트
    PROCEDURE PROC_SEL_INS_SCORE
    (
        IN_DO_YEAR      IN      VARCHAR2,
        IN_SEMESTER     IN      VARCHAR2,
        IN_GUBUN        IN      VARCHAR2,
        IN_GRP_ID       IN      VARCHAR2,
        IN_COM_ID       IN      VARCHAR2,
        IN_SUB_ID       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR
    )
    AS
    BEGIN
    
        OPEN O_CUR FOR
        SELECT T3.STU_ID, T3.STU_NAME, T2.SCORE, TO_CHAR(T2.EXAM_DATE, 'YYYY-MM-DD') AS EXAM_DATE
        FROM SUBJECTS_TBL T1, SCORES_TBL T2, STUDENTS_TBL T3
        WHERE T1.SUB_ID = T2.SUB_ID AND T1.DO_YEAR = T2.DO_YEAR AND T1.SEMESTER = T2.SEMESTER
        AND T2.STU_ID = T3.STU_ID
        AND T2.DO_YEAR = IN_DO_YEAR
        AND T2.SEMESTER = IN_SEMESTER
        AND T2.GUBUN = IN_GUBUN
        AND T1.DEPT_GRP = IN_GRP_ID
        AND T1.DEPT_CODE = IN_COM_ID
        AND T1.SUB_ID = IN_SUB_ID
        ORDER BY STU_NAME ASC
        ;
    
    END PROC_SEL_INS_SCORE;
    
    

END PKG_SCORES;