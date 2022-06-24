create or replace NONEDITIONABLE PACKAGE BODY PKG_HOSPITAL AS

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 최문준
-- 업무설명 : HOSPITAL_TBL CRUD

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    20220329   김정희     SELECT문 수정
*/
------------------------------------------

-- INSERT
    PROCEDURE PROC_INS_HOSPITAL
(
    IN_HOS_ID               IN VARCHAR2
    , IN_HOS_NAME	        IN VARCHAR2
	, IN_HOS_ADDR_GRP	    IN VARCHAR2   
	, IN_HOS_ADDR	        IN VARCHAR2		    
	, IN_HOS_ROOM_QTY	    IN VARCHAR2		    
	, IN_HOS_OPEN_DATE      IN VARCHAR2	
    , O_ERRCODE       OUT     VARCHAR2
    , O_ERRMSG        OUT     VARCHAR2  
)
AS
    -- 병원 ID 체크
    V_CHK_HOS_ID    CHAR(1);
    
    --새로운 HOS_ID 생성
    V_NEW_HOS_ID    CHAR(6);

    NO_HOS_ID_EXCEPTION     EXCEPTION;
    
BEGIN
-- 1) 병원 ID 유효한지 체크
    SELECT DECODE(MAX(HOS_ID),NULL,0,1)
        INTO V_CHK_HOS_ID
        FROM HOSPITAL_TBL
        WHERE HOS_ID=IN_HOS_ID
        ;
    IF V_CHK_HOS_ID=0 THEN
    RAISE NO_HOS_ID_EXCEPTION;
    
    ELSE
        --2) 다음 HOS_ID 생성
        SELECT 'HOS'||TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(HOS_ID),'HOS000'),4,3))+1,'FM000')
        INTO V_NEW_HOS_ID
        FROM HOSPITAL_TBL
        ;
       --3) 값 넣기
        INSERT INTO HOSPITAL_TBL(HOS_ID, HOS_ADDR_GRP, HOS_ADDR, HOS_ROOM_QTY, HOS_OPEN_DATE)
        VALUES(IN_HOS_ID, IN_HOS_ADDR_GRP, IN_HOS_ADDR, IN_HOS_ROOM_QTY, IN_HOS_OPEN_DATE);
    END IF;
    
    EXCEPTION
        WHEN NO_HOS_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_HOS_ID_EXCEPTION';
            O_ERRMSG := '이미 있는 병원입니다';

  END PROC_INS_HOSPITAL;
  
  
  -- SELECT
  PROCEDURE PROC_SEL_HOSPITAL
(
    IN_HOS_ID          IN     VARCHAR2
    ,IN_HOS_NAME        IN     VARCHAR2
    , O_CUR           OUT     SYS_REFCURSOR
    , O_ERRCODE       OUT     VARCHAR2
    , O_ERRMSG        OUT     VARCHAR2  
) AS
BEGIN

    OPEN O_CUR FOR
    SELECT IN_HOS_ID, IN_HOS_NAME
        , SUM(VAC001) AS VAC001_TLT
        , SUM(VAC002) AS VAC002_TLT
        , SUM(VAC003) AS VAC003_TLT
        , SUM(VAC004) AS VAC004_TLT
        , SUM(VAC005) AS VAC005_TLT
        , SUM(VAC001) + SUM(VAC002) + SUM(VAC003) + SUM(VAC004) + SUM(VAC005) AS TLT
    FROM
    (
        SELECT 
            HOS_ID,HOS_NAME,
            DECODE(VAC_ID, 'VAC001', REMAIN_CNT, 0) AS VAC001,
            DECODE(VAC_ID, 'VAC002', REMAIN_CNT, 0) AS VAC002,
            DECODE(VAC_ID, 'VAC003', REMAIN_CNT, 0) AS VAC003,
            DECODE(VAC_ID, 'VAC004', REMAIN_CNT, 0) AS VAC004,
            DECODE(VAC_ID, 'VAC005', REMAIN_CNT, 0) AS VAC005
        FROM
        (
    
    
            SELECT TBL1.HOS_ID, TBL1.HOS_NAME, TBL1.VAC_ID
                   , TBL1.VAC_NAME, TBL1.VAC_QTY, TBL2.INJ_CNT,
                   NVL(TBL1.VAC_QTY, 0) - NVL(TBL2.INJ_CNT, 0) AS REMAIN_CNT
            FROM
            (
                SELECT A.HOS_ID, A.HOS_NAME, A.VAC_ID, D.COM_VAL AS VAC_NAME, B.VAC_QTY
                FROM
                (
                    SELECT T1.HOS_ID, T1.HOS_NAME, T2.VAC_ID
                    FROM HOSPITAL_TBL T1, VACCINE_TBL T2
                    ORDER BY T1.HOS_ID ASC, T2.VAC_ID ASC
                ) A, VACCINE_IN_TBL B, VACCINE_TBL C, COMMONS_TBL D
                WHERE A.HOS_ID = B.HOS_ID(+) AND A.VAC_ID = B.VAC_ID(+)
                AND A.VAC_ID = C.VAC_ID
                AND C.VAC_NAME_GRP = D.GRP_ID AND C.VAC_NAME = D.COM_ID
            ) TBL1,
            (
                SELECT T1.HOS_ID, T1.VAC_ID, COUNT(*) AS INJ_CNT
                FROM RESERVATION_TBL T1, INJECTION_TBL T2
                WHERE T1.RES_ID = T2.RES_ID
                GROUP BY T1.HOS_ID, T1.VAC_ID
            ) TBL2
            WHERE TBL1.HOS_ID = TBL2.HOS_ID(+) AND TBL1.VAC_ID = TBL2.VAC_ID(+)
            ORDER BY TBL1.HOS_ID ASC, TBL1.VAC_ID ASC
            
        )
    )
    GROUP BY IN_HOS_ID,IN_HOS_NAME
    ORDER BY IN_HOS_ID ASC
    ;        
        
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
            
  END PROC_SEL_HOSPITAL;
  

--UPDATE
  PROCEDURE PROC_UP_HOSPITAL
(
    IN_HOS_ID               IN VARCHAR2
    , IN_HOS_NAME	        IN VARCHAR2
	, IN_HOS_ADDR_GRP	    IN VARCHAR2   
	, IN_HOS_ADDR	        IN VARCHAR2		    
	, IN_HOS_ROOM_QTY	    IN VARCHAR2		    
	, IN_HOS_OPEN_DATE      IN VARCHAR2
    , O_ERRCODE       OUT     VARCHAR2
    , O_ERRMSG        OUT     VARCHAR2  
) AS
    V_CHK_HOS_ID    CHAR(1);
    NO_HOS_ID_EXCEPTION EXCEPTION;
  
  BEGIN  
-- 1) 병원 ID 유효한지 체크
    SELECT DECODE(MAX(HOS_ID),NULL,0,1)
        INTO V_CHK_HOS_ID
        FROM HOSPITAL_TBL
        WHERE HOS_ID=IN_HOS_ID
        ;
  
  IF V_CHK_HOS_ID=0 THEN
    RAISE NO_HOS_ID_EXCEPTION;
        
    ELSE
--2) UPDATE
        UPDATE HOSPITAL_TBL
        SET
            HOS_ID=IN_HOS_ID
            ,HOS_NAME=IN_HOS_NAME
            ,HOS_ADDR_GRP=IN_HOS_ADDR_GRP
            ,HOS_ROOM_QTY=IN_HOS_ROOM_QTY
            ,HOS_OPEN_DATE=IN_HOS_OPEN_DATE
       WHERE HOS_ADDR=IN_HOS_ADDR
          ;
    END IF;
            
        EXCEPTION
            WHEN NO_HOS_ID_EXCEPTION THEN
                O_ERRCODE := 'NO_HOS_ID_EXCEPTION';
                O_ERRMSG := '동일한 병원 ID입니다';
  
  
END PROC_UP_HOSPITAL;  
  

-- DELETE  
PROCEDURE PROC_DEL_HOSPITAL
    (
        IN_HOS_ID       IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_HOS_ID    CHAR(1);
        NO_HOS_ID_EXCEPTION EXCEPTION;
  BEGIN
    --1) IN_HOS_ID 유효한지 확인
    SELECT DECODE(MAX(HOS_ID),NULL,0,1)
    INTO V_CHK_HOS_ID
    FROM HOSPITAL_TBL
    WHERE HOS_ID=IN_HOS_ID
    ;
    
    IF V_CHK_HOS_ID=0 THEN
        RAISE NO_HOS_ID_EXCEPTION;
    ELSE
    --2) DELETE
        DELETE FROM HOSPITAL_TBL
        WHERE HOS_ID=IN_HOS_ID
        ;
    END IF;
    
    EXCEPTION
        WHEN NO_HOS_ID_EXCEPTION THEN
            O_ERRCODE := 'NO_HOS_ID_EXCEPTION';
            O_ERRMSG := '없는 병원ID입니다';
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
END PROC_DEL_HOSPITAL;  
  
  
  
  
  
  
  
  

END PKG_HOSPITAL;