create or replace NONEDITIONABLE PACKAGE BODY PKG_RESERVATION AS

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 정성균
-- 업무설명 : RESERVATION_TBL CRUD, 접종 희망자 병원별 예약 목록

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

  PROCEDURE PROC_INS_RESERVATION -- 예약 입력
  (
	IN_PER_ID	    IN  VARCHAR2,			-- 사람 ID
	IN_HOS_ID	    IN  VARCHAR2,			-- 병원 ID
	IN_VAC_ID	    IN  VARCHAR2,			-- 백신 ID
	IN_RES_DATE	    IN  DATE,				-- 예약일
    O_ERRCODE       OUT VARCHAR2,
    O_ERRMSG        OUT VARCHAR2
) AS

    V_TRUE_CHK      NUMBER(1);
    V_NEW_RES_ID    VARCHAR2(6);
    V_VAC_IN_QTY    NUMBER(5);
    V_VAC_RES_QTY   NUMBER(5);
    
    RESERVATION_INS_EXCEPTION       EXCEPTION;
    RESERVATION_PER_EXCEPTION       EXCEPTION;
    RESERVATION_HOS_EXCEPTION       EXCEPTION;
    RESERVATION_VAC_EXCEPTION       EXCEPTION;
    RESERVATION_QTY_EXCEPTION       EXCEPTION;

  BEGIN
  
    SELECT COUNT(PER_ID) --백신 예약 총 수량.
    INTO V_VAC_RES_QTY
    FROM RESERVATION_TBL
    WHERE HOS_ID = IN_HOS_ID
    AND VAC_ID = IN_VAC_ID;
    
    SELECT SUM(VAC_QTY) --백신 입고 총 수량.
    INTO V_VAC_IN_QTY
    FROM VACCINE_IN_TBL
    WHERE HOS_ID = IN_HOS_ID
    AND VAC_ID = IN_VAC_ID;
    
    IF V_VAC_IN_QTY <= V_VAC_RES_QTY THEN --백신 잔여 수량 확인.
        RAISE RESERVATION_QTY_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(PER_ID), NULL, 0, 1)
    INTO V_TRUE_CHK
    FROM PERSON_TBL
    WHERE PER_ID = IN_PER_ID;
    
    IF V_TRUE_CHK = 0 THEN --사람 ID 존재 확인.
        RAISE RESERVATION_PER_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(HOS_ID), NULL, 0, 1)
    INTO V_TRUE_CHK
    FROM HOSPITAL_TBL
    WHERE HOS_ID = IN_HOS_ID;
    
    IF V_TRUE_CHK = 0 THEN --병원 ID 존재 확인.
        RAISE RESERVATION_HOS_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(VAC_ID), NULL, 0, 1)
    INTO V_TRUE_CHK
    FROM VACCINE_TBL
    WHERE VAC_ID = IN_VAC_ID; 
    
    IF V_TRUE_CHK = 0 THEN --백신 ID 존재 확인.
        RAISE RESERVATION_VAC_EXCEPTION;
    END IF;
    
    SELECT 'RES' || TO_CHAR(NVL(TO_NUMBER(SUBSTR(MAX(RES_ID), 4, 3)), 0) + 1, 'FM000')
    INTO V_NEW_RES_ID
    FROM RESERVATION_TBL;
    
    INSERT INTO RESERVATION_TBL (RES_ID, PER_ID, HOS_ID, VAC_ID, RES_DATE)
    VALUES(V_NEW_RES_ID, IN_PER_ID, IN_HOS_ID, IN_VAC_ID, IN_RES_DATE);
    
    EXCEPTION
    WHEN RESERVATION_PER_EXCEPTION THEN
        O_ERRCODE := 'ERR100';
        O_ERRMSG := '사람에 대한 정보가 없습니다.';
    WHEN RESERVATION_HOS_EXCEPTION THEN
        O_ERRCODE := 'ERR200';
        O_ERRMSG := '병원에 대한 정보가 없습니다.';
    WHEN RESERVATION_VAC_EXCEPTION THEN
        O_ERRCODE := 'ERR300';
        O_ERRMSG := '백신에 대한 정보가 없습니다.';
    WHEN RESERVATION_QTY_EXCEPTION THEN
        O_ERRCODE := 'ERR400';
        O_ERRMSG := '백신 잔여 수량이 없습니다.';    
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
  
  END PROC_INS_RESERVATION;
  


    PROCEDURE PROC_SEL_RESERVATION -- 예약 조회
    (
        IN_RES_ID       IN      VARCHAR2,
        IN_PER_ID       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR,
        O_ERRCODE       OUT VARCHAR2,
        O_ERRMSG        OUT VARCHAR2
    )
    AS
    
        V_TRUE_CHK                  NUMBER(1);
        RESERVATION_SEL_EXCEPTION   EXCEPTION;
    
    BEGIN
    
    
    OPEN O_CUR FOR
    SELECT A.RES_ID, A.PER_ID, A.PER_NAME, A.PER_GENDER, A.HOS_ID, 
    A.HOS_NAME, A.VAC_ID, B.COM_VAL, A.RES_DATE FROM
    (
        SELECT T1.RES_ID, T2.PER_ID, T2.PER_NAME, T2.PER_GENDER, T1.HOS_ID, 
        T1.VAC_ID, T3.COM_VAL, T4.HOS_NAME, T1.RES_DATE
        FROM RESERVATION_TBL T1, PERSON_TBL T2, COMMONS_TBL T3, HOSPITAL_TBL T4
        WHERE T1.PER_ID = T2.PER_ID 
        AND T2.PER_ADDR_GRP = T3.GRP_ID
        AND T2.PER_ADDR = T3.COM_ID
        AND T1.HOS_ID = T4.HOS_ID
    )A,
    (
        SELECT T1.VAC_ID, T2.COM_VAL
        FROM VACCINE_TBL T1, COMMONS_TBL T2
        WHERE T1.VAC_NAME_GRP = T2.GRP_ID
        AND T1.VAC_NAME = T2.COM_ID
    )B
    WHERE A.VAC_ID = B.VAC_ID
    AND A.PER_ID LIKE '%' || IN_PER_ID || '%'
    AND A.RES_ID LIKE '%' || IN_RES_ID || '%';
    
    /*
    SELECT DECODE(MAX(PER_ID), NULL, 0, 1)
    INTO V_TRUE_CHK
    FROM RESERVATION_TBL
    WHERE PER_ID = IN_PER_ID;
    
    IF V_TRUE_CHK = 0 THEN
        RAISE RESERVATION_SEL_EXCEPTION;
    ELSE
        OPEN O_CUR FOR
        SELECT * FROM RESERVATION_TBL
        WHERE PER_ID LIKE '%' || IN_PER_ID || '%';
    END IF;
    */
    EXCEPTION
    WHEN RESERVATION_SEL_EXCEPTION THEN
        O_ERRCODE := 'ERR101';
        O_ERRMSG := '사람에 대한 정보가 없습니다.';
        
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
    
        
        
    END PROC_SEL_RESERVATION;
    
    PROCEDURE PROC_UP_RESERVATION -- 만약 업데이트 하면 INSERT처럼 수량 비교해서 해야하나?
    (
        IN_RES_ID       IN  VARCHAR2,           -- 예약 ID
        IN_PER_ID	    IN  VARCHAR2,			-- 사람 ID
        IN_HOS_ID	    IN  VARCHAR2,			-- 병원 ID
        IN_VAC_ID	    IN  VARCHAR2,			-- 백신 ID
        IN_RES_DATE	    IN  DATE,				-- 예약일
        O_ERRCODE       OUT VARCHAR2,
        O_ERRMSG        OUT VARCHAR2
    )
    AS
    
    V_TRUE_CHK      NUMBER(1);
    V_NEW_RES_ID    VARCHAR2(6);
    V_VAC_IN_QTY    NUMBER(5);
    V_VAC_RES_QTY   NUMBER(5);
    
    RESERVATION_INS_EXCEPTION       EXCEPTION;
    RESERVATION_PER_EXCEPTION       EXCEPTION;
    RESERVATION_HOS_EXCEPTION       EXCEPTION;
    RESERVATION_VAC_EXCEPTION       EXCEPTION;
    RESERVATION_QTY_EXCEPTION       EXCEPTION;

  BEGIN
  
    SELECT COUNT(PER_ID) --백신 예약 총 수량.
    INTO V_VAC_RES_QTY
    FROM RESERVATION_TBL
    WHERE HOS_ID = IN_HOS_ID
    AND VAC_ID = IN_VAC_ID;
    
    SELECT SUM(VAC_QTY) --백신 입고 총 수량.
    INTO V_VAC_IN_QTY
    FROM VACCINE_IN_TBL
    WHERE HOS_ID = IN_HOS_ID
    AND VAC_ID = IN_VAC_ID;
    
    IF V_VAC_IN_QTY <= V_VAC_RES_QTY THEN --백신 잔여 수량 확인.
        RAISE RESERVATION_QTY_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(PER_ID), NULL, 0, 1)
    INTO V_TRUE_CHK
    FROM PERSON_TBL
    WHERE PER_ID = IN_PER_ID;
    
    IF V_TRUE_CHK = 0 THEN --사람 ID 존재 확인.
        RAISE RESERVATION_PER_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(HOS_ID), NULL, 0, 1)
    INTO V_TRUE_CHK
    FROM HOSPITAL_TBL
    WHERE HOS_ID = IN_HOS_ID;
    
    IF V_TRUE_CHK = 0 THEN --병원 ID 존재 확인.
        RAISE RESERVATION_HOS_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(VAC_ID), NULL, 0, 1)
    INTO V_TRUE_CHK
    FROM VACCINE_TBL
    WHERE VAC_ID = IN_VAC_ID; 
    
    IF V_TRUE_CHK = 0 THEN --백신 ID 존재 확인.
        RAISE RESERVATION_VAC_EXCEPTION;
    END IF;
    
    UPDATE RESERVATION_TBL
        SET RES_ID = IN_RES_ID,
            PER_ID = IN_PER_ID,
            HOS_ID = IN_HOS_ID,
            VAC_ID = IN_VAC_ID,
            RES_DATE = IN_RES_DATE
        WHERE RES_ID = IN_RES_ID;
    
    EXCEPTION
    WHEN RESERVATION_PER_EXCEPTION THEN
        O_ERRCODE := 'ERR100';
        O_ERRMSG := '사람에 대한 정보가 없습니다.';
    WHEN RESERVATION_HOS_EXCEPTION THEN
        O_ERRCODE := 'ERR200';
        O_ERRMSG := '병원에 대한 정보가 없습니다.';
    WHEN RESERVATION_VAC_EXCEPTION THEN
        O_ERRCODE := 'ERR300';
        O_ERRMSG := '백신에 대한 정보가 없습니다.';
    WHEN RESERVATION_QTY_EXCEPTION THEN
        O_ERRCODE := 'ERR400';
        O_ERRMSG := '백신 잔여 수량이 없습니다.';    
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
        
    
    END PROC_UP_RESERVATION;
    
    PROCEDURE PROC_DEL_RESERVATION
    (
        IN_RES_ID       IN  VARCHAR2,
        O_ERRCODE       OUT VARCHAR2,
        O_ERRMSG        OUT VARCHAR2
    )
    AS
    
        V_TRUE_CHK      NUMBER(1);
        RESERVATION_DEL_EXCEPTION       EXCEPTION;
    
    BEGIN
    
    SELECT DECODE(MAX(RES_ID), NULL, 0, 1)
    INTO V_TRUE_CHK
    FROM RESERVATION_TBL;
    
    IF V_TRUE_CHK = 0 THEN
        RAISE RESERVATION_DEL_EXCEPTION;
        
    ELSE
        DELETE FROM RESERVATION_TBL
        WHERE RES_ID = IN_RES_ID;
    END IF;
        
    EXCEPTION
    WHEN RESERVATION_DEL_EXCEPTION THEN
        O_ERRCODE := 'ERR101';
        O_ERRMSG := '해당 진료 ID가 없습니다.';
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
        
    END PROC_DEL_RESERVATION;

END PKG_RESERVATION;