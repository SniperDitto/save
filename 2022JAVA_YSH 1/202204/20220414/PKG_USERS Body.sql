CREATE OR REPLACE
PACKAGE BODY PKG_USERS AS
--INSERT
  PROCEDURE PROC_INS_USERS
    (
        IN_USERNAME    IN  VARCHAR2
    ) AS
        V_NEW_USERID    CHAR(6);
        
    BEGIN
        
        SELECT 'USER'||TO_CHAR(NVL(TO_NUMBER(SUBSTR(MAX(USERID),5,2)),-1)+1,'FM00')
        INTO V_NEW_USERID
        FROM USERS
        ;
        
        INSERT INTO USERS(USERID, USERNAME)
        VALUES(V_NEW_USERID, IN_USERNAME);
        
    END PROC_INS_USERS;



--SELECT
  PROCEDURE PROC_SEL_USERS
    (
        IN_USERNAME    IN  VARCHAR2,
        O_CUR   OUT SYS_REFCURSOR
    ) AS
  BEGIN

    OPEN O_CUR FOR
    SELECT * 
    FROM USERS
    WHERE USERNAME LIKE '%'||IN_USERNAME||'%'
    ;

  END PROC_SEL_USERS;


--UPDATE
  PROCEDURE PROC_UP_USERS
    (
        IN_USER_ID     IN  VARCHAR2,
        IN_USERNAME    IN  VARCHAR2
    ) AS
  BEGIN

    UPDATE USERS
    SET USERNAME=IN_USERNAME
    WHERE USERID=IN_USER_ID
    ;

  END PROC_UP_USERS;
  
  
  
--DELETE
  PROCEDURE PROC_DEL_USERS
    (
        IN_USER_ID    IN  VARCHAR2
    ) AS
  BEGIN

    DELETE FROM USERS
    WHERE USERID = IN_USER_ID;
    
  END PROC_DEL_USERS;

END PKG_USERS;