create or replace NONEDITIONABLE PACKAGE PKG_ADMISSION AS 

PROCEDURE PROC_INS_ADMISSION
    (
        IN_PER_ID	    IN      VARCHAR2,				-- 사람ID
        IN_TRE_ID	    IN      VARCHAR2,				-- 진료ID
        IN_ADM_DATE	    IN      VARCHAR2,				-- 입원일
        O_ERRCODE       OUT     VARCHAR2,
        O_ERRMSG        OUT     VARCHAR2
    );
    
    PROCEDURE PROC_SEL_ADMISSION
    (
        IN_ADM_ID       IN      VARCHAR2,
        IN_PER_ID       IN      VARCHAR2,
        IN_TRE_ID       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR,
        O_ERRCODE       OUT     VARCHAR2,
        O_ERRMSG        OUT     VARCHAR2
    );
    
    PROCEDURE PROC_UP_ADMISSION
    (
        IN_ADM_ID       IN      VARCHAR2,
        IN_PER_ID	    IN      VARCHAR2,				-- 사람ID
        IN_TRE_ID	    IN      VARCHAR2,				-- 진료ID
        IN_ADM_DATE	    IN      VARCHAR2,				-- 입원일
        O_ERRCODE       OUT     VARCHAR2,
        O_ERRMSG        OUT     VARCHAR2
    );
    
    PROCEDURE PROC_DEL_ADMISSION
    (
        IN_ADM_ID       IN      VARCHAR2,
        O_ERRCODE       OUT     VARCHAR2,
        O_ERRMSG        OUT     VARCHAR2
    );

END PKG_ADMISSION;