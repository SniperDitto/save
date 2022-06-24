create or replace NONEDITIONABLE PACKAGE BODY PKG_INJECTION AS

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 유승화
-- 업무설명 : INJECTION_TBL CRUD, 백신 접종 리스트(차수값 표시)  

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

--INSERT
  PROCEDURE PROC_INS_INJECTION
    (
        IN_RES_ID   IN VARCHAR2
        ,IN_INJ_DATE     IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_RES_ID    CHAR(1);
        V_INJ_CNT   NUMBER(2);
        V_PER_ID    CHAR(6);
        V_NEW_IDX   NUMBER;
        V_HOS_ID    CHAR(6);
        V_VAC_ID    CHAR(6);
        
        NO_RES_ID_EXCEPTION EXCEPTION;
  BEGIN
    --1) 존재하는 RES_ID인지 체크
    SELECT DECODE(MAX(RES_ID),NULL,0,1)
    INTO V_CHK_RES_ID
    FROM RESERVATION_TBL
    WHERE RES_ID=IN_RES_ID
    ;
    
    IF V_CHK_RES_ID=0 THEN
        RAISE NO_RES_ID_EXCEPTION;
    ELSE
        --2) RES_ID의 접종자 PER_ID가 INJECTION_TBL에 몇번 있는지 CNT 세기
        SELECT PER_ID
        INTO V_PER_ID
        FROM RESERVATION_TBL
        WHERE RES_ID=IN_RES_ID
        ;
        SELECT COUNT(PER_ID)
        INTO V_INJ_CNT
        FROM
        (
            --접종자 이름
            SELECT T2.RES_ID, T1.PER_ID
            FROM RESERVATION_TBL T1, INJECTION_TBL T2
            WHERE T1.RES_ID=T2.RES_ID
        )
        WHERE PER_ID=V_PER_ID
        ;
        
        --3) INSERT
        V_INJ_CNT := V_INJ_CNT+1;
        
        INSERT INTO INJECTION_TBL(RES_ID, INJ_DATE, INJ_CNT)
        VALUES(IN_RES_ID, IN_INJ_DATE, V_INJ_CNT);
        /*
        --4) 해당 병원의 백신 재고 차감
        --접종 병원 어딘지/뭘 맞았는지
        SELECT HOS_ID, VAC_ID
        INTO V_HOS_ID, V_VAC_ID
        FROM
        (
            --접종자 병원
            SELECT T2.RES_ID, T1.HOS_ID, T1.VAC_ID
            FROM RESERVATION_TBL T1, INJECTION_TBL T2
            WHERE T1.RES_ID=T2.RES_ID
        )
        WHERE RES_ID=IN_RES_ID
        ;
        --다음IDX
        SELECT NVL(MAX(IDX),0)+1
        INTO V_NEW_IDX
        FROM VACCINE_IN_TBL
        ;
        --백신입고테이블에 재고 -1로 INSERT
        INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE)
        VALUES(V_NEW_IDX, V_HOS_ID, V_VAC_ID, -1, IN_INJ_DATE);
        */
    END IF;
    
    EXCEPTION
        WHEN NO_RES_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_RES_ID_EXCEPTION';
            O_ERRMSG := '없는 RES_ID입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_INS_INJECTION;


--SELECT
  PROCEDURE PROC_SEL_INJECTION
    (
        IN_RES_ID   IN VARCHAR2
        ,IN_PER_NAME    IN  VARCHAR2
        ,IN_PER_ID      IN  VARCHAR2
        ,IN_HOS_NAME    IN  VARCHAR2
        ,IN_VAC_NAME    IN  VARCHAR2
        ,IN_INJ_CNT     IN  VARCHAR2
        ,O_CUR   OUT SYS_REFCURSOR
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
  BEGIN
    OPEN O_CUR FOR
    --INJECTION_TBL SELECT
    --예약번호 접종자이름 주민번호 백신이름 차수 병원이름
    SELECT T2.RES_ID AS 예약번호
        ,T1.PER_NAME AS 접종자명
        ,T1.PER_ID AS 주민번호
        ,T5.COM_VAL AS 백신이름
        ,T6.INJ_CNT AS 접종차수
        ,T3.HOS_NAME AS 접종병원
    FROM PERSON_TBL T1
        ,RESERVATION_TBL T2
        ,HOSPITAL_TBL T3
        ,VACCINE_TBL T4
        ,COMMONS_TBL T5
        ,INJECTION_TBL T6
    WHERE T1.PER_ID=T2.PER_ID
        AND T2.HOS_ID=T3.HOS_ID
        AND T2.VAC_ID=T4.VAC_ID
        AND T2.RES_ID=T6.RES_ID
        AND T2.RES_ID LIKE '%'||IN_RES_ID||'%'
        AND T1.PER_NAME LIKE '%'||IN_PER_NAME||'%'
        AND T1.PER_ID LIKE '%'||IN_PER_ID||'%'
        AND TRIM(T5.COM_VAL) LIKE '%'||TRIM(IN_VAC_NAME)||'%'
        AND T6.INJ_CNT=IN_INJ_CNT
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_SEL_INJECTION;


--UPDATE
  PROCEDURE PROC_UP_INJECTION
    (
        IN_RES_ID   IN VARCHAR2
        ,IN_INJ_DATE    IN VARCHAR2
        ,IN_INJ_CNT     IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_RES_ID    CHAR(1);--INJECTION_TBL에 있는 건인지
        V_CHK_RES_ID2    CHAR(1);--RESERVATION_TBL에 있는 건인지
        
        NO_RES_ID_EXCEPTION EXCEPTION;--INJECTION_TBL에 있는 건인지
        NO_RES_ID_EXCEPTION2 EXCEPTION;--RESERVATION_TBL에 있는 건인지
  BEGIN
    --1) RES_ID 유효한지 체크
        --INJECTION_TBL에 있는 건인지
    SELECT DECODE(MAX(RES_ID),NULL,0,1)
    INTO V_CHK_RES_ID
    FROM INJECTION_TBL
    WHERE RES_ID=IN_RES_ID
    ;
    IF V_CHK_RES_ID=0 THEN
        RAISE NO_RES_ID_EXCEPTION;
    ELSE
        --RESERVATION_TBL에 있는 건인지
        SELECT DECODE(MAX(RES_ID),NULL,0,1)
        INTO V_CHK_RES_ID2
        FROM RESERVATION_TBL
        WHERE RES_ID=IN_RES_ID
        ;
        IF V_CHK_RES_ID2=0 THEN
            RAISE NO_RES_ID_EXCEPTION2;
        ELSE
            --2) UPDATE
            UPDATE INJECTION_TBL
            SET
                RES_ID=IN_RES_ID
                ,INJ_DATE=IN_INJ_DATE
                ,INJ_CNT=IN_INJ_CNT
            ;
        END IF;
    END IF;
    
    EXCEPTION
        WHEN NO_RES_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_RES_ID_EXCEPTION';
            O_ERRMSG := 'INJECTION_TBL에 없는 예약건입니다';
        WHEN NO_RES_ID_EXCEPTION2 THEN
            O_ERRCODE := 'NO_RES_ID_EXCEPTION2';
            O_ERRMSG := 'RESERVATION_TBL에 없는 예약건입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_UP_INJECTION;


--DELETE
  PROCEDURE PROC_DEL_INJECTION
    (
        IN_RES_ID   IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_RES_ID    CHAR(1);
        NO_RES_ID_EXCEPTION EXCEPTION;
  BEGIN
    --1) RES_ID 유효한지 체크
    SELECT DECODE(MAX(RES_ID),NULL,0,1)
    INTO V_CHK_RES_ID
    FROM INJECTION_TBL
    WHERE RES_ID=IN_RES_ID
    ;
    IF V_CHK_RES_ID=0 THEN
        RAISE NO_RES_ID_EXCEPTION;
    ELSE
        DELETE FROM INJECTION_TBL
        WHERE RES_ID=IN_RES_ID
        ;
    END IF;
    
    EXCEPTION
        WHEN NO_RES_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_RES_ID_EXCEPTION';
            O_ERRMSG := '없는 RES_ID 입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_DEL_INJECTION;

END PKG_INJECTION;