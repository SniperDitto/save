create or replace NONEDITIONABLE PACKAGE BODY PKG_PATIENT AS

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 유승화
-- 업무설명 : PATIENT_TBL CRUD, 병원 방문자 리스트(접종 후 이상증상자의 병원 방문 목록)  

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

--INSERT
  PROCEDURE PROC_INS_PATIENT
    (
        IN_PER_ID   IN VARCHAR2
        ,IN_PAT_SYMP_GRP    IN VARCHAR2
        ,IN_PAT_SYMP        IN VARCHAR2
        ,IN_PAT_IN_DATE     IN VARCHAR2
        ,IN_HOS_ID          IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        --있으면 1, 없으면 0
        V_CHK_PER_ID    CHAR(1);
        V_CHK_HOS_ID    CHAR(1);
        V_CHK_SYMP_GRP  CHAR(1);
        V_CHK_SYMP      CHAR(1);
        
        V_NEW_PAT_ID    CHAR(6);
        
        NO_PER_ID_EXCEPTION EXCEPTION;
        NO_HOS_ID_EXCEPTION EXCEPTION;
        NO_GRP_ID_EXCEPTION EXCEPTION;
        NO_COM_ID_EXCEPTION EXCEPTION;
  BEGIN
    --1) 주민번호, 병원ID, GRP, COM 유효한지 체크
    --백신 접종자 중에서 몸이 안좋은 사람이 방문하는 것이므로
    --접종자 중에 있는지 체크
    SELECT DECODE(MAX(PER_ID),NULL,0,1), DECODE(MAX(HOS_ID),NULL,0,1)
    INTO V_CHK_PER_ID, V_CHK_HOS_ID
    FROM
    (
        --예약+접종 테이블
        SELECT T1.PER_ID, T1.HOS_ID
        FROM RESERVATION_TBL T1, INJECTION_TBL T2
        WHERE T1.RES_ID=T2.RES_ID
    )
    WHERE PER_ID=IN_PER_ID
        AND HOS_ID=IN_HOS_ID
    ;
    --COMMONS_TBL에서 체크
    SELECT DECODE(MAX(GRP_ID),NULL,0,1), DECODE(MAX(COM_ID),NULL,0,1)
    INTO V_CHK_SYMP_GRP, V_CHK_SYMP
    FROM COMMONS_TBL
    WHERE GRP_ID=IN_PAT_SYMP_GRP AND GRP_ID='GRP003'
        AND COM_ID=IN_PAT_SYMP AND PARENT_ID='COM201'
    ;
    
    IF V_CHK_PER_ID=0 THEN
        RAISE NO_PER_ID_EXCEPTION;
    ELSIF V_CHK_HOS_ID=0 THEN
        RAISE NO_HOS_ID_EXCEPTION;
    ELSIF V_CHK_SYMP_GRP=0 THEN
        RAISE NO_GRP_ID_EXCEPTION;
    ELSIF V_CHK_SYMP=0 THEN
        RAISE NO_COM_ID_EXCEPTION;
    ELSE
        --2) 다음 PAT_ID 생성
        SELECT 'PAT'||TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PAT_ID),'PAT000'),4,3))+1,'FM000')
        INTO V_NEW_PAT_ID
        FROM PATIENT_TBL
        ;
        --3) INSERT
        INSERT INTO PATIENT_TBL(PAT_ID, PER_ID, PAT_SYMP_GRP, PAT_SYMP, PAT_IN_DATE, HOS_ID)
        VALUES(V_NEW_PAT_ID, IN_PER_ID, IN_PAT_SYMP_GRP, IN_PAT_SYMP, IN_PAT_IN_DATE, IN_HOS_ID);
    END IF;
    
    
    EXCEPTION
        WHEN NO_PER_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PER_ID_EXCEPTION';
            O_ERRMSG := '접종자의 주민번호 중 일치하는 값이 없습니다';
        WHEN NO_HOS_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_HOS_ID_EXCEPTION';
            O_ERRMSG := '유효하지 않은 병원입니다';
        WHEN NO_GRP_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_GRP_ID_EXCEPTION';
            O_ERRMSG := '유효하지 않은 GRP_ID입니다';
        WHEN NO_COM_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_COM_ID_EXCEPTION';
            O_ERRMSG := '유효하지 않은 COM_ID입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_INS_PATIENT;


--SELECT
  PROCEDURE PROC_SEL_PATIENT
    (
        IN_PAT_ID   IN VARCHAR2
        ,IN_PER_ID  IN VARCHAR2
        ,O_CUR  OUT SYS_REFCURSOR
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
  BEGIN
    
    OPEN O_CUR FOR
    --PATIENT_TBL SELECT
    --방문아이디 방문자이름 증상 방문일 방문병원명
    SELECT T1.PAT_ID AS 방문아이디
        ,T2.PER_NAME AS 방문자명
        ,T4.COM_VAL||' 이상' AS 증상
        ,T1.PAT_IN_DATE AS 방문일
        ,T3.HOS_NAME AS 방문병원
    FROM PATIENT_TBL T1
        ,PERSON_TBL T2
        ,HOSPITAL_TBL T3
        ,COMMONS_TBL T4
    WHERE T1.PER_ID=T2.PER_ID
        AND T1.HOS_ID=T3.HOS_ID
        AND T1.PAT_SYMP_GRP=T4.GRP_ID
        AND T1.PAT_SYMP=T4.COM_ID
        AND T1.PAT_ID LIKE '%'||IN_PAT_ID||'%'
        AND T1.PER_ID LIKE '%'||IN_PER_ID||'%'
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_SEL_PATIENT;


--UPDATE
  PROCEDURE PROC_UP_PATIENT
    (
        IN_PAT_ID   IN VARCHAR2
        ,IN_PER_ID  IN VARCHAR2
        ,IN_PAT_SYMP_GRP    IN VARCHAR2
        ,IN_PAT_SYMP    IN VARCHAR2
        ,IN_PAT_IN_DATE     IN VARCHAR2
        ,IN_HOS_ID      IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        --있으면 1, 없으면 0
        V_CHK_PER_ID    CHAR(1);
        V_CHK_HOS_ID    CHAR(1);
        V_CHK_SYMP_GRP  CHAR(1);
        V_CHK_SYMP      CHAR(1);
        
        V_NEW_PAT_ID    CHAR(6);
        
        NO_PER_ID_EXCEPTION EXCEPTION;
        NO_HOS_ID_EXCEPTION EXCEPTION;
        NO_GRP_ID_EXCEPTION EXCEPTION;
        NO_COM_ID_EXCEPTION EXCEPTION;
  BEGIN
    --1) 주민번호, 병원ID, GRP, COM 유효한지 체크
    --백신 접종자 중에서 몸이 안좋은 사람이 방문하는 것이므로
    --접종자 중에 있는지 체크
    SELECT DECODE(MAX(PER_ID),NULL,0,1), DECODE(MAX(HOS_ID),NULL,0,1)
    INTO V_CHK_PER_ID, V_CHK_HOS_ID
    FROM
    (
        --예약+접종 테이블
        SELECT T1.PER_ID, T1.HOS_ID
        FROM RESERVATION_TBL T1, INJECTION_TBL T2
        WHERE T1.RES_ID=T2.RES_ID
    )
    WHERE PER_ID=IN_PER_ID
        AND HOS_ID=IN_HOS_ID
    ;
    --COMMONS_TBL에서 체크
    SELECT DECODE(MAX(GRP_ID),NULL,0,1), DECODE(MAX(COM_ID),NULL,0,1)
    INTO V_CHK_SYMP_GRP, V_CHK_SYMP
    FROM COMMONS_TBL
    WHERE GRP_ID=IN_PAT_SYMP_GRP AND GRP_ID='GRP003'
        AND COM_ID=IN_PAT_SYMP AND PARENT_ID='COM201'
    ;
    
    IF V_CHK_PER_ID=0 THEN
        RAISE NO_PER_ID_EXCEPTION;
    ELSIF V_CHK_HOS_ID=0 THEN
        RAISE NO_HOS_ID_EXCEPTION;
    ELSIF V_CHK_SYMP_GRP=0 THEN
        RAISE NO_GRP_ID_EXCEPTION;
    ELSIF V_CHK_SYMP=0 THEN
        RAISE NO_COM_ID_EXCEPTION;
    ELSE
        --2) UPDATE
        UPDATE PATIENT_TBL
        SET
            PER_ID=IN_PER_ID
            ,PAT_SYMP_GRP=IN_PAT_SYMP_GRP
            ,PAT_SYMP=IN_PAT_SYMP
            ,PAT_IN_DATE=IN_PAT_IN_DATE
            ,HOS_ID=IN_HOS_ID
        WHERE PAT_ID=IN_PAT_ID
        ;
    END IF;
    
    
    EXCEPTION
        WHEN NO_PER_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PER_ID_EXCEPTION';
            O_ERRMSG := '접종자의 주민번호 중 일치하는 값이 없습니다';
        WHEN NO_HOS_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_HOS_ID_EXCEPTION';
            O_ERRMSG := '유효하지 않은 병원입니다';
        WHEN NO_GRP_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_GRP_ID_EXCEPTION';
            O_ERRMSG := '유효하지 않은 GRP_ID입니다';
        WHEN NO_COM_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_COM_ID_EXCEPTION';
            O_ERRMSG := '유효하지 않은 COM_ID입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_UP_PATIENT;


--DELETE
  PROCEDURE PROC_DEL_PATIENT
    (
        IN_PAT_ID   IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_PAT_ID    CHAR(1);
        NO_PAT_ID_EXCEPTION EXCEPTION;
  BEGIN
    --1) IN_PAT_ID 유효한지 확인
    SELECT DECODE(MAX(PAT_ID),NULL,0,1)
    INTO V_CHK_PAT_ID
    FROM PATIENT_TBL
    WHERE PAT_ID=IN_PAT_ID
    ;
    IF V_CHK_PAT_ID=0 THEN
        RAISE NO_PAT_ID_EXCEPTION;
    ELSE
        --2) DELETE
        DELETE FROM PATIENT_TBL
        WHERE PAT_ID=IN_PAT_ID
        ;
    END IF;
    
    EXCEPTION
        WHEN NO_PAT_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PAT_ID_EXCEPTION';
            O_ERRMSG := '없는 PAT_ID입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_DEL_PATIENT;

END PKG_PATIENT;