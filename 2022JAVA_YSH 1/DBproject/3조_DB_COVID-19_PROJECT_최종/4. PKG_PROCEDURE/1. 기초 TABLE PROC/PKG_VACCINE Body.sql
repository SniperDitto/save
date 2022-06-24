create or replace NONEDITIONABLE PACKAGE BODY PKG_VACCINE AS

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 최문준
-- 업무설명 : VACCINE_TBL CRUD

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    
*/
------------------------------------------

-- INSERT
   PROCEDURE PROC_INS_VACCINE
    (
          IN_VAC_NAME_GRP   IN VARCHAR2
        , IN_VAC_NAME       IN VARCHAR2
        , IN_VAC_DOSE       IN VARCHAR2
        , IN_VAC_TEMP       IN VARCHAR2 
        , O_ERRCODE          OUT VARCHAR2
        , O_ERRMSG           OUT VARCHAR2
    )
    AS
        V_NEW_VAC_ID       CHAR(6);
  BEGIN
     SELECT 'VAC'||TO_CHAR(TO_NUMBER(SUBSTR(MAX(VAC_ID),4,3))+1,'FM000') INTO V_NEW_VAC_ID FROM VACCINE_TBL;
     INSERT INTO VACCINE_TBL (VAC_ID, VAC_NAME_GRP, VAC_NAME, VAC_DOSE, VAC_TEMP)
     VALUES (V_NEW_VAC_ID, IN_VAC_NAME_GRP, IN_VAC_NAME, IN_VAC_DOSE, IN_VAC_TEMP);
    
    EXCEPTION 
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('입력한 데이터중 잘못된 정보가 있습니다!');
      O_ERRCODE:=SQLCODE;
      O_ERRMSG:=SQLERRM;
    
    
    
  END PROC_INS_VACCINE;


--SELECT
  PROCEDURE PROC_SEL_VACCINE
    (
          IN_VAC_NAME_GRP       IN VARCHAR2
        , IN_VAC_NAME           IN VARCHAR2
        , IN_VAC_DOSE           IN VARCHAR2
        , IN_VAC_TEMP           IN VARCHAR2
        , O_CURSOR              OUT     SYS_REFCURSOR
        , O_ERRCODE             OUT VARCHAR2
        , O_ERRMSG              OUT VARCHAR2
    ) AS
  BEGIN
    OPEN O_CURSOR FOR
    SELECT A.VAC_NAME_GRP, A.VAC_NAME, B.COM_VAL, A.VAC_DOSE, A.VAC_TEMP
    FROM VACCINE_TBL A, COMMONS_TBL B
    WHERE VAC_NAME_GRP LIKE '%'||IN_VAC_NAME_GRP||'%'
    AND A.VAC_NAME LIKE '%'||IN_VAC_NAME||'%'
    AND A.VAC_DOSE LIKE '%'||IN_VAC_DOSE||'%'
    AND A.VAC_TEMP LIKE '%'||IN_VAC_TEMP||'%'
    AND A.VAC_NAME_GRP = B.GRP_ID
    AND A.VAC_NAME = B.COM_ID
    ;
   EXCEPTION 
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('입력한 데이터중 잘못된 정보가 있습니다!');
    O_ERRCODE:=SQLCODE;
    O_ERRMSG:=SQLERRM; 
    
  END PROC_SEL_VACCINE;



--UPDATE
  PROCEDURE PROC_UP_VACCINE
    (
          IN_VAC_NAME_GRP    IN CHAR
        , IN_VAC_NAME        IN CHAR
        , IN_VAC_DOSE       IN NUMBER
        , IN_VAC_TEMP       IN NUMBER 
        , O_ERRCODE             OUT     VARCHAR2,
        O_ERRMSG                OUT     VARCHAR2 
    ) AS
        V_CHK_VAC_NAME_GRP      CHAR(1);
        V_CHK_VAC_NAME          CHAR(1);
        V_CHK_VAC_DOSE          CHAR(1);
        NO_VAC_NAME_GRP_EXCEPTION EXCEPTION;
        NO_VAC_NAME_EXCEPTION EXCEPTION;
        NO_VAC_DOSE_EXCEPTION EXCEPTION;
    
  BEGIN
   -- 1) 백신GRP, 백신이름, 백신COM_VAL 유효한지 체크
    SELECT DECODE(MAX(VAC_NAME_GRP),NULL,0,1)
        INTO V_CHK_VAC_NAME_GRP
        FROM VACCINE_TBL
        WHERE VAC_NAME_GRP=IN_VAC_NAME_GRP
        ;
        SELECT DECODE(MAX(VAC_NAME),NULL,0,1)
        INTO V_CHK_VAC_NAME
        FROM VACCINE_TBL
        WHERE VAC_NAME=IN_VAC_NAME
        ;
        SELECT DECODE(MAX(VAC_DOSE),NULL,0,1)
        INTO V_CHK_VAC_DOSE
        FROM VACCINE_TBL
        WHERE VAC_DOSE=IN_VAC_DOSE
        ;
        
        IF V_CHK_VAC_NAME_GRP=0 THEN
            RAISE NO_VAC_NAME_GRP_EXCEPTION;
        ELSIF V_CHK_VAC_NAME=0 THEN
            RAISE NO_VAC_NAME_EXCEPTION;
        ELSIF V_CHK_VAC_DOSE=0 THEN
            RAISE NO_VAC_DOSE_EXCEPTION;
        ELSE
    --2) UPDATE
            UPDATE VACCINE_TBL
            SET
                VAC_NAME_GRP=IN_VAC_NAME_GRP
                ,VAC_NAME=IN_VAC_NAME
            WHERE VAC_DOSE=IN_VAC_DOSE
                ;
        END IF;
            
            EXCEPTION
                WHEN NO_VAC_NAME_GRP_EXCEPTION THEN
                    O_ERRCODE := 'NO_VAC_NAME_GRP_EXCEPTION';
                    O_ERRMSG := '없는 백신 GRP입니다';
                
                 WHEN NO_VAC_NAME_EXCEPTION THEN
                    O_ERRCODE := 'NO_VAC_NAME_EXCEPTION';
                    O_ERRMSG := '없는 백신 이름입니다';
               
                WHEN NO_VAC_DOSE_EXCEPTION THEN
                    O_ERRCODE := 'NO_VAC_DOSE_EXCEPTION';
                    O_ERRMSG := '없는 백신 COM_VAL입니다';
                WHEN OTHERS THEN
                    O_ERRCODE := SQLCODE;
                    O_ERRMSG := SQLERRM;
        
  END PROC_UP_VACCINE;


--DELETE
  PROCEDURE PROC_DEL_VACCINE
    (
        IN_VAC_DOSE       IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_VAC_DOSE    CHAR(1);
        NO_VAC_DOSE_EXCEPTION EXCEPTION;
  BEGIN
    --1) IN_VAC_DOSE 유효한지 확인
    SELECT DECODE(MAX(VAC_DOSE),NULL,0,1)
    INTO V_CHK_VAC_DOSE
    FROM VACCINE_TBL
    WHERE VAC_DOSE=IN_VAC_DOSE
    ;
    
    IF V_CHK_VAC_DOSE=0 THEN
        RAISE NO_VAC_DOSE_EXCEPTION;
    ELSE
        --2) DELETE
        DELETE FROM VACCINE_TBL
        WHERE VAC_DOSE=IN_VAC_DOSE
        ;
    END IF;
    
    EXCEPTION
        WHEN NO_VAC_DOSE_EXCEPTION THEN
            O_ERRCODE := 'NO_VAC_DOSE_EXCEPTION';
            O_ERRMSG := '없는 백신 COM_VAL 입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
    
  END PROC_DEL_VACCINE;

END PKG_VACCINE;