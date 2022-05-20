create or replace NONEDITIONABLE PACKAGE PKG_MENUS AS 

    PROCEDURE PROC_SEL_HMENUS
    (
        O_CUR   OUT     SYS_REFCURSOR
    );
    
    PROCEDURE PROC_SEL_LMENUS
    (
        IN_HMENUID  IN      VARCHAR2,
        O_CUR       OUT     SYS_REFCURSOR
    );
    
    PROCEDURE PROC_SEL_LMENUS_ALL
    (
        IN_HMENUID  IN      VARCHAR2,
        O_CUR       OUT     SYS_REFCURSOR
    );

END PKG_MENUS;