create or replace NONEDITIONABLE PACKAGE BODY PKG_TREAT AS

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 원재경
-- 업무설명 : TREAT_TBL CRUD, 진료 환자 리스트(병원 내원환자에 대한 진료 목록)  

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

  PROCEDURE PROC_INS_TREAT
    (
        IN_PAT_ID           IN      VARCHAR2
        , IN_PER_ID         IN      VARCHAR2
        , IN_DOC_ID         IN      VARCHAR2
        , IN_TRE_PAY        IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    )AS
        V_TRE_ID                CHAR(6);
        V_CHK_PATID             NUMBER(1);
        V_CHK_PERID             NUMBER(1);
        V_CHK_DOCID             NUMBER(1);
        V_TRE_DATE              DATE;
        
        NO_PAT_ID_EXCEPTION     EXCEPTION;
        NO_PER_ID_EXCEPTION     EXCEPTION;
        NO_DOC_ID_EXCEPTION     EXCEPTION;
        
    BEGIN      
        
        SELECT DECODE(MAX(PAT_ID), NULL, 0, 1) INTO V_CHK_PATID
        FROM PATIENT_TBL
        WHERE PAT_ID = IN_PAT_ID;
        
        SELECT DECODE(MAX(PER_ID), NULL, 0, 1) INTO V_CHK_PERID
        FROM PERSON_TBL
        WHERE PER_ID = IN_PER_ID;
        
        SELECT DECODE(MAX(DOC_ID), NULL, 0, 1) INTO V_CHK_DOCID
        FROM DOCTOR_TBL
        WHERE DOC_ID = IN_DOC_ID;
        
        IF V_CHK_PATID = 0 THEN
            RAISE NO_PAT_ID_EXCEPTION;
        ELSIF V_CHK_PERID = 0 THEN
            RAISE NO_PER_ID_EXCEPTION;
        ELSIF V_CHK_DOCID = 0 THEN
            RAISE NO_DOC_ID_EXCEPTION;
        ELSE
            SELECT 'TRE'||TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PAT_ID),'TRE000'), 4, 3))+1, 'FM000')
            INTO V_TRE_ID
            FROM TREAT_TBL;
            
            SELECT PAT_IN_DATE INTO V_TRE_DATE
            FROM PATIENT_TBL
            WHERE PAT_ID = IN_PAT_ID;
            
            INSERT INTO TREAT_TBL(TRE_ID, PAT_ID, PER_ID, DOC_ID, TRE_DATE, TRE_PAY)
            VALUES(V_TRE_ID, IN_PAT_ID, IN_PER_ID, IN_DOC_ID, V_TRE_DATE, IN_TRE_PAY);
        END IF;
        
        EXCEPTION
        WHEN NO_PAT_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PAT_ID_EXCEPTION';
            O_ERRMSG := '병원 방문 기록이 없습니다';
        WHEN NO_PER_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PER_ID_EXCEPTION';
            O_ERRMSG := '주민등록번호가 없습니다.';
        WHEN NO_DOC_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_DOC_ID_EXCEPTION';
            O_ERRMSG := '의사 아이디가 없습니다.';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
    END PROC_INS_TREAT;
    
PROCEDURE PROC_SEL_TREAT
    (
         IN_TRE_ID           IN      VARCHAR2
        , IN_PAT_ID         IN      VARCHAR2
        , IN_PER_ID         IN      VARCHAR2
        , IN_DOC_ID         IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
        , O_CURSOR          OUT     SYS_REFCURSOR 
    )AS
        
    BEGIN
    
        OPEN O_CURSOR FOR
        SELECT * FROM(
            SELECT T1.TRE_ID, T2.PAT_ID, T1.PER_ID, T3.PER_NAME, T4.COM_VAL, T1.DOC_ID, T5.DOC_NAME,
            T1.TRE_DATE, T1.TRE_PAY
            FROM TREAT_TBL T1, PATIENT_TBL T2, PERSON_TBL T3, COMMONS_TBL T4, DOCTOR_TBL T5
            WHERE T1.PAT_ID = T2.PAT_ID
            AND T2.PER_ID = T3.PER_ID
            AND T2.PAT_SYMP_GRP = T4.GRP_ID
            AND T4.GRP_ID = 'GRP003'
            AND T2.PAT_SYMP = T4.COM_ID
            AND T1.DOC_ID = T5.DOC_ID
        )A
        WHERE A.TRE_ID LIKE '%' || IN_TRE_ID || '%'
        AND A.PAT_ID LIKE '%' || IN_PAT_ID || '%'
        AND A.PER_ID LIKE '%' || IN_PER_ID || '%'
        AND A.DOC_ID LIKE '%' || IN_DOC_ID || '%';
        
        EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
    END PROC_SEL_TREAT;
    
    PROCEDURE PROC_UP_TREAT
    (
        IN_TRE_ID           IN      VARCHAR2
        , IN_PAT_ID         IN      VARCHAR2
        , IN_PER_ID         IN      VARCHAR2
        , IN_DOC_ID         IN      VARCHAR2
        , IN_TRE_DATE       IN      VARCHAR2
        , IN_TRE_PAY        IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    )AS
        V_CHK_TREID             NUMBER(1);
        V_CHK_PATID             NUMBER(1);
        V_CHK_PERID             NUMBER(1);
        V_CHK_DOCID             NUMBER(1);
        
        NO_TRE_ID_EXCEPTION     EXCEPTION;
        NO_PAT_ID_EXCEPTION     EXCEPTION;
        NO_PER_ID_EXCEPTION     EXCEPTION;
        NO_DOC_ID_EXCEPTION     EXCEPTION;
        
    BEGIN
    
        SELECT DECODE(MAX(PAT_ID), NULL, 0, 1) INTO V_CHK_TREID
        FROM TREAT_TBL
        WHERE TRE_ID = IN_TRE_ID;
        
        SELECT DECODE(MAX(PAT_ID), NULL, 0, 1) INTO V_CHK_PATID
        FROM PATIENT_TBL
        WHERE PAT_ID = IN_PAT_ID;
        
        SELECT DECODE(MAX(PER_ID), NULL, 0, 1) INTO V_CHK_PERID
        FROM PERSON_TBL
        WHERE PER_ID = IN_PER_ID;
        
        SELECT DECODE(MAX(DOC_ID), NULL, 0, 1) INTO V_CHK_DOCID
        FROM DOCTOR_TBL
        WHERE DOC_ID = IN_DOC_ID;
        
        IF V_CHK_TREID =0 THEN
            RAISE NO_TRE_ID_EXCEPTION ;
        ELSIF V_CHK_PATID = 0 THEN
            RAISE NO_PAT_ID_EXCEPTION;
        ELSIF V_CHK_PERID = 0 THEN
            RAISE NO_PER_ID_EXCEPTION;
        ELSIF V_CHK_DOCID = 0 THEN
            RAISE NO_DOC_ID_EXCEPTION;
        ELSE
            UPDATE TREAT_TBL
            SET PAT_ID=IN_PAT_ID,
                PER_ID=IN_PER_ID,
                DOC_ID=IN_DOC_ID,
                TRE_DATE=IN_TRE_DATE,
                TRE_PAY=IN_TRE_PAY
            WHERE TRE_ID=IN_TRE_ID;
            
        END IF;
        
        EXCEPTION
        WHEN NO_TRE_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_TRE_ID';
            O_ERRMSG := '환자 진료정보가 없습니다';
        WHEN NO_PAT_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PAT_ID_EXCEPTION';
            O_ERRMSG := '병원 방문 기록이 없습니다';
        WHEN NO_PER_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PER_ID_EXCEPTION';
            O_ERRMSG := '주민등록번호가 없습니다.';
        WHEN NO_DOC_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_DOC_ID_EXCEPTION';
            O_ERRMSG := '의사 아이디가 없습니다.';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
        
    END PROC_UP_TREAT;
    
    PROCEDURE PROC_DEL_TREAT
    (
        IN_TRE_ID           IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    )AS
    
        V_CHK_TRE_ID        NUMBER(1);
        NO_TRE_ID           EXCEPTION;
    BEGIN
    
        SELECT DECODE(MAX(PAT_ID), NULL, 0, 1) INTO V_CHK_TRE_ID
        FROM TREAT_TBL
        WHERE TRE_ID = IN_TRE_ID;
        
        IF V_CHK_TRE_ID =1 THEN
            DELETE FROM TREAT_TBL
            WHERE TRE_ID=IN_TRE_ID;
        ELSE
            RAISE NO_TRE_ID ;
        END IF;
        
        EXCEPTION
        WHEN NO_TRE_ID THEN
            O_ERRCODE := 'NO_TRE_ID';
            O_ERRMSG := '환자 정보가 없습니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
        
    END PROC_DEL_TREAT;

END PKG_TREAT;