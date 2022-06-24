create or replace NONEDITIONABLE PACKAGE PKG_PERSON AS 

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 유승화
-- 업무설명 : PERSON_TBL CRUD

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    
*/
------------------------------------------

    --INSERT
    PROCEDURE PROC_INS_PERSON
    (
        IN_PER_ID           IN  VARCHAR2
        ,IN_PER_NAME        IN  VARCHAR2
        ,IN_PER_GENDER      IN  VARCHAR2
        ,IN_PER_TEL         IN  VARCHAR2
        ,IN_PER_ADDR_GRP    IN  VARCHAR2
        ,IN_PER_ADDR        IN  VARCHAR2
        ,O_ERRCODE          OUT VARCHAR2
        ,O_ERRMSG           OUT VARCHAR2
    );
    
    --SELECT
    PROCEDURE PROC_SEL_PERSON
    (
        IN_PER_ID       IN      VARCHAR2
        ,IN_PER_NAME    IN      VARCHAR2
        ,IN_PER_GENDER  IN      VARCHAR2
        ,IN_PER_TEL     IN      VARCHAR2
        ,IN_PER_ADDR_VAL    IN  VARCHAR2
        ,O_CUR          OUT     SYS_REFCURSOR
        ,O_ERRCODE      OUT     VARCHAR2
        ,O_ERRMSG       OUT     VARCHAR2
    );
    
    --UPDATE
    PROCEDURE PROC_UP_PERSON
    (
        IN_PER_ID           IN  VARCHAR2
        ,IN_PER_NAME        IN  VARCHAR2
        ,IN_PER_GENDER      IN  VARCHAR2
        ,IN_PER_TEL         IN  VARCHAR2
        ,IN_PER_ADDR_GRP    IN  VARCHAR2
        ,IN_PER_ADDR        IN  VARCHAR2
        ,O_ERRCODE          OUT VARCHAR2
        ,O_ERRMSG           OUT VARCHAR2
    );
    
    --DELETE
    PROCEDURE PROC_DEL_PERSON
    (
        IN_PER_ID       IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

END PKG_PERSON;