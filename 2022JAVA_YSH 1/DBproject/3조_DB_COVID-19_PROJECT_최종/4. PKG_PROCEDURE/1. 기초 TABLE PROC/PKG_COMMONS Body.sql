create or replace NONEDITIONABLE PACKAGE BODY PKG_COMMONS AS

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 유승화
-- 업무설명 : COMMONS_TBL CRUD

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    
*/
------------------------------------------


--COM_INSERT
  PROCEDURE PROC_INS_COMMONS
    (
        IN_GRP_ID       IN  VARCHAR2
        ,IN_COM_VAL     IN  VARCHAR2
        ,IN_PARENT_ID   IN  VARCHAR2
        ,IN_EXP_VAL1    IN  VARCHAR2
        ,IN_EXP_VAL2    IN  VARCHAR2
        ,IN_EXP_VAL3    IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_GRP       CHAR(1);--존재시 1 없으면 0
        V_NEW_COM_ID    CHAR(6);
        V_NEW_ROOT_ID   CHAR(6);
  BEGIN
  --COM_ID 중복 없는걸로 가정했습니다
  --GRP_ID 달라도 COM_ID 중복 안되는걸로 가정
    
    --존재하는 GRP_ID인지 판단
    SELECT DECODE(MAX(GRP_ID),NULL,0,1)
    INTO V_CHK_GRP
    FROM COMMONS_TBL
    WHERE GRP_ID=IN_GRP_ID
    ;
    
    IF V_CHK_GRP=0 THEN
    --입력된 GRP_ID가 없는 GRP_ID면 사용하기로 하고
    --새로운 ROOT의 COM_ID 생성
        --COM*00 : 별표친곳 숫자 이용해서 만들기
        --MAX가 COM507이면 다음 COM_ID는 COM601
        --맨처음 COM_ID는 COM001
        SELECT 'COM'||TO_CHAR(TO_NUMBER(NVL(SUBSTR(MAX(COM_ID),4,1),-1))+1)||'01'
        INTO V_NEW_COM_ID
        FROM COMMONS_TBL
        WHERE PARENT_ID='root'
        ;
    --ROOT삽입
        INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3)
        VALUES(IN_GRP_ID, V_NEW_COM_ID, IN_COM_VAL, 'root', NULL, NULL, NULL);
    ELSE
    --입력된 GRP_ID가 존재하는 GRP_ID면
    --입력할 값의 PARENT_ID에 들어갈 값 저장
        SELECT COM_ID
        INTO V_NEW_ROOT_ID
        FROM COMMONS_TBL
        WHERE GRP_ID=IN_GRP_ID
        ;
    --해당 GRP_ID에 맞는 COM_ID 생성
    --ROOT의 COM_ID는 COM**1로 이미 존재할 것이다
        SELECT 'COM'||TO_CHAR(TO_NUMBER(SUBSTR(MAX(COM_ID),4,3)+1),'FM000')
        INTO V_NEW_COM_ID
        FROM COMMONS_TBL
        WHERE PARENT_ID=V_NEW_ROOT_ID
        ;
    --값 삽입
        INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3)
        VALUES(IN_GRP_ID, V_NEW_COM_ID, IN_COM_VAL, V_NEW_ROOT_ID, NULL, NULL, NULL);
    END IF;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
    
  END PROC_INS_COMMONS;


--COM_SELECT
  PROCEDURE PROC_SEL_COMMONS
    (
        IN_GRP_ID       IN  VARCHAR2
        ,IN_COM_ID      IN  VARCHAR2
        ,IN_COM_VAL     IN  VARCHAR2
        ,O_CUR          OUT SYS_REFCURSOR
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
  BEGIN
    
    OPEN O_CUR FOR
    --COMMONS_TBL SELECT
    --값 / 비고1 / 비고2 / 비고3
    SELECT GRP_ID
        , DECODE(TRIM(PARENT_ID),'root','--- ','')||COM_VAL||DECODE(TRIM(PARENT_ID),'root',' ---','') AS COM_VAL
        , COM_ID
        , PARENT_ID
        , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(EXP_VAL1)),'([0-9]{3})','\1,')),'^,','') AS EXP_VAL1
        , EXP_VAL2
        , EXP_VAL3
    FROM COMMONS_TBL
    WHERE GRP_ID LIKE '%'||IN_GRP_ID||'%'
        AND COM_ID LIKE '%'||IN_COM_ID||'%'
        AND TRIM(COM_VAL) LIKE '%'||TRIM(IN_COM_VAL)||'%'
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_SEL_COMMONS;


--COM_UPDATE
  PROCEDURE PROC_UP_COMMONS
    (
        IN_GRP_ID       IN  VARCHAR2
        ,IN_COM_ID      IN  VARCHAR2
        ,IN_COM_VAL     IN  VARCHAR2
        ,IN_PARENT_ID   IN  VARCHAR2
        ,IN_EXP_VAL1    IN  VARCHAR2
        ,IN_EXP_VAL2    IN  VARCHAR2
        ,IN_EXP_VAL3    IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        --있으면 1, 없으면 0
        V_CHK_GRP_ID    CHAR(1);
        V_CHK_COM_ID    CHAR(1);
        V_CHK_PARENT_ID CHAR(1);
        
        NO_GRP_ID_EXCEPTION EXCEPTION;
        EXIST_COM_ID_EXCEPTION EXCEPTION;
        NO_PARENT_ID_EXCEPTION  EXCEPTION;
  BEGIN
  --COM_ID 중복 없는걸로 가정했습니다
  --GRP_ID 달라도 COM_ID 중복 안되는걸로 가정
    
    --GRP_ID 존재 확인
    SELECT DECODE(MAX(GRP_ID),NULL,0,1)
    INTO V_CHK_GRP_ID
    FROM COMMONS_TBL
    WHERE GRP_ID=IN_GRP_ID
    ;
    IF V_CHK_GRP_ID=0 THEN
        RAISE NO_GRP_ID_EXCEPTION;
    ELSE
    --COM_ID 중복 확인
        SELECT DECODE(MAX(COM_ID),NULL,0,1)
        INTO V_CHK_COM_ID
        FROM COMMONS_TBL
        WHERE COM_ID=IN_COM_ID
        ;
        IF V_CHK_COM_ID=1 THEN
            RAISE EXIST_COM_ID_EXCEPTION;
        ELSE
            --PARENT_ID 확인
            SELECT DECODE(MAX(COM_ID),NULL,0,1)
            INTO V_CHK_PARENT_ID
            FROM COMMONS_TBL
            WHERE COM_ID=IN_PARENT_ID
            ;
            IF V_CHK_PARENT_ID=0 THEN
                RAISE NO_PARENT_ID_EXCEPTION;
            ELSE
                --UPDATE
                UPDATE COMMONS_TBL
                SET
                    GRP_ID=IN_GRP_ID
                    ,COM_ID=IN_COM_ID
                    ,COM_VAL=IN_COM_VAL
                    ,PARENT_ID=IN_PARENT_ID
                    ,EXP_VAL1=IN_EXP_VAL1
                    ,EXP_VAL2=IN_EXP_VAL2
                    ,EXP_VAL3=IN_EXP_VAL3
                ;
            END IF;
        END IF;
    END IF;
    
    EXCEPTION
        WHEN NO_GRP_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_GRP_ID_EXCEPTION';
            O_ERRMSG := '없는 GRP_ID 입니다';
        WHEN EXIST_COM_ID_EXCEPTION THEN
            O_ERRCODE := 'EXIST_COM_ID_EXCEPTION';
            O_ERRMSG := '이미 존재하는 COM_ID 입니다';
        WHEN NO_PARENT_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PARENT_ID_EXCEPTION';
            O_ERRMSG := '입력한 PARENT_ID를 COM_ID로 갖는 값이 없습니다(부모 값 없음)';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_UP_COMMONS;


--GRP_DELETE
  PROCEDURE PROC_DEL_COMMONS_GRP
    (
        IN_GRP_ID       IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_GRP_ID    CHAR(1);
        
        NO_GRP_ID_EXCEPTION EXCEPTION;
  BEGIN

    -- GRP_ID 존재하는지 체크
        SELECT DECODE(MAX(GRP_ID),NULL,0,1)
        INTO V_CHK_GRP_ID
        FROM COMMONS_TBL
        WHERE GRP_ID=IN_GRP_ID
        ;
        IF V_CHK_GRP_ID=0 THEN
            RAISE NO_GRP_ID_EXCEPTION;
        ELSE
            --해당 GRP_ID에 속한 값들 모두 삭제
            DELETE FROM COMMONS_TBL
            WHERE GRP_ID=IN_GRP_ID
            ;
        END IF;
    
    --모든 테이블에 해당 GRP_ID 값을 쓰는 것들 전부 삭제??
    
    EXCEPTION
        WHEN NO_GRP_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_GRP_ID_EXCEPTION';
            O_ERRMSG := '없는 GRP_ID 입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_DEL_COMMONS_GRP;
  
  
--COM_DELETE
  PROCEDURE PROC_DEL_COMMONS_COM
    (
        IN_COM_ID       IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_COM_ID    CHAR(1);
        V_CHK_PARENT_ID CHAR(1);
        
        NO_COM_ID_EXCEPTION EXCEPTION;
        NO_PARENT_ID_EXCEPTION  EXCEPTION;
  BEGIN
  --COM_ID 중복 없는걸로 가정했습니다
  --GRP_ID 달라도 COM_ID 중복 안되는걸로 가정
    --COM_ID 존재하는지 체크
    SELECT DECODE(MAX(COM_ID),NULL,0,1)
    INTO V_CHK_COM_ID
    FROM COMMONS_TBL
    WHERE COM_ID=IN_COM_ID
    ;
    IF V_CHK_COM_ID=0 THEN
        RAISE NO_COM_ID_EXCEPTION;
    ELSE
    --해당 COM_ID 가진 값들 모두 삭제
        DELETE FROM COMMONS_TBL
        WHERE COM_ID=IN_COM_ID
        ;
        --해당 COM_ID를 PARENT_ID로 가진 값이 있는지?
        SELECT DECODE(MAX(COM_ID),NULL,0,1)
        INTO V_CHK_PARENT_ID
        FROM COMMONS_TBL
        WHERE PARENT_ID=IN_COM_ID
        ;
        IF V_CHK_PARENT_ID=0 THEN
            RAISE NO_PARENT_ID_EXCEPTION;
        ELSE
        --해당 값들 모두 삭제
            DELETE FROM COMMONS_TBL
            WHERE PARENT_ID=IN_COM_ID
            ;
        END IF;
    END IF;
    
    --모든 테이블에 해당 COMMONS 값을 쓰는 것들 전부 삭제??
    
    EXCEPTION
        WHEN NO_COM_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_COM_ID_EXCEPTION';
            O_ERRMSG := '없는 COM_ID 입니다';
        WHEN NO_PARENT_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_PARENT_ID_EXCEPTION2';
            O_ERRMSG := '해당 COM_ID를 PARENT_ID로 갖는 값이 없습니다(삭제할 자식 값 없음)';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_DEL_COMMONS_COM;

END PKG_COMMONS;