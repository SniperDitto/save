create or replace NONEDITIONABLE PACKAGE PKG_RESERVATION AS 

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 정성균
-- 업무설명 : RESERVATION_TBL CRUD, 접종 희망자 병원별 예약 목록

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

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

END PKG_RESERVATION;