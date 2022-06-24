create or replace NONEDITIONABLE PACKAGE BODY PKG_PERSON AS

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 유승화
-- 업무설명 : PERSON_TBL CRUD

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    
*/
------------------------------------------

    --INSERT
  PROCEDURE PROC_INS_PERSON
    (
        IN_PER_ID           IN  VARCHAR2
        ,IN_PER_NAME        IN  VARCHAR2
        ,IN_PER_GENDER      IN  VARCHAR2
        ,IN_PER_TEL         IN  VARCHAR2
        ,IN_PER_ADDR_GRP    IN  VARCHAR2
        ,IN_PER_ADDR        IN  VARCHAR2
        ,O_ERRCODE          OUT VARCHAR2
        ,O_ERRMSG           OUT VARCHAR2
    ) AS
        V_CHK_PER_ID    CHAR(1); --없으면 0 / 중복시 1
        V_CHK_ADDR_GRP  CHAR(1);
        V_CHK_ADDR      CHAR(1);
        
        PERSON_EXIST_EXCEPTION  EXCEPTION;
        NOT_VALID_GRP_ID_EXCEPTION  EXCEPTION;
        NOT_VALID_COM_ID_EXCEPTION  EXCEPTION;
  BEGIN
    
    --주민번호중복확인
        SELECT DECODE(MAX(PER_ID),NULL,0,1)
        INTO V_CHK_PER_ID
        FROM PERSON_TBL
        WHERE PER_ID=IN_PER_ID
        ;
        --주민번호 자체의 유효성 검사는 생략합니다...
    --주소 GRP COM 확인
    --COMMONS_TBL에서 체크
    SELECT DECODE(MAX(GRP_ID),NULL,0,1), DECODE(MAX(COM_ID),NULL,0,1)
    INTO V_CHK_ADDR_GRP, V_CHK_ADDR
    FROM COMMONS_TBL
    WHERE GRP_ID=IN_PER_ADDR_GRP AND GRP_ID='GRP001'
        AND COM_ID=IN_PER_ADDR AND PARENT_ID='COM001'
    ;
    
    IF V_CHK_PER_ID=1 THEN
        RAISE PERSON_EXIST_EXCEPTION;
    ELSIF V_CHK_ADDR_GRP=0 THEN
        RAISE NOT_VALID_GRP_ID_EXCEPTION;
    ELSIF V_CHK_ADDR=0 THEN
        RAISE NOT_VALID_COM_ID_EXCEPTION;
    ELSE
    --사람추가
        INSERT INTO PERSON_TBL(PER_ID, PER_NAME, PER_GENDER, PER_TEL, PER_ADDR_GRP, PER_ADDR)
        VALUES(IN_PER_ID, IN_PER_NAME, IN_PER_GENDER, IN_PER_TEL, IN_PER_ADDR_GRP, IN_PER_ADDR)
        ;
    END IF;
    
    EXCEPTION
        WHEN PERSON_EXIST_EXCEPTION THEN
            O_ERRCODE := 'PERSON_EXIST_EXCEPTION';
            O_ERRMSG := '이미 존재하는 주민번호입니다';
        WHEN NOT_VALID_GRP_ID_EXCEPTION THEN
            O_ERRCODE := 'NOT_VALID_GRP_ID_EXCEPTION';
            O_ERRMSG := '올바르지 않은 GRP_ID입니다';
        WHEN NOT_VALID_COM_ID_EXCEPTION THEN
            O_ERRCODE := 'NOT_VALID_COM_ID_EXCEPTION';
            O_ERRMSG := '올바르지 않은 COM_ID입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_INS_PERSON;


    --SELECT
  PROCEDURE PROC_SEL_PERSON
    (
        IN_PER_ID       IN      VARCHAR2
        ,IN_PER_NAME    IN      VARCHAR2
        ,IN_PER_GENDER  IN      VARCHAR2
        ,IN_PER_TEL     IN      VARCHAR2
        ,IN_PER_ADDR_VAL    IN  VARCHAR2
        ,O_CUR          OUT     SYS_REFCURSOR
        ,O_ERRCODE      OUT     VARCHAR2
        ,O_ERRMSG       OUT     VARCHAR2
    ) AS
  BEGIN
    
    OPEN O_CUR FOR
    --PERSON_TBL SELECT
    --이름 주민번호 성별 전화번호 주소
    SELECT T1.PER_NAME AS 이름
        ,T1.PER_ID AS 주민번호
        ,T1.PER_GENDER AS 성별
        ,T1.PER_TEL AS 전화번호
        ,'부산광역시 '||T2.COM_VAL AS 주소
    FROM PERSON_TBL T1
        ,COMMONS_TBL T2
    WHERE T1.PER_ADDR_GRP=T2.GRP_ID
        AND T1.PER_ADDR=T2.COM_ID
        AND T1.PER_ID LIKE '%'||IN_PER_ID||'%'
        AND T1.PER_NAME LIKE '%'||IN_PER_NAME||'%'
        AND T1.PER_GENDER LIKE '%'||IN_PER_GENDER||'%'
        AND T1.PER_TEL LIKE '%'||IN_PER_TEL||'%'
        AND TRIM(T2.COM_VAL) LIKE '%'||TRIM(IN_PER_ADDR_VAL)||'%'
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
    
  END PROC_SEL_PERSON;


    --UPDATE
  PROCEDURE PROC_UP_PERSON
    (
        IN_PER_ID           IN  VARCHAR2
        ,IN_PER_NAME        IN  VARCHAR2
        ,IN_PER_GENDER      IN  VARCHAR2
        ,IN_PER_TEL         IN  VARCHAR2
        ,IN_PER_ADDR_GRP    IN  VARCHAR2
        ,IN_PER_ADDR        IN  VARCHAR2
        ,O_ERRCODE          OUT VARCHAR2
        ,O_ERRMSG           OUT VARCHAR2
    ) AS
        V_CHK_PER_ID    CHAR(1); --있으면 1 없으면 0
        V_CHK_ADDR_GRP  CHAR(1);
        V_CHK_ADDR      CHAR(1);
        
        NOT_VALID_GRP_ID_EXCEPTION  EXCEPTION;
        NOT_VALID_COM_ID_EXCEPTION  EXCEPTION;
        NO_PERSON_EXCEPTION         EXCEPTION;
  BEGIN
  --주민번호 존재 확인
    SELECT DECODE(MAX(PER_ID),NULL,0,1)
    INTO V_CHK_PER_ID
    FROM PERSON_TBL
    WHERE PER_ID=IN_PER_ID
    ;
    --COMMONS_TBL에서 체크
    SELECT DECODE(MAX(GRP_ID),NULL,0,1), DECODE(MAX(COM_ID),NULL,0,1)
    INTO V_CHK_ADDR_GRP, V_CHK_ADDR
    FROM COMMONS_TBL
    WHERE GRP_ID=IN_PER_ADDR_GRP AND GRP_ID='GRP001'
        AND COM_ID=IN_PER_ADDR AND PARENT_ID='COM001'
    ;
    
    --존재여부에 따라 예외처리/수정
    IF V_CHK_PER_ID=0 THEN
        RAISE NO_PERSON_EXCEPTION;
    ELSIF V_CHK_ADDR_GRP=0 THEN
        RAISE NOT_VALID_GRP_ID_EXCEPTION;
    ELSIF V_CHK_ADDR=0 THEN
        RAISE NOT_VALID_COM_ID_EXCEPTION;
    ELSE
        UPDATE PERSON_TBL
        SET PER_NAME=IN_PER_NAME
            ,PER_GENDER=IN_PER_GENDER
            ,PER_TEL=IN_PER_TEL
            ,PER_ADDR_GRP=IN_PER_ADDR_GRP
            ,PER_ADDR=IN_PER_ADDR
        WHERE PER_ID=IN_PER_ID;
    END IF;
    
    EXCEPTION
        WHEN NO_PERSON_EXCEPTION THEN
            O_ERRCODE := 'NO_PERSON_EXCEPTION';
            O_ERRMSG := '주민번호가 일치하는 사람이 없습니다';
        WHEN NOT_VALID_GRP_ID_EXCEPTION THEN
            O_ERRCODE := 'NOT_VALID_GRP_ID_EXCEPTION';
            O_ERRMSG := '올바르지 않은 GRP_ID입니다';
        WHEN NOT_VALID_COM_ID_EXCEPTION THEN
            O_ERRCODE := 'NOT_VALID_COM_ID_EXCEPTION';
            O_ERRMSG := '올바르지 않은 COM_ID입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_UP_PERSON;


    --DELETE
  PROCEDURE PROC_DEL_PERSON
    (
        IN_PER_ID       IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        --딸려서 같이 삭제될 ID들 저장
        V_DEL_RES_ID    VARCHAR2(6);
        V_DEL_ADM_ID    VARCHAR2(6);
        --존재여부 0:없음/1:존재
        V_CHK_PERSON        CHAR(1);
        /*
        V_CHK_RESERVATION   CHAR(1);
        V_CHK_INJECTION     CHAR(1);
        V_CHK_PATIENT       CHAR(1);
        V_CHK_TREAT         CHAR(1);
        V_CHK_ADMISSION     CHAR(1);
        V_CHK_ROOMS         CHAR(1);
        V_CHK_MEDICINE      CHAR(1);
        V_CHK_DISCHARGE     CHAR(1);
        */
        --예외들
        NO_PERSON_EXCEPTION         EXCEPTION;
        /*
        NO_RESERVATION_EXCEPTION    EXCEPTION;
        NO_INJECTION_EXCEPTION      EXCEPTION;
        NO_PATIENT_EXCEPTION        EXCEPTION;
        NO_TREAT_EXCEPTION          EXCEPTION;
        NO_ADMISSION_EXCEPTION      EXCEPTION;
        NO_A_ROOMS_EXCEPTION        EXCEPTION;
        NO_A_MEDICINE_EXCEPTION     EXCEPTION;
        NO_DISCHARGE_EXCEPTION      EXCEPTION;
        */
  BEGIN
    
    --사람이 포함된 모든 데이터도 함께 삭제?
    --1. PERSON_TBL에서 삭제
        --사람 있는지 확인
        SELECT DECODE(MAX(PER_ID),NULL,0,1)
        INTO V_CHK_PERSON
        FROM PERSON_TBL
        WHERE PER_ID=IN_PER_ID
        ;
        --없으면 예외발생, 있으면 삭제
        IF V_CHK_PERSON=0 THEN
            RAISE NO_PERSON_EXCEPTION;
        ELSE
            DELETE FROM PERSON_TBL
            WHERE PER_ID=IN_PER_ID
            ;
        END IF;
/*
    --2. RESERVATION_TBL에서 삭제
        --예약건 있는지 확인
        SELECT DECODE(MAX(PER_ID),NULL,0,1)
        INTO V_CHK_RESERVATION
        FROM RESERVATION_TBL
        WHERE PER_ID=IN_PER_ID
        ;
        --없으면 예외발생, 있으면 삭제
        IF V_CHK_RESERVATION=0 THEN
            RAISE NO_RESERVATION_EXCEPTION;
        ELSE
            --삭제 전 해당 예약건 삭제 위해 RES_ID 저장
            SELECT RES_ID
            INTO V_DEL_RES_ID
            FROM RESERVATION_TBL
            WHERE PER_ID=IN_PER_ID
            ;
            DELETE FROM RESERVATION_TBL
            WHERE PER_ID=IN_PER_ID
            ;
            --2-1. INJECTION_TBL에서 해당 예약건도 삭제
            --접종건 있는지 확인
            SELECT DECODE(MAX(RES_ID),NULL,0,1)
            INTO V_CHK_INJECTION
            FROM INJECTION_TBL
            WHERE RES_ID=V_DEL_RES_ID
            ;
            --없으면 예외발생, 있으면 삭제
            IF V_CHK_PERSON=0 THEN
                RAISE NO_INJECTION_EXCEPTION;
            ELSE
                DELETE FROM INJECTION_TBL
                WHERE RES_ID=V_DEL_RES_ID
                ;
            END IF;
        END IF;
    --3. PATIENT_TBL에서 삭제
        --병원방문건 있는지 확인
        SELECT DECODE(MAX(PER_ID),NULL,0,1)
        INTO V_CHK_PATIENT
        FROM PATIENT_TBL
        WHERE PER_ID=IN_PER_ID
        ;
        --없으면 예외발생, 있으면 삭제
        IF V_CHK_PATIENT=0 THEN
            RAISE NO_PATIENT_EXCEPTION;
        ELSE
            DELETE FROM PATIENT_TBL
            WHERE PER_ID=IN_PER_ID
            ;
        END IF;
        --3-1. TREAT_TBL에서 해당 진료건도 삭제
            --진료건 있는지 확인
            SELECT DECODE(MAX(PER_ID),NULL,0,1)
            INTO V_CHK_TREAT
            FROM TREAT_TBL
            WHERE PER_ID=IN_PER_ID
            ;
            --없으면 예외발생, 있으면 삭제
            IF V_CHK_TREAT=0 THEN
                RAISE NO_TREAT_EXCEPTION;
            ELSE
                DELETE FROM TREAT_TBL
                WHERE PER_ID=IN_PER_ID
                ;
            END IF;
            
    --4. ADMISSION_TBL에서 삭제
        --입원건 있는지 확인
        SELECT DECODE(MAX(PER_ID),NULL,0,1)
        INTO V_CHK_ADMISSION
        FROM ADMISSION_TBL
        WHERE PER_ID=IN_PER_ID
        ;
        --없으면 예외발생, 있으면 삭제
        IF V_CHK_ADMISSION=0 THEN
            RAISE NO_ADMISSION_EXCEPTION;
        ELSE
            --삭제 전 해당 입원건 삭제 위해 ADM_ID 저장
            SELECT ADM_ID
            INTO V_DEL_ADM_ID
            FROM ADMISSION_TBL
            WHERE PER_ID=IN_PER_ID
            ;
            DELETE FROM ADMISSION_TBL
            WHERE PER_ID=IN_PER_ID
            ;
        END IF;
        --4-1. ADMISSION_ROOMS_TBL에서 해당 입원건 삭제
            --있는지 확인
            SELECT DECODE(MAX(ADM_ID),NULL,0,1)
            INTO V_CHK_ROOMS
            FROM ADMISSION_ROOMS_TBL
            WHERE ADM_ID=V_DEL_ADM_ID
            ;
            --없으면 예외발생, 있으면 삭제
            IF V_CHK_ROOMS=0 THEN
                RAISE NO_A_ROOMS_EXCEPTION;
            ELSE
                DELETE FROM ADMISSION_ROOMS_TBL
                WHERE ADM_ID=V_DEL_ADM_ID
                ;
            END IF;
        --4-2. ADMISSION_MEDICINES_TBL에서 해당 입원건 삭제
            --있는지 확인
            SELECT DECODE(MAX(ADM_ID),NULL,0,1)
            INTO V_CHK_MEDICINE
            FROM ADMISSION_MEDICINES_TBL
            WHERE ADM_ID=V_DEL_ADM_ID
            ;
            --없으면 예외발생, 있으면 삭제
            IF V_CHK_MEDICINE=0 THEN
                RAISE NO_A_MEDICINE_EXCEPTION;
            ELSE
                DELETE FROM ADMISSION_MEDICINES_TBL
                WHERE ADM_ID=V_DEL_ADM_ID
                ;
            END IF;
        --4-3. DISCHARGE_TBL에서 해당 입원건 삭제
            --퇴원건 있는지 확인
            SELECT DECODE(MAX(ADM_ID),NULL,0,1)
            INTO V_CHK_DISCHARGE
            FROM DISCHARGE_TBL
            WHERE ADM_ID=V_DEL_ADM_ID
            ;
            --없으면 예외발생, 있으면 삭제
            IF V_CHK_DISCHARGE=0 THEN
                RAISE NO_DISCHARGE_EXCEPTION;
            ELSE
                DELETE FROM DISCHARGE_TBL
                WHERE ADM_ID=V_DEL_ADM_ID
                ;
            END IF;
            */
------------------------------------------------

    EXCEPTION
        WHEN NO_PERSON_EXCEPTION THEN
            O_ERRCODE := 'NO_PERSON_EXCEPTION';
            O_ERRMSG := '존재하지 않는 주민번호입니다';
        /*
        WHEN NO_RESERVATION_EXCEPTION  THEN
            O_ERRCODE := 'NO_RESERVATION_EXCEPTION ';
            O_ERRMSG := '존재하지 않는 예약건입니다';
        WHEN NO_INJECTION_EXCEPTION  THEN
            O_ERRCODE := 'NO_INJECTION_EXCEPTION ';
            O_ERRMSG := '존재하지 않는 접종건입니다';
        WHEN NO_PATIENT_EXCEPTION  THEN
            O_ERRCODE := 'NO_PATIENT_EXCEPTION ';
            O_ERRMSG := '존재하지 않는 병원방문건입니다';
        WHEN NO_TREAT_EXCEPTION  THEN
            O_ERRCODE := 'NO_TREAT_EXCEPTION ';
            O_ERRMSG := '존재하지 않는 진료건입니다';
        WHEN NO_ADMISSION_EXCEPTION  THEN
            O_ERRCODE := 'NO_ADMISSION_EXCEPTION ';
            O_ERRMSG := '존재하지 않는 입원건입니다';
        WHEN NO_A_ROOMS_EXCEPTION  THEN
            O_ERRCODE := 'NO_A_ROOMS_EXCEPTION ';
            O_ERRMSG := '존재하지 않는 병실사용건입니다';
        WHEN NO_A_MEDICINE_EXCEPTION  THEN
            O_ERRCODE := 'NO_A_MEDICINE_EXCEPTION ';
            O_ERRMSG := '존재하지 않는 약 처방건입니다';
        WHEN NO_DISCHARGE_EXCEPTION  THEN
            O_ERRCODE := 'NO_DISCHARGE_EXCEPTION ';
            O_ERRMSG := '존재하지 않는 퇴원건입니다';
        */
        -----------------------------------------------
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
    
  END PROC_DEL_PERSON;

END PKG_PERSON;