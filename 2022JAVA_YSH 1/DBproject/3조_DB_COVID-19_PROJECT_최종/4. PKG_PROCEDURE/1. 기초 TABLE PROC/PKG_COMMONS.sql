create or replace NONEDITIONABLE PACKAGE PKG_COMMONS AS 

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 유승화
-- 업무설명 : COMMONS_TBL CRUD

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    20220327    유승화     DELETE부분 업무변경
*/
------------------------------------------

--COM_INSERT
    PROCEDURE PROC_INS_COMMONS
    (
        IN_GRP_ID       IN  VARCHAR2
        ,IN_COM_VAL     IN  VARCHAR2
        ,IN_PARENT_ID   IN  VARCHAR2
        ,IN_EXP_VAL1    IN  VARCHAR2
        ,IN_EXP_VAL2    IN  VARCHAR2
        ,IN_EXP_VAL3    IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--COM_SELECT
    PROCEDURE PROC_SEL_COMMONS
    (
        IN_GRP_ID       IN  VARCHAR2
        ,IN_COM_ID      IN  VARCHAR2
        ,IN_COM_VAL     IN  VARCHAR2
        ,O_CUR          OUT SYS_REFCURSOR
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--COM_UPDATE
    PROCEDURE PROC_UP_COMMONS
    (
        IN_GRP_ID       IN  VARCHAR2
        ,IN_COM_ID      IN  VARCHAR2
        ,IN_COM_VAL     IN  VARCHAR2
        ,IN_PARENT_ID   IN  VARCHAR2
        ,IN_EXP_VAL1    IN  VARCHAR2
        ,IN_EXP_VAL2    IN  VARCHAR2
        ,IN_EXP_VAL3    IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--GRP_DELETE
    PROCEDURE PROC_DEL_COMMONS_GRP
    (
        IN_GRP_ID       IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--COM_DELETE
    PROCEDURE PROC_DEL_COMMONS_COM
    (
        IN_COM_ID       IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

END PKG_COMMONS;