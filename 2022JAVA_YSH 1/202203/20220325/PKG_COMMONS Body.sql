CREATE OR REPLACE
PACKAGE BODY PKG_COMMONS AS

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
        VALUES(IN_GRP_ID,V_NEW_COM_ID,IN_COM_VAL, 'root',NULL,NULL,NULL);
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
        VALUES(IN_GRP_ID,V_NEW_COM_ID,IN_COM_VAL,V_NEW_ROOT_ID,NULL,NULL,NULL);
    END IF;
    
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
    
    --GRP_ID 존재 확인
    
    --COM_ID 존재 확인
    
    --SELECT
    
    NULL;
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
  BEGIN
    
    --GRP_ID 존재 확인
    
    --COM_ID 존재 확인
    
    --UPDATE
    
    NULL;
  END PROC_UP_COMMONS;

--GRP_DELETE
  PROCEDURE PROC_DEL_COMMONS_GRP
    (
        IN_GRP_ID       IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
  BEGIN
    --해당 GRPID에 속한 값들 모두 삭제
    
    --모든 테이블에 해당 COMMONS 값을 쓰는 것들 전부 삭제??
    NULL;
  END PROC_DEL_COMMONS_GRP;
  
--COM_DELETE
  PROCEDURE PROC_DEL_COMMONS_COM
    (
        IN_COM_ID       IN  VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
  BEGIN
    --해당 COMID 가진 값들 모두 삭제
    --해당 COMID를 PARENT_ID로 가진 값들 모두 삭제
    
    --모든 테이블에 해당 COMMONS 값을 쓰는 것들 전부 삭제??
    NULL;
  END PROC_DEL_COMMONS_COM;

END PKG_COMMONS;