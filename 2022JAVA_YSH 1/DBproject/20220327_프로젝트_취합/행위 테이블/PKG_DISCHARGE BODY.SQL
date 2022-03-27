CREATE OR REPLACE
PACKAGE BODY PKG_DISCHARGE AS

-- INSERT
  PROCEDURE PROC_INS_DISCHARGE
(
    IN_DIS_IDX      IN      VARCHAR2,
    IN_DIS_ADM_ID   IN      VARCHAR2,
    IN_DIS_PER_ID   IN      VARCHAR2,
    IN_DIS_DOC_ID   IN      VARCHAR2,
    IN_DIS_DATE     IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
)
 AS
        -- 입원 ID, 사람ID 체크
        V_CHK_ADM_ID    CHAR(1);
        V_CHK_PER_ID    CHAR(1);
        
        --새로운 IDX_ID 생성
        V_NEW_IDX_ID    CHAR(6);
        
        NO_ADM_ID_EXCEPTION     EXCEPTION;
        NO_PER_ID_EXCEPTION     EXCEPTION;
        
  BEGIN
  
    -- 1) 입원 ID, 사람 ID 유효한지 체크
    SELECT DECODE(MAX(PER_ID),NULL,0,1)
        INTO V_CHK_ADM_ID
        FROM ADMISSION_TBL
        WHERE ADM_ID=IN_DIS_ADM_ID
        ;
        SELECT DECODE(MAX(PER_ID),NULL,0,1)
        INTO V_CHK_PER_ID
        FROM PERSON_TBL
        WHERE PER_ID=IN_DIS_PER_ID
        ;
        
    IF V_CHK_ADM_ID=0 THEN
    RAISE NO_ADM_ID_EXCEPTION;
        
    ELSIF V_CHK_PER_ID=0 THEN
    RAISE NO_PER_ID_EXCEPTION;
    
    ELSE
        --2) 다음 IDX 생성
        SELECT 'IDX'||TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(IDX),'IDX000'),4,3))+1,'FM000')
        INTO V_NEW_IDX_ID
        FROM DISCHARGE_TBL
                ;
       --3) 값 넣기
        INSERT INTO DISCHARGE_TBL(IDX, ADM_ID, PER_ID, DOC_ID, DIS_DATE)
        VALUES(IN_DIS_IDX, IN_DIS_ADM_ID, IN_DIS_PER_ID, IN_DIS_DOC_ID, IN_DIS_DATE);
    END IF;
    
    
    EXCEPTION
        WHEN NO_PER_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PER_ID_EXCEPTION';
            O_ERRMSG := '없는 주민번호입니다';
            
        WHEN NO_ADM_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_ADM_ID_EXCEPTION';
            O_ERRMSG := '없는 진료ID입니다';
    
    END PROC_INS_DISCHARGE;
    
    
    
    
 -- SELECT
 PROCEDURE PROC_SEL_DISCHARGE
    (
    IN_DIS_IDX      IN      VARCHAR2,
    IN_DIS_ADM_ID   IN      VARCHAR2,
    IN_DIS_PER_ID   IN      VARCHAR2,
    IN_DIS_DOC_ID   IN      VARCHAR2,
    IN_DIS_DATE     IN      VARCHAR2,
    O_CUR           OUT     SYS_REFCURSOR,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
    ) AS
  BEGIN
  
    OPEN O_CUR FOR
    SELECT * FROM DISCHARGE_TBL
    WHERE ADM_ID LIKE '%'||IN_DIS_ADM_ID||'%'
        AND PER_ID LIKE '%'||IN_DIS_PER_ID||'%'
        AND DOC_ID LIKE '%'||IN_DIS_DOC_ID||'%'
        AND DIS_DATE LIKE '%'||IN_DIS_DATE||'%'
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_SEL_DISCHARGE;
  


-- UPDATE
-- 퇴원하는 사람이랑 진료 ID는 안바뀌고 의사랑 퇴원일은 바뀔 수 있으니까 저거 두개만 업데이트 하는걸
PROCEDURE PROC_UP_DISCHARGE
(
    IN_DIS_IDX      IN      VARCHAR2,
    IN_DIS_ADM_ID   IN      VARCHAR2,
    IN_DIS_PER_ID   IN      VARCHAR2,
    IN_DIS_DOC_ID   IN      VARCHAR2,
    IN_DIS_DATE     IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
)AS
    V_CHK_ADM_ID    CHAR(1);
    V_CHK_PER_ID    CHAR(1);
    V_CHK_DIS_DATE  CHAR(1);
    NO_ADM_ID_EXCEPTION EXCEPTION;
    NO_PER_ID_EXCEPTION EXCEPTION;
    NO_DIS_DATE_EXCEPTION EXCEPTION;
  BEGIN  
-- 1) 입원 ID, 사람 ID 유효한지, 입퇴원일 체크
    SELECT DECODE(MAX(ADM_ID),NULL,0,1)
        INTO V_CHK_ADM_ID
        FROM ADMISSION_TBL
        WHERE ADM_ID=IN_DIS_ADM_ID
        ;
        SELECT DECODE(MAX(PER_ID),NULL,0,1)
        INTO V_CHK_PER_ID
        FROM PERSON_TBL
        WHERE PER_ID=IN_DIS_PER_ID
        ;
        SELECT DECODE(MAX(ADM_DATE),NULL,0,1)
        INTO V_CHK_DIS_DATE
        FROM ADMISSION_TBL
        WHERE ADM_DATE=IN_DIS_ADM_DATE
        ;
        
    IF V_CHK_ADM_ID=0 THEN
            RAISE NO_ADM_ID_EXCEPTION;
        ELSIF V_CHK_PER_ID=0 THEN
            RAISE NO_PER_ID_EXCEPTION;
        ELSIF V_CHK_DIS_DATE=0 THEN
            RAISE NO_DIS_DATE_EXCEPTION;
        ELSE
    --2) UPDATE
            UPDATE DISCHARGE_TBL
            SET
                ADM_ID=IN_DIS_ADM_ID
                ,PER_ID=IN_DIS_PER_ID
                ,DOC_ID=IN_DIS_DOC_ID
            WHERE ADM_ID=IN_DIS_ADM_ID
                ;
        END IF;
            
            EXCEPTION
                WHEN NO_ADM_ID_EXCEPTION THEN
                    O_ERRCODE := 'NO_ADM_ID_EXCEPTION';
                    O_ERRMSG := '없는 진료ID입니다';
                
                 WHEN NO_PER_ID_EXCEPTION THEN
                    O_ERRCODE := 'NO_PER_ID_EXCEPTION';
                    O_ERRMSG := '없는 사람ID입니다';
               
                WHEN NO_DIS_DATE_EXCEPTION THEN
                    O_ERRCODE := 'NO_DIS_DATE_EXCEPTION';
                    O_ERRMSG := '없는 입원일입니다';
                WHEN OTHERS THEN
                    O_ERRCODE := SQLCODE;
                    O_ERRMSG := SQLERRM;

END PROC_UP_DISCHARGE;



--DELETE
  PROCEDURE PROC_DEL_DISCHARGE
    (
        IN_DIS_ADM_ID       IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_ADM_ID    CHAR(1);
        NO_ADM_ID_EXCEPTION EXCEPTION;
  BEGIN
    --1) IN_ADM_ID 유효한지 확인
    SELECT DECODE(MAX(ADM_ID),NULL,0,1)
    INTO V_CHK_ADM_ID
    FROM ADMISSION_TBL
    WHERE ADM_ID=IN_DIS_ADM_ID
    ;
    
    IF V_CHK_ADM_ID=0 THEN
        RAISE NO_ADM_ID_EXCEPTION;
    ELSE
        --2) DELETE
        DELETE FROM DISCHARGE_TBL
        WHERE ADM_ID=IN_DIS_ADM_ID
        ;
    END IF;
    
    EXCEPTION
        WHEN NO_ADM_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_ADM_ID_EXCEPTION';
            O_ERRMSG := '없는 진료건입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
END PROC_DEL_DISCHARGE;


END PKG_DISCHARGE;