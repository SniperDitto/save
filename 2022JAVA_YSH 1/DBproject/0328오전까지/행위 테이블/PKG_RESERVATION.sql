create or replace PACKAGE PKG_CORONA_RESERVATION AS 

    PROCEDURE PROC_INS_RESERVATION -- 예약 입력
    (
        IN_PER_ID	    IN  VARCHAR2,			-- 사람 ID
        IN_HOS_ID	    IN  VARCHAR2,			-- 병원 ID
        IN_VAC_ID	    IN  VARCHAR2,			-- 백신 ID
        IN_RES_DATE	    IN  DATE,				-- 예약일
        O_ERRCODE       OUT VARCHAR2,
        O_ERRMSG        OUT VARCHAR2
    );

    PROCEDURE PROC_SEL_RESERVATION
    (
        IN_RES_ID       IN      VARCHAR2,
        IN_PER_ID       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR,
        O_ERRCODE       OUT VARCHAR2,
        O_ERRMSG        OUT VARCHAR2
    );
    
    PROCEDURE PROC_UP_RESERVATION
    (
        IN_RES_ID       IN  VARCHAR2,           -- 예약 ID
        IN_PER_ID	    IN  VARCHAR2,			-- 사람 ID
        IN_HOS_ID	    IN  VARCHAR2,			-- 병원 ID
        IN_VAC_ID	    IN  VARCHAR2,			-- 백신 ID
        IN_RES_DATE	    IN  DATE,				-- 예약일
        O_ERRCODE       OUT VARCHAR2,
        O_ERRMSG        OUT VARCHAR2
    );
    
    PROCEDURE PROC_DEL_RESERVATION
    (
        IN_RES_ID       IN  VARCHAR2,
        O_ERRCODE       OUT VARCHAR2,
        O_ERRMSG        OUT VARCHAR2
    );

END PKG_CORONA_RESERVATION;