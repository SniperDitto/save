create or replace NONEDITIONABLE PACKAGE BODY PKG_ADMISSION_ROOMS AS

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 원재경
-- 업무설명 : ADMISSION_ROOMS_TBL CRUD, 입원 환자 사용 병실 목록(log)

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  20220327     유승화      INSERT 수정 및 추가
  20220327     최문준      SELECT 수정 및 추가
  20220327     정성균      UPDATE 수정 및 추가
  20220327     원재경      DELETE 수정 및 추가
*/
------------------------------------------

  PROCEDURE PROC_INS_ADMISSION_ROOMS
    (
        IN_ADM_ID   IN VARCHAR2
        ,IN_ADM_ROOM_GRP    IN VARCHAR2
        ,IN_ADM_ROOM    IN VARCHAR2
        ,IN_ADM_ROOM_DATE   IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        --있으면 1 없으면 0
        V_CHK_ADM_ID    CHAR(1);
        V_CHK_A_ROOM_DATE   NUMBER;
        V_CHK_GRP_ID    CHAR(1);
        V_CHK_COM_ID    CHAR(1);
        
        V_NEW_IDX   NUMBER;
        
        NO_ADM_ID_EXCEPTION EXCEPTION;
        NOT_VALID_GRP_ID_EXCEPTION  EXCEPTION;
        NOT_VALID_COM_ID_EXCEPTION  EXCEPTION;
        NOT_VALID_DATE_EXCEPTION    EXCEPTION;
  BEGIN
    
    --1) 입원ID, GRP, COM 유효한지 확인
    SELECT DECODE(MAX(ADM_ID),NULL,0,1)
    INTO V_CHK_ADM_ID
    FROM ADMISSION_TBL
    WHERE ADM_ID=IN_ADM_ID
    ;
    --COMMONS_TBL에서 체크
    SELECT DECODE(MAX(GRP_ID),NULL,0,1), DECODE(MAX(COM_ID),NULL,0,1)
    INTO V_CHK_GRP_ID, V_CHK_COM_ID
    FROM COMMONS_TBL
    WHERE GRP_ID=IN_ADM_ROOM_GRP AND GRP_ID='COM006'
        AND COM_ID=IN_ADM_ROOM AND PARENT_ID='COM501'
    ;
    
    IF V_CHK_ADM_ID=0 THEN
        RAISE NO_ADM_ID_EXCEPTION;
    ELSIF V_CHK_GRP_ID=0 THEN
        RAISE NOT_VALID_GRP_ID_EXCEPTION;
    ELSIF V_CHK_COM_ID=0 THEN
        RAISE NOT_VALID_COM_ID_EXCEPTION;
    ELSE
        --2) IN_ADM_ROOM_DATE가 입원일 이후인지 확인
        SELECT TO_CHAR(IN_ADM_ROOM_DATE,'YYYYMMDDHH24MISS')-TO_CHAR(ADM_DATE,'YYYYMMDDHH24MISS')
        INTO V_CHK_A_ROOM_DATE
        FROM ADMISSION_TBL
        WHERE ADM_ID=IN_ADM_ID
        ;
        IF V_CHK_A_ROOM_DATE < 0 THEN
            RAISE NOT_VALID_DATE_EXCEPTION;
        ELSE
            --3) IDX 생성
            SELECT NVL(MAX(IDX),0)+1
            INTO V_NEW_IDX
            FROM ADMISSION_ROOMS_TBL
            ;
            --4) INSERT
            INSERT INTO ADMISSION_ROOMS_TBL(IDX,ADM_ID,ADM_ROOM_GRP,ADM_ROOM,ADM_ROOM_DATE)
            VALUES(V_NEW_IDX,IN_ADM_ID, IN_ADM_ROOM_GRP, IN_ADM_ROOM, IN_ADM_ROOM_DATE);
        END IF;
    END IF;
    
    EXCEPTION
        WHEN NO_ADM_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_ADM_ID_EXCEPTION';
            O_ERRMSG := '입원건이 없습니다';
        WHEN NOT_VALID_GRP_ID_EXCEPTION THEN
            O_ERRCODE := 'NOT_VALID_GRP_ID_EXCEPTION';
            O_ERRMSG := 'GRP_ID가 유효하지 않습니다';
        WHEN NOT_VALID_COM_ID_EXCEPTION THEN
            O_ERRCODE := 'NOT_VALID_COM_ID_EXCEPTION';
            O_ERRMSG := 'COM_ID가 유효하지 않습니다';
        WHEN NOT_VALID_DATE_EXCEPTION THEN
            O_ERRCODE := 'NOT_VALID_DATE_EXCEPTION';
            O_ERRMSG := '입원일 이전의 날짜입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_INS_ADMISSION_ROOMS;
    
    
    PROCEDURE PROC_SEL_ADMISSION_ROOMS
    (
        IN_ADM_ID   IN VARCHAR2
        ,O_CUR  OUT SYS_REFCURSOR
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
  BEGIN
    
    OPEN O_CUR FOR
    SELECT T3.ADM_ID, T3.PER_ID, T4.PER_NAME, T1.ADM_ROOM_DATE, T2.COM_VAL, T3.ADM_DATE AS 입원일자
    FROM ADMISSION_ROOMS_TBL T1, COMMONS_TBL T2, ADMISSION_TBL T3, PERSON_TBL T4
    WHERE T1.ADM_ROOM_GRP = T2.GRP_ID 
    AND T1.ADM_ROOM = T2.COM_ID
    AND T1.ADM_ID = T3.ADM_ID
    AND T3.PER_ID = T4.PER_ID

    AND T1.ADM_ID LIKE '%'||IN_ADM_ID||'%'
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_SEL_ADMISSION_ROOMS;
    
    

  PROCEDURE PROC_UP_ADMISSION_ROOMS
    (
        IN_ADM_ID           IN      VARCHAR2,  -- 입원 ID
        IN_ADM_ROOM         IN      VARCHAR2,  -- 병실
        IN_ADM_ROOM_DATE    IN      VARCHAR2,  -- 병실 사용일
        O_ERRCODE           OUT     VARCHAR2,
        O_ERRMSG            OUT     VARCHAR2
    ) AS
    
    V_TRUE_CHK      NUMBER(1);
    
    ADMISSION_INS_EXCEPTION     EXCEPTION;
    ADMISSION_ADM_EXCEPTION     EXCEPTION;
    ADMISSION_NOVAL_EXCEPTION     EXCEPTION;
    
  BEGIN
  
    IF IN_ADM_ROOM = 'COM501' THEN
        RAISE ADMISSION_INS_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(ADM_ID), NULL, 0, 1) -- 입원했는지 찾기.
    INTO V_TRUE_CHK
    FROM ADMISSION_TBL
    WHERE ADM_ID = IN_ADM_ID;
    
    IF V_TRUE_CHK = 0 THEN
        RAISE ADMISSION_ADM_EXCEPTION;
    END IF;
    
    SELECT DECODE(MAX(COM_ID), NULL, 0, 1) -- 올바른 병실 선택했는지 판단.
    INTO V_TRUE_CHK
    FROM COMMONS_TBL
    WHERE GRP_ID = 'GRP006'
    AND COM_ID = IN_ADM_ROOM;
    
    IF V_TRUE_CHK = 0 THEN
        RAISE ADMISSION_NOVAL_EXCEPTION;
    END IF;
    
    
    UPDATE  ADMISSION_ROOMS_TBL
    SET ADM_ROOM = IN_ADM_ROOM,
        ADM_ROOM_DATE = IN_ADM_ROOM_DATE
    WHERE ADM_ID = IN_ADM_ID;
    
    
    
    EXCEPTION
    WHEN ADMISSION_INS_EXCEPTION THEN
        O_ERRCODE := 'ERR101';
        O_ERRMSG := '최상위 값은 병실이 아닙니다.';
    WHEN ADMISSION_ADM_EXCEPTION THEN
        O_ERRCODE := 'ERR102';
        O_ERRMSG := '해당 입원 정보가 없습니다.';
    WHEN ADMISSION_NOVAL_EXCEPTION THEN
        O_ERRCODE := 'ERR103';
        O_ERRMSG := '해당 병실이 없습니다.';
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
  
  END PROC_UP_ADMISSION_ROOMS;
  
  PROCEDURE PROC_DEL_ADM_ROOMS
    (
        IN_ADM_ID           IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    )AS
        V_CHK_ADM_ID            NUMBER(1);
        NO_ADM_ID_EXCEPTION     EXCEPTION;
    BEGIN
    
        SELECT DECODE(MAX(ADM_ID), NULL, 0, 1) INTO V_CHK_ADM_ID
        FROM ADMISSION_TBL
        WHERE ADM_ID = IN_ADM_ID;
        
        IF V_CHK_ADM_ID=0 THEN
            RAISE NO_ADM_ID_EXCEPTION;
        ELSE
            DELETE FROM ADMISSION_ROOMS_TBL
            WHERE ADM_ID = IN_ADM_ID;
        END IF;
        
        EXCEPTION
        WHEN NO_ADM_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_ADM_ID_EXCEPTION';
            O_ERRMSG := '환자 입원정보가 없습니다.';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
        
    END PROC_DEL_ADM_ROOMS;

END PKG_ADMISSION_ROOMS;