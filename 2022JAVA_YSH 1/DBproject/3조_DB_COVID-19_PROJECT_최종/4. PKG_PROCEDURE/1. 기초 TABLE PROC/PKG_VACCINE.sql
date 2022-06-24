create or replace NONEDITIONABLE PACKAGE PKG_VACCINE AS 

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 최문준
-- 업무설명 : VACCINE_TBL CRUD

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    
*/
------------------------------------------

-- CREATE    
PROCEDURE PROC_INS_VACCINE
    (
          IN_VAC_NAME_GRP   IN VARCHAR2
        , IN_VAC_NAME       IN VARCHAR2
        , IN_VAC_DOSE       IN VARCHAR2
        , IN_VAC_TEMP       IN VARCHAR2 
        , O_ERRCODE          OUT VARCHAR2
        , O_ERRMSG           OUT VARCHAR2
    );
    
-- SELECT    
PROCEDURE PROC_SEL_VACCINE
    (
   
          IN_VAC_NAME_GRP       IN VARCHAR2
        , IN_VAC_NAME           IN VARCHAR2
        , IN_VAC_DOSE           IN VARCHAR2
        , IN_VAC_TEMP           IN VARCHAR2
        , O_CURSOR          OUT     SYS_REFCURSOR
        , O_ERRCODE     OUT VARCHAR2
        , O_ERRMSG      OUT VARCHAR2
    );
    
-- UPDATE    
PROCEDURE PROC_UP_VACCINE
    (
          IN_VAC_NAME_GRP    IN CHAR
        , IN_VAC_NAME        IN CHAR
        , IN_VAC_DOSE       IN NUMBER
        , IN_VAC_TEMP       IN NUMBER 
        , O_ERRCODE             OUT     VARCHAR2,
        O_ERRMSG                OUT     VARCHAR2 
    
    );
    
-- DELETE
PROCEDURE PROC_DEL_VACCINE
    (
        IN_VAC_DOSE       IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) ;

END PKG_VACCINE;