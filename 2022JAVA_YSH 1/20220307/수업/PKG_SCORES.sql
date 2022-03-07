create or replace NONEDITIONABLE PACKAGE PKG_SCORES AS 

    --점수로 학점을 가져오는 함수
    FUNCTION FUNC_GET_GRADE(
        IN_SCORE            IN      NUMBER
    )
    RETURN VARCHAR2;

    --학점 만드는 함수
    FUNCTION FUNC_GET_AVERAGE(
        IN_STU_ID           IN      VARCHAR2,
        IN_DO_YEAR          IN      VARCHAR2,
        IN_SEMESTER         IN      VARCHAR2
    )
    RETURN NUMBER;



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
    );
    
    
    --선택된 학과에대한 과목 SELECT
    PROCEDURE PROC_SEL_SUBJECTS
    (
        IN_GRP_ID       IN      VARCHAR2,
        IN_COM_ID       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR
    );
    
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
    );
    

END PKG_SCORES;