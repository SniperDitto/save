create or replace NONEDITIONABLE PACKAGE BODY PKG_RESERVATION AS

  PROCEDURE PROC_INS_RESERVATION
    (
        IN_PER_ID       IN  VARCHAR2
        ,IN_HOS_ID      IN  VARCHAR2
        ,IN_VAC_ID      IN  VARCHAR2
        ,IN_RES_DATE    IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        --값 유효시 1, 없으면 0
        V_CHK_PER_ID    CHAR(1);
        V_CHK_HOS_ID    CHAR(1);
        V_CHK_VAC_ID    CHAR(1);
        
        --잔여백신수량체크
        V_CNT_VAC_QTY   CHAR(1);
        
        --새로운 RES_ID 생성
        V_NEW_RES_ID    CHAR(6);
        
        NO_PER_ID_EXCEPTION     EXCEPTION;
        NO_HOS_ID_EXCEPTION     EXCEPTION;
        NO_VAC_ID_EXCEPTION     EXCEPTION;
        NO_VAC_QTY_EXCEPTION    EXCEPTION;
        
  BEGIN
    --1) 주민번호, 병원ID, 백신ID 유효한지 체크
        SELECT DECODE(MAX(PER_ID),NULL,0,1)
        INTO V_CHK_PER_ID
        FROM PERSON_TBL
        WHERE PER_ID=IN_PER_ID
        ;
        SELECT DECODE(MAX(HOS_ID),NULL,0,1)
        INTO V_CHK_HOS_ID
        FROM HOSPITAL_TBL
        WHERE HOS_ID=IN_HOS_ID
        ;
        SELECT DECODE(MAX(VAC_ID),NULL,0,1)
        INTO V_CHK_VAC_ID
        FROM VACCINE_TBL
        WHERE VAC_ID=IN_VAC_ID
        ;
        
        IF V_CHK_PER_ID=0 THEN
            RAISE NO_PER_ID_EXCEPTION;
        ELSIF V_CHK_HOS_ID=0 THEN
            RAISE NO_HOS_ID_EXCEPTION;
        ELSIF V_CHK_VAC_ID=0 THEN
            RAISE NO_VAC_ID_EXCEPTION;
        ELSE
            --2) 선택한 백신 잔여수량 확인(예약화면과 예약 신청 사이에 다른사람이 신청해서 수량 차감되었을 수 있으므로)
            SELECT SUM(VAC_QTY)
            INTO V_CNT_VAC_QTY
            FROM VACCINE_IN_TBL
            WHERE VAC_ID=IN_VAC_ID
                AND HOS_ID=IN_HOS_ID
            GROUP BY VAC_ID, HOS_ID
            ;
            IF V_CNT_VAC_QTY=0 THEN
                RAISE NO_VAC_QTY_EXCEPTION;
            ELSE
                --3) 다음 RES_ID 생성
                SELECT 'RES'||TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(RES_ID),'RES000'),4,3))+1,'FM000')
                INTO V_NEW_RES_ID
                FROM RESERVATION_TBL
                ;
                --4) 값 넣기
                INSERT INTO RESERVATION_TBL(RES_ID, PER_ID, HOS_ID, VAC_ID, RES_DATE)
                VALUES(V_NEW_RES_ID, IN_PER_ID, IN_HOS_ID, IN_VAC_ID, IN_RES_DATE);
            END IF;
        END IF;
    
    EXCEPTION
        WHEN NO_PER_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PER_ID_EXCEPTION';
            O_ERRMSG := '없는 주민번호입니다';
        WHEN NO_HOS_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_HOS_ID_EXCEPTION';
            O_ERRMSG := '없는 병원입니다';
        WHEN NO_VAC_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_VAC_ID_EXCEPTION';
            O_ERRMSG := '없는 백신입니다';
        WHEN NO_VAC_QTY_EXCEPTION THEN
            O_ERRCODE := 'NO_VAC_QTY_EXCEPTION';
            O_ERRMSG := '백신 재고가 부족합니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_INS_RESERVATION;


--SELECT
  PROCEDURE PROC_SEL_RESERVATION
    (
        IN_RES_ID   IN  VARCHAR2
        ,IN_PER_ID   IN  VARCHAR2
        ,IN_HOS_ID   IN  VARCHAR2
        ,IN_VAC_ID   IN  VARCHAR2
        ,O_CUR      OUT  SYS_REFCURSOR
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
  BEGIN
  
    OPEN O_CUR FOR
    SELECT * FROM RESERVATION_TBL
    WHERE RES_ID LIKE '%'||IN_RES_ID||'%'
        AND PER_ID LIKE '%'||IN_PER_ID||'%'
        AND HOS_ID LIKE '%'||IN_HOS_ID||'%'
        AND VAC_ID LIKE '%'||IN_VAC_ID||'%'
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_SEL_RESERVATION;


--UPDATE
  PROCEDURE PROC_UP_RESERVATION
    (
        IN_RES_ID   IN VARCHAR2
        ,IN_PER_ID  IN VARCHAR2
        ,IN_HOS_ID  IN VARCHAR2
        ,IN_VAC_ID  IN VARCHAR2
        ,IN_RES_DATE    IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_RES_ID    CHAR(1);
        NO_RES_ID_EXCEPTION EXCEPTION;
  BEGIN
    --1) IN_RES_ID 유효한지 확인
    SELECT DECODE(MAX(RES_ID),NULL,0,1)
    INTO V_CHK_RES_ID
    FROM RESERVATION_TBL
    WHERE RES_ID=IN_RES_ID
    ;
    
    IF V_CHK_RES_ID=0 THEN
        RAISE NO_RES_ID_EXCEPTION;
    ELSE
        --2) UPDATE
        UPDATE RESERVATION_TBL
        SET
            PER_ID=IN_PER_ID
            ,HOS_ID=IN_HOS_ID
            ,VAC_ID=IN_VAC_ID
            ,RES_DATE=IN_RES_DATE
        WHERE RES_ID=IN_RES_ID
        ;
    END IF;
    
    EXCEPTION
        WHEN NO_RES_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_RES_ID_EXCEPTION';
            O_ERRMSG := '없는 예약건입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_UP_RESERVATION;


--DELETE
  PROCEDURE PROC_DEL_RESERVATION
    (
        IN_RES_ID   IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_RES_ID    CHAR(1);
        NO_RES_ID_EXCEPTION EXCEPTION;
  BEGIN
    --1) IN_RES_ID 유효한지 확인
    SELECT DECODE(MAX(RES_ID),NULL,0,1)
    INTO V_CHK_RES_ID
    FROM RESERVATION_TBL
    WHERE RES_ID=IN_RES_ID
    ;
    
    IF V_CHK_RES_ID=0 THEN
        RAISE NO_RES_ID_EXCEPTION;
    ELSE
        --2) DELETE
        DELETE FROM RESERVATION_TBL
        WHERE RES_ID=IN_RES_ID
        ;
    END IF;
    
    EXCEPTION
        WHEN NO_RES_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_RES_ID_EXCEPTION';
            O_ERRMSG := '없는 예약건입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_DEL_RESERVATION;

END PKG_RESERVATION;