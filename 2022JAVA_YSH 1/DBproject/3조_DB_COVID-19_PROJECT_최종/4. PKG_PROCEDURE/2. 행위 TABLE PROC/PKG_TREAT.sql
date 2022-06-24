create or replace NONEDITIONABLE PACKAGE PKG_TREAT AS 

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 원재경
-- 업무설명 : TREAT_TBL CRUD, 진료 환자 리스트(병원 내원환자에 대한 진료 목록)  

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

PROCEDURE PROC_INS_TREAT
    (
        IN_PAT_ID           IN      VARCHAR2
        , IN_PER_ID         IN      VARCHAR2
        , IN_DOC_ID         IN      VARCHAR2
        , IN_TRE_PAY        IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    );
    
    PROCEDURE PROC_SEL_TREAT
    (
         IN_TRE_ID           IN      VARCHAR2
        , IN_PAT_ID         IN      VARCHAR2
        , IN_PER_ID         IN      VARCHAR2
        , IN_DOC_ID         IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
        , O_CURSOR          OUT     SYS_REFCURSOR 
    );
    
    PROCEDURE PROC_UP_TREAT
    (
        IN_TRE_ID           IN      VARCHAR2
        , IN_PAT_ID         IN      VARCHAR2
        , IN_PER_ID         IN      VARCHAR2
        , IN_DOC_ID         IN      VARCHAR2
        , IN_TRE_DATE       IN      VARCHAR2
        , IN_TRE_PAY        IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    );
    
    PROCEDURE PROC_DEL_TREAT
    (
        IN_TRE_ID           IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    );

END PKG_TREAT;