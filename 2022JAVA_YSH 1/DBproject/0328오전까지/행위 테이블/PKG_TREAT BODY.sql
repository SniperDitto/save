CREATE OR REPLACE
PACKAGE BODY PKG_CORONA_TREAT AS

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
        SELECT * FROM TREAT_TBL
        WHERE TRE_ID LIKE '%' || IN_TRE_ID || '%'
        AND PAT_ID LIKE '%' || IN_PAT_ID || '%'
        AND PER_ID LIKE '%' || IN_PER_ID || '%'
        AND DOC_ID LIKE '%' || IN_DOC_ID || '%';
        
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

END PKG_CORONA_TREAT;