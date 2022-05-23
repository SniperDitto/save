create or replace NONEDITIONABLE PACKAGE PKG_MEMS AS 

PROCEDURE PROC_LOGIN
(
    IN_USERID       IN      VARCHAR2
    ,IN_USERPASS    IN      VARCHAR2
    ,O_CUR          OUT     SYS_REFCURSOR
);

    PROCEDURE PROC_CHECKID
    (
        IN_USERID       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR
    );
    
    PROCEDURE PROC_MEMBERJOIN
    (
        IN_USERID       IN  VARCHAR2,
        IN_USERPASS     IN  VARCHAR2,
        O_CUR           OUT SYS_REFCURSOR
    );

END PKG_MEMS;