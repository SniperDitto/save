create or replace NONEDITIONABLE PACKAGE BODY PKG_ADMISSION_MEDICINES AS

-- 최초작성일 : 2022-03-29
-- 최초작성자 : 김정희
-- 업무설명 : ADMISSION_MEDICINES_TBL CRUD, 입원 환자 처방 약품 목록 

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  20220329      김정희     ERR 수정
  20220329      정성균     ERR 수정
*/
------------------------------------------

  PROCEDURE PROC_INS_ADMISSION_MEDICINES
    (
        IN_ADM_ID           IN     VARCHAR2
        ,IN_ADM_MED_GRP     IN     VARCHAR2
        ,IN_ADM_MED         IN     VARCHAR2
        ,IN_ADM_MED_QTY     IN     VARCHAR2
        ,IN_ADM_MED_DATE    IN     VARCHAR2 
        ,O_ERRCODE          OUT     VARCHAR2
        ,O_ERRMSG           OUT     VARCHAR2 
    )
    AS
    V_NEW_ADMISSION_MEDICINES_INS_IDX       NUMBER;-- 신규생성IDX
    V_FIRST_IDX                             NUMBER;
    V_CHK_ADMISSION_MEDICINES_INS_ID       CHAR(1);-- 중복 체크
    ADMISSION_MEDICINES_INS_EXCEPTION EXCEPTION;
    BEGIN
     
     
     SELECT DECODE(MAX(ADM_ID),NULL,0,1)
     INTO V_CHK_ADMISSION_MEDICINES_INS_ID
     FROM ADMISSION_MEDICINES_TBL
     WHERE ADM_ID = IN_ADM_ID
     AND ADM_MED_GRP = IN_ADM_MED_GRP
     AND ADM_MED = IN_ADM_MED
     AND ADM_MED_QTY = IN_ADM_MED_QTY
     AND ADM_MED_DATE = IN_ADM_MED_DATE
    ;  
    
    SELECT DECODE(MAX(ADM_ID),NULL,1) 
    INTO V_FIRST_IDX
    FROM ADMISSION_MEDICINES_TBL
    ;
    
    IF V_CHK_ADMISSION_MEDICINES_INS_ID = 1 THEN
        RAISE ADMISSION_MEDICINES_INS_EXCEPTION;
    ELSE
        IF V_FIRST_IDX = 1 THEN
            INSERT INTO ADMISSION_MEDICINES_TBL (IDX, ADM_ID, ADM_MED_GRP, ADM_MED, ADM_MED_QTY, ADM_MED_DATE)
            VALUES(1, IN_ADM_ID, IN_ADM_MED_GRP, IN_ADM_MED, IN_ADM_MED_QTY, IN_ADM_MED_DATE);
        ELSE
            SELECT NVL(MAX(IDX), 0) + 1 INTO V_NEW_ADMISSION_MEDICINES_INS_IDX
            FROM ADMISSION_MEDICINES_TBL;
            INSERT INTO ADMISSION_MEDICINES_TBL (IDX, ADM_ID, ADM_MED_GRP, ADM_MED, ADM_MED_QTY, ADM_MED_DATE)
            VALUES(V_NEW_ADMISSION_MEDICINES_INS_IDX, IN_ADM_ID, IN_ADM_MED_GRP, IN_ADM_MED, IN_ADM_MED_QTY, IN_ADM_MED_DATE);
        END IF;
    END IF;
    
    EXCEPTION 
    WHEN ADMISSION_MEDICINES_INS_EXCEPTION THEN
        O_ERRCODE := 'ADMISSION_MEDICINES_IN_ERR001';
        O_ERRMSG := '이미 투여했던 약품 데이터 입니다.';
    
    WHEN OTHERS THEN
        O_ERRCODE:=SQLCODE;
        O_ERRMSG:=SQLERRM;
    
    END PROC_INS_ADMISSION_MEDICINES;
    
    
    
    PROCEDURE PROC_SEL_ADMISSION_MEDICINES
    (
             IN_ADM_ID           IN     VARCHAR2
            ,IN_ADM_MED_GRP      IN     VARCHAR2
            ,IN_ADM_MED          IN     VARCHAR2
            ,IN_ADM_MED_QTY      IN     VARCHAR2
            ,IN_ADM_MED_DATE     IN     VARCHAR2
            ,O_CUR              OUT     SYS_REFCURSOR
            ,O_ERRCODE           OUT     VARCHAR2
            ,O_ERRMSG            OUT     VARCHAR2
           
    )
    AS
    BEGIN
        OPEN O_CUR FOR
        
        SELECT A.IDX, A.ADM_MED_GRP, A.ADM_ID, A.ADM_MED, A.ADM_MED_QTY, ADM_MED_DATE, A.COST
        FROM
        (
            SELECT T1.IDX, T1.ADM_MED_GRP, T1.ADM_ID, T1.ADM_MED, T1.ADM_MED_QTY, T1.ADM_MED_DATE, T2.EXP_VAL1 AS COST
            FROM ADMISSION_MEDICINES_TBL T1, COMMONS_TBL T2 
            WHERE T1.ADM_MED_GRP = T2.GRP_ID
            AND T1.ADM_MED = T2.COM_ID
        )A
        WHERE ADM_ID = IN_ADM_ID
        AND ADM_MED_GRP = IN_ADM_MED_GRP
        AND ADM_MED = IN_ADM_MED
        AND ADM_MED_QTY = IN_ADM_MED_QTY
        AND ADM_MED_DATE = IN_ADM_MED_DATE;
        
        EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG  := SQLERRM;
        
    END PROC_SEL_ADMISSION_MEDICINES;
    
    PROCEDURE PROC_UP_ADMISSION_MEDICINES
    (
        IN_ADM_ID             IN      VARCHAR2
        ,IN_ADM_MED_GRP       IN      VARCHAR2
        ,IN_ADM_MED           IN      VARCHAR2
        ,IN_ADM_MED_QTY       IN      VARCHAR2
        ,IN_ADM_MED_DATE      IN      VARCHAR2
        ,O_ERRCODE           OUT      VARCHAR2
        ,O_ERRMSG            OUT      VARCHAR2  
    )
    AS
    BEGIN
    
        UPDATE ADMISSION_MEDICINES_TBL
        SET ADM_ID       = IN_ADM_ID,
            ADM_MED_GRP  = IN_ADM_MED_GRP,
            ADM_MED      = IN_ADM_MED,
            ADM_MED_QTY  = IN_ADM_MED_QTY,
            ADM_MED_DATE = IN_ADM_MED_DATE
            WHERE ADM_ID = IN_ADM_ID
            AND ADM_MED_GRP   = IN_ADM_MED_GRP
            AND ADM_MED       = IN_ADM_MED
            AND ADM_MED_QTY   = IN_ADM_MED_QTY
            AND ADM_MED_DATE  = IN_ADM_MED_DATE;
        
        
        EXCEPTION 
        WHEN OTHERS THEN
        O_ERRCODE:=SQLCODE;
        O_ERRMSG:=SQLERRM;
        
    END PROC_UP_ADMISSION_MEDICINES;
    
    PROCEDURE PROC_DEL_ADMISSION_MEDICINES
    (
         IN_ADM_ID          IN      VARCHAR2
        ,IN_ADM_MED         IN      VARCHAR2
        ,IN_ADM_MED_QTY     IN      VARCHAR2
        ,IN_ADM_MED_DATE    IN      VARCHAR2
        ,O_ERRCODE          OUT     VARCHAR2
        ,O_ERRMSG           OUT     VARCHAR2
    )
    AS
    V_CHK_ADMISSION_MEDICINES_DEL_ID       CHAR(1);-- 중복 체크
    ADMISSION_MEDICINES_DEL_EXCEPTION EXCEPTION;
    BEGIN
    
     SELECT DECODE(MAX(ADM_ID), NULL, 1, 0)
     INTO V_CHK_ADMISSION_MEDICINES_DEL_ID
     FROM ADMISSION_MEDICINES_TBL
     WHERE ADM_ID = IN_ADM_ID
     AND ADM_MED = IN_ADM_MED
     AND ADM_MED_QTY = IN_ADM_MED_QTY
     AND ADM_MED_DATE = IN_ADM_MED_DATE
    ;  
    
    IF V_CHK_ADMISSION_MEDICINES_DEL_ID= 1 THEN
        RAISE ADMISSION_MEDICINES_DEL_EXCEPTION;
    ELSE
        DELETE FROM ADMISSION_MEDICINES_TBL 
        WHERE ADM_ID     = IN_ADM_ID
        AND ADM_MED      = IN_ADM_MED 
        AND ADM_MED_QTY  = IN_ADM_MED_QTY
        AND ADM_MED_DATE = IN_ADM_MED_DATE;
    END IF;
    
    EXCEPTION 
    WHEN ADMISSION_MEDICINES_DEL_EXCEPTION THEN
        O_ERRCODE:= 'ADMISSION_MEDICINES_DEL_ERR001';
        O_ERRMSG:= '지우려는 백신 투여 DATA가 존재하지 않습니다.';
    
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
    
    END PROC_DEL_ADMISSION_MEDICINES;

END PKG_ADMISSION_MEDICINES;