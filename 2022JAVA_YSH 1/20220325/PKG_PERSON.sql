create or replace NONEDITIONABLE PACKAGE PKG_PERSON AS 

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
        ,O_CURSOR       OUT     SYS_REFCURSOR
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