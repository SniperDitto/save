CREATE OR REPLACE
PACKAGE PKG_VACCINE_IN AS

-------------------------------------------------------------------------------------
  PROCEDURE PROC_INS_VACCINE_IN
(
    IN_HOS_ID       IN      VARCHAR2,
    IN_VAC_ID       IN      VARCHAR2,
    IN_VAC_QTY      IN      VARCHAR2,
    IN_VAC_IN_DATE   IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
);
-------------------------------------------------------------------------------------
  PROCEDURE PROC_SEL_VACCINE_IN
(
    IN_HOS_ID      IN    VARCHAR2,
    O_CUR         OUT   SYS_REFCURSOR,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2 
);
  
-------------------------------------------------------------------------------------
  PROCEDURE PROC_UP_VACCINE_IN
(
    IN_HOS_ID       IN      VARCHAR2,
    IN_VAC_ID       IN      VARCHAR2,
    IN_VAC_QTY      IN      VARCHAR2,
    IN_VAC_IN_DATE  IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
);
-------------------------------------------------------------------------------------
  PROCEDURE PROC_DEL_VACCINE_IN
(
    
    IN_HOS_ID      IN    VARCHAR2,
    IN_VAC_ID      IN    VARCHAR2,
    IN_VAC_IN_DATE IN    VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2
);

END PKG_VACCINE_IN;