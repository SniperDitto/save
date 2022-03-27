CREATE OR REPLACE
PACKAGE BODY PKG_VACCINE_IN AS

-------------------------------------------------------------------------------------
  PROCEDURE PROC_INS_VACCINE_IN
(
    IN_HOS_ID       IN      VARCHAR2,
    IN_VAC_ID       IN      VARCHAR2,
    IN_VAC_QTY      IN      VARCHAR2,
    IN_VAC_IN_DATE   IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
)
 AS
 V_NEW_VACCINE_IN_IDX       NUMBER;-- 신규생성IDX
 V_CHK_VACCINE_IN_ID       CHAR(1);-- 중복 체크
 VACCINE_IN_EXCEPTION EXCEPTION;
  BEGIN
  
    SELECT DECODE(MAX(HOS_ID),NULL,0,1)
    INTO V_CHK_VACCINE_IN_ID
    FROM VACCINE_IN_TBL
    WHERE HOS_ID = IN_HOS_ID
    AND VAC_ID = IN_VAC_ID
    AND VAC_QTY = IN_VAC_QTY
    AND VAC_IN_DATE = IN_VAC_IN_DATE
    ;
    
    IF V_CHK_VACCINE_IN_ID= 1 THEN
        RAISE VACCINE_IN_EXCEPTION;
    ELSE
        SELECT MAX(IDX)+1 INTO V_NEW_VACCINE_IN_IDX 
        FROM VACCINE_IN_TBL;
        INSERT INTO VACCINE_IN_TBL (IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE)
        VALUES(V_NEW_VACCINE_IN_IDX, IN_HOS_ID, IN_VAC_ID, IN_VAC_QTY, IN_VAC_IN_DATE);
    END IF;
    
    EXCEPTION 
    WHEN VACCINE_IN_EXCEPTION THEN
    O_ERRCODE:= 'VACCINE_IN_ERR001';
    O_ERRMSG:= '이미 입고한 데이터 입니다.';
    
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('입력한 데이터중 잘못된 정보가 있습니다!');
    O_ERRCODE:=SQLCODE;
    O_ERRMSG:=SQLERRM;
    END PROC_INS_VACCINE_IN;


-------------------------------------------------------------------------------------
  PROCEDURE PROC_SEL_VACCINE_IN
(
    IN_HOS_ID      IN    VARCHAR2,
    O_CUR         OUT   SYS_REFCURSOR
)
 AS
  BEGIN
    OPEN O_CUR FOR
    SELECT * FROM VACCINE_IN_TBL
    WHERE HOS_ID LIKE '%'||IN_HOS_ID||'%'
    ORDER BY IDX DESC
    ;
   
  END PROC_SEL_VACCINE_IN;
  
  
-------------------------------------------------------------------------------------
  PROCEDURE PROC_UP_VACCINE_IN
(
    IN_HOS_ID       IN      VARCHAR2,
    IN_VAC_ID       IN      VARCHAR2,
    IN_VAC_QTY      IN      VARCHAR2,
    IN_VAC_IN_DATE  IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
)
 AS
  BEGIN
    UPDATE VACCINE_IN_TBL
    SET HOS_ID       = IN_HOS_ID,
        VAC_ID       = IN_VAC_ID,
        VAC_QTY      = IN_VAC_QTY,
        VAC_IN_DATE  = IN_VAC_IN_DATE
        WHERE HOS_ID = IN_HOS_ID
        AND VAC_ID   = IN_VAC_ID;
    
    EXCEPTION 
    WHEN OTHERS THEN
    O_ERRCODE:=SQLCODE;
    O_ERRMSG:=SQLERRM;
    
  END PROC_UP_VACCINE_IN;
-------------------------------------------------------------------------------------
  PROCEDURE PROC_DEL_VACCINE_IN
(
    
    IN_HOS_ID      IN    VARCHAR2,
    IN_VAC_ID      IN    VARCHAR2,
    IN_VAC_IN_DATE IN    VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2
)
 AS
      V_VACCINE_IN_CNT NUMBER(2);
      VACCINE_IN_DEL_EXCEPTION EXCEPTION;
  BEGIN
  
      SELECT DECODE(MAX(HOS_ID),NULL,0,1)INTO V_VACCINE_IN_CNT 
      FROM  VACCINE_IN_TBL 
      WHERE HOS_ID=IN_HOS_ID
      AND VAC_ID=IN_VAC_ID
      AND VAC_IN_DATE=IN_VAC_IN_DATE;
      
      IF V_VACCINE_IN_CNT=0 THEN
        RAISE VACCINE_IN_DEL_EXCEPTION; -- 오류 실행 
      
      ELSE
        DELETE FROM VACCINE_IN_TBL 
        WHERE HOS_ID    = IN_HOS_ID
        AND VAC_ID      = IN_VAC_ID 
        AND VAC_IN_DATE = IN_VAC_IN_DATE;
      END IF;
      
      EXCEPTION WHEN VACCINE_IN_DEL_EXCEPTION THEN
      O_ERRCODE:='VACCINE_IN_ERR002';
      O_ERRMSG:='지우려는 VACCINE입고 DATA가 존재하지 않습니다';
  END PROC_DEL_VACCINE_IN;




END PKG_VACCINE_IN;