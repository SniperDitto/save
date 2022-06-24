create or replace NONEDITIONABLE PACKAGE PKG_INJECTION AS 

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 유승화
-- 업무설명 : INJECTION_TBL CRUD, 백신 접종 리스트(차수값 표시)  

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

--INSERT
    PROCEDURE PROC_INS_INJECTION
    (
        IN_RES_ID   IN VARCHAR2
        ,IN_INJ_DATE     IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--SELECT
    PROCEDURE PROC_SEL_INJECTION
    (
        IN_RES_ID   IN VARCHAR2
        ,IN_PER_NAME    IN  VARCHAR2
        ,IN_PER_ID      IN  VARCHAR2
        ,IN_HOS_NAME    IN  VARCHAR2
        ,IN_VAC_NAME    IN  VARCHAR2
        ,IN_INJ_CNT     IN  VARCHAR2
        ,O_CUR   OUT SYS_REFCURSOR
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--UPDATE
    PROCEDURE PROC_UP_INJECTION
    (
        IN_RES_ID   IN VARCHAR2
        ,IN_INJ_DATE    IN VARCHAR2
        ,IN_INJ_CNT     IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--DELETE
    PROCEDURE PROC_DEL_INJECTION
    (
        IN_RES_ID   IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

END PKG_INJECTION;