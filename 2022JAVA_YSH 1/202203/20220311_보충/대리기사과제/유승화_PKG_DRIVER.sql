create or replace NONEDITIONABLE PACKAGE PKG_DRIVER AS 

    --운전기사추가
    PROCEDURE PROC_INS_DRIVER
    (
        IN_DR_NAME  IN  VARCHAR2
        ,IN_DR_TEL  IN  VARCHAR2
        ,IN_DR_GENDER   IN  VARCHAR2
    );
    
    --포인트계산
    PROCEDURE PROC_UP_POINTS
    (
        IN_R_TEL   IN  VARCHAR2
        ,IN_R_ID    IN  VARCHAR2
        --예외
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );
    
    --회원번호추가
    PROCEDURE PROC_INS_MEMBER
    (
        IN_R_TEL    IN  VARCHAR2
        --예외
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );
    
    --요일별매출
    PROCEDURE PROC_SEL_DAY_SALES
    (
        O_CUR   OUT SYS_REFCURSOR
    );
    
    --회사/기사 번 돈
    PROCEDURE PROC_SEL_MONEY
    (
        O_CUR   OUT SYS_REFCURSOR
    );

END PKG_DRIVER;