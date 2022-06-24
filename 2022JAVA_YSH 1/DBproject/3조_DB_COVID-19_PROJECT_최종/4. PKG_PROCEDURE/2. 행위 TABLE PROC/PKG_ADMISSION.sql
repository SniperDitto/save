create or replace NONEDITIONABLE PACKAGE PKG_ADMISSION AS 

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 정성균
-- 업무설명 : ADMISSION_TBL CRUD, 입원 환자 리스트  

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

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