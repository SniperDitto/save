create or replace NONEDITIONABLE PACKAGE BODY PKG_ADMISSION AS

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 정성균
-- 업무설명 : ADMISSION_TBL CRUD, 입원 환자 리스트  

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

  PROCEDURE PROC_INS_ADMISSION
    (
        IN_PER_ID	    IN      VARCHAR2,				-- 사람ID
        IN_TRE_ID	    IN      VARCHAR2,				-- 진료ID
        IN_ADM_DATE	    IN      VARCHAR2,				-- 입원일
        O_ERRCODE       OUT     VARCHAR2,
        O_ERRMSG        OUT     VARCHAR2
    ) AS
    
    V_NEW_ADM_ID        VARCHAR2(6);
    V_NEW_IDX           NUMBER(5);
    V_TRUE_CHK          NUMBER(1);
    
    ADMISSION_PER_EXCEPTION     EXCEPTION;
    ADMISSION_TRE_EXCEPTION     EXCEPTION;
    ADMISSION_DUP_EXCEPTION     EXCEPTION;
    
  BEGIN
    
    SELECT 'ADM' || TO_CHAR(NVL(TO_NUMBER(SUBSTR(MAX(ADM_ID), 4, 3)), 0) + 1, 'FM000')
    INTO V_NEW_ADM_ID
    FROM ADMISSION_TBL;
    
    SELECT NVL(TO_NUMBER(MAX(IDX)), 0) + 1 
    INTO V_NEW_IDX
    FROM ADMISSION_TBL;
    
    SELECT DECODE(MAX(PER_ID), NULL, 0, 1) --진료에서 사람 ID 확인.
    INTO V_TRUE_CHK
    FROM TREAT_TBL
    WHERE PER_ID = IN_PER_ID;
    
    IF V_TRUE_CHK = 0 THEN
        RAISE ADMISSION_PER_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(TRE_ID), NULL, 0, 1) -- 진료 ID 확인.
    INTO V_TRUE_CHK
    FROM TREAT_TBL
    WHERE TRE_ID = IN_TRE_ID;
    
    IF V_TRUE_CHK = 0 THEN
        RAISE ADMISSION_TRE_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(PER_ID), NULL, 0, 1) -- 입원 테이블에 같은 사람이 있는 지 확인.
    INTO V_TRUE_CHK
    FROM ADMISSION_TBL
    WHERE PER_ID = IN_PER_ID;
    
    IF V_TRUE_CHK = 1 THEN -- 입원 테이블에 있는 경우
        SELECT DECODE(MAX(B.ADM_ID), NULL, 0, 1) --퇴원 테이블에 퇴원 기록 확인 (퇴원 : 1, 퇴원 X : 0)
        INTO V_TRUE_CHK
        FROM
        (
            SELECT MAX(ADM_ID) AS ADM_ID
            FROM ADMISSION_TBL
            WHERE PER_ID = IN_PER_ID
        ) A, DISCHARGE_TBL B
        WHERE A.ADM_ID = B.ADM_ID;
        
        IF V_TRUE_CHK = 0 THEN
            RAISE ADMISSION_DUP_EXCEPTION;
        END IF;
        
    END IF;
    
    INSERT INTO ADMISSION_TBL(IDX, ADM_ID, PER_ID, TRE_ID, ADM_DATE)
    VALUES(V_NEW_IDX, V_NEW_ADM_ID, IN_PER_ID, IN_TRE_ID, IN_ADM_DATE);
    
    EXCEPTION
    WHEN ADMISSION_PER_EXCEPTION THEN
        O_ERRCODE := 'ERR101';
        O_ERRMSG := '해당 사람 정보가 없습니다.';
    WHEN ADMISSION_TRE_EXCEPTION THEN
        O_ERRCODE := 'ERR102';
        O_ERRMSG := '해당 진료 정보가 없습니다.';
    WHEN ADMISSION_DUP_EXCEPTION THEN
        O_ERRCODE := 'ERR103';
        O_ERRMSG := '퇴원하지 않은 환자를 중복 입원 시킬 수 없습니다.';
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
  
  END PROC_INS_ADMISSION;
  
  
  PROCEDURE PROC_SEL_ADMISSION
    (
        IN_ADM_ID       IN      VARCHAR2,
        IN_PER_ID       IN      VARCHAR2,
        IN_TRE_ID       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR,
        O_ERRCODE       OUT     VARCHAR2,
        O_ERRMSG        OUT     VARCHAR2
    )
    AS

        V_TRUE_CHK      NUMBER(1);

    BEGIN
    
        OPEN O_CUR FOR
        SELECT T1.IDX, T1.ADM_ID, T1.PER_ID, T3.PER_NAME, T3.PER_GENDER, T1.TRE_ID, T2.DOC_ID, T2.DOC_NAME, T1.ADM_DATE
        FROM ADMISSION_TBL T1, DOCTOR_TBL T2, PERSON_TBL T3, TREAT_TBL T4
        WHERE T1.ADM_ID LIKE '%' || IN_ADM_ID || '%'
        AND T1.PER_ID = T3.PER_ID
        AND T1.PER_ID = T4.PER_ID
        AND T1.TRE_ID = T4.TRE_ID
        AND T2.DOC_ID = T4.DOC_ID;
        
        
        EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
    
    END PROC_SEL_ADMISSION;
    
    
    PROCEDURE PROC_UP_ADMISSION
    (
        IN_ADM_ID       IN      VARCHAR2,               -- 입원ID
        IN_PER_ID	    IN      VARCHAR2,				-- 사람ID
        IN_TRE_ID	    IN      VARCHAR2,				-- 진료ID
        IN_ADM_DATE	    IN      VARCHAR2,				-- 입원일
        O_ERRCODE       OUT     VARCHAR2,
        O_ERRMSG        OUT     VARCHAR2
    )
    AS
    
    V_TRUE_CHK          NUMBER(1);
    
    ADMISSION_PER_EXCEPTION     EXCEPTION;
    ADMISSION_TRE_EXCEPTION     EXCEPTION;
    ADMISSION_DUP_EXCEPTION     EXCEPTION;
    
  BEGIN
    
    SELECT DECODE(MAX(PER_ID), NULL, 0, 1) --진료에서 사람 ID 확인.
    INTO V_TRUE_CHK
    FROM TREAT_TBL
    WHERE PER_ID = IN_PER_ID;
    
    IF V_TRUE_CHK = 0 THEN
        RAISE ADMISSION_PER_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(TRE_ID), NULL, 0, 1) -- 진료 ID 확인.
    INTO V_TRUE_CHK
    FROM TREAT_TBL
    WHERE TRE_ID = IN_TRE_ID;
    
    IF V_TRUE_CHK = 0 THEN
        RAISE ADMISSION_TRE_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(PER_ID), NULL, 0, 1) -- 입원 테이블에 같은 사람이 있는 지 확인.
    INTO V_TRUE_CHK
    FROM ADMISSION_TBL
    WHERE PER_ID = IN_PER_ID;
    
    IF V_TRUE_CHK = 1 THEN -- 입원 테이블에 있는 경우
        SELECT DECODE(MAX(B.ADM_ID), NULL, 0, 1) --퇴원 테이블에 퇴원 기록 확인 (퇴원 : 1, 퇴원 X : 0)
        INTO V_TRUE_CHK
        FROM
        (
            SELECT MAX(ADM_ID) AS ADM_ID
            FROM ADMISSION_TBL
            WHERE PER_ID = IN_PER_ID
        ) A, DISCHARGE_TBL B
        WHERE A.ADM_ID = B.ADM_ID;
        
        IF V_TRUE_CHK = 0 THEN
            RAISE ADMISSION_DUP_EXCEPTION;
        END IF;
        
    END IF;
    
    UPDATE ADMISSION_TBL
    SET PER_ID = IN_PER_ID,
        TRE_ID = IN_TRE_ID,
        ADM_DATE = IN_ADM_DATE
    WHERE ADM_ID = IN_ADM_ID;
    
    
    EXCEPTION
    WHEN ADMISSION_PER_EXCEPTION THEN
        O_ERRCODE := 'ERR101';
        O_ERRMSG := '해당 사람 정보가 없습니다.';
    WHEN ADMISSION_TRE_EXCEPTION THEN
        O_ERRCODE := 'ERR102';
        O_ERRMSG := '해당 진료 정보가 없습니다.';
    WHEN ADMISSION_DUP_EXCEPTION THEN
        O_ERRCODE := 'ERR103';
        O_ERRMSG := '퇴원하지 않은 환자를 중복 입원 시킬 수 없습니다.';
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
        
    
    END PROC_UP_ADMISSION;
    
    
    PROCEDURE PROC_DEL_ADMISSION
    (
        IN_ADM_ID       IN      VARCHAR2,
        O_ERRCODE       OUT     VARCHAR2,
        O_ERRMSG        OUT     VARCHAR2
    )
    AS
    
    V_TRUE_CHK      NUMBER(1);
    
    ADMISSION_DEL_EXCEPTION     EXCEPTION;
    
    BEGIN
    
    --한번에 다 삭제 시키고 싶은데, 그렇게 묶어주면 그 묶인 테이블 중 값이 하나라도 없는 테이블은 삭제 불가.
    --결국엔 삭제가 안 되니까 DELETE문을 하나씩 주는 방식으로?
    
        SELECT DECODE(MAX(ADM_ID), NULL, 0, 1)
        INTO V_TRUE_CHK
        FROM ADMISSION_TBL
        WHERE ADM_ID = IN_ADM_ID;
        
        IF V_TRUE_CHK = 0 THEN
            RAISE ADMISSION_DEL_EXCEPTION;
        END IF;
    
        DELETE FROM ADMISSION_TBL
        WHERE ADM_ID = IN_ADM_ID;
        
        DELETE FROM ADMISSION_ROOMS_TBL
        WHERE ADM_ID = IN_ADM_ID;
        
        DELETE FROM ADMISSION_MEDICINES_TBL
        WHERE ADM_ID = IN_ADM_ID;
        
        DELETE FROM DISCHARGE_TBL
        WHERE ADM_ID = IN_ADM_ID;
        
        EXCEPTION
        WHEN ADMISSION_DEL_EXCEPTION THEN
            O_ERRCODE := 'ERR104';
            O_ERRMSG := '해당 입원 정보가 없습니다.';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
        
        
    END PROC_DEL_ADMISSION;

END PKG_ADMISSION;