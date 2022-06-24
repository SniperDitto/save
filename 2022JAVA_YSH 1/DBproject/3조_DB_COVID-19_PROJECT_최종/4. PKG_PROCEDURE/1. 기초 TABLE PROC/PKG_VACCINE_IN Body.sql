create or replace NONEDITIONABLE PACKAGE BODY PKG_VACCINE_IN AS

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 김정희
-- 업무설명 : VACCINE_IN_TBL CRUD, 백신 입고 

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    20220328    김정희      SELECT 수정
*/
------------------------------------------

--20220328 SELECT 수정
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
    O_CUR         OUT   SYS_REFCURSOR,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
)
 AS
  BEGIN
        OPEN O_CUR FOR
        
        SELECT A.IDX, A.HOS_ID, A.HOS_NAME, A.VAC_ID,B.COM_VAL AS VAC_NAME, A.VAC_QTY, A.VAC_IN_DATE FROM
    (
        SELECT IDX, T1.HOS_ID AS HOS_ID, T2.HOS_NAME AS HOS_NAME, T1.VAC_ID AS VAC_ID, T1.VAC_QTY AS VAC_QTY, T1.VAC_IN_DATE AS VAC_IN_DATE
        FROM VACCINE_IN_TBL T1, HOSPITAL_TBL T2
        WHERE T1.HOS_ID LIKE '%'||IN_HOS_ID||'%'
        AND T1.HOS_ID = T2.HOS_ID
        ORDER BY IDX ASC
    )A,
    (
        SELECT T1.VAC_ID, T1.VAC_NAME_GRP,T1.VAC_NAME,T2.COM_VAL--T2.COM_VAL AS VAC_NAME 
        FROM VACCINE_TBL T1, COMMONS_TBL T2
        WHERE T1.VAC_NAME_GRP = T2.GRP_ID
        AND T1.VAC_NAME =T2.COM_ID
    )B
    WHERE A.VAC_ID = B.VAC_ID;
    
    EXCEPTION
    WHEN OTHERS THEN
    O_ERRCODE:=SQLCODE;
    O_ERRMSG:=SQLERRM;
    
   
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
      
      
      WHEN OTHERS THEN
        O_ERRCODE:=SQLCODE;
        O_ERRMSG:=SQLERRM;
  END PROC_DEL_VACCINE_IN;




END PKG_VACCINE_IN;