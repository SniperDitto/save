CREATE OR REPLACE
PACKAGE BODY PKG_MEMS AS

  PROCEDURE PROC_LOGIN
(
    IN_USERID       IN      VARCHAR2
    ,IN_USERPASS    IN      VARCHAR2
    ,O_CUR          OUT     SYS_REFCURSOR
) AS
    V_RESULT    VARCHAR2(10);
  BEGIN
    
    SELECT NVL(MAX(USERID),'FAIL')
    INTO V_RESULT
    FROM MEMBERS
    WHERE USERID=IN_USERID
        AND USERPASS=IN_USERPASS
    ;
    
    OPEN O_CUR FOR
    SELECT V_RESULT AS RESULT
    FROM DUAL
    ;
    
  END PROC_LOGIN;

END PKG_MEMS;