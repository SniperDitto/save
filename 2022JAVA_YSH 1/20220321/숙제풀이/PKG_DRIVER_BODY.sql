CREATE OR REPLACE
PACKAGE BODY PKG_DRIVER AS

  PROCEDURE PROC_INS_DRIVER
  (
        IN_DR_NAME          IN          VARCHAR2,
        IN_DR_TEL            IN          VARCHAR2,
        IN_DR_GENDER        IN          VARCHAR2,
        O_ERR_CODE          OUT         VARCHAR2,
        O_ERR_MSG           OUT         VARCHAR2
  ) 
  AS
  
    V_NEW_DR_ID             CHAR(5);
  
  BEGIN
    
    
    --1. NEW DR_ID CREATE
    SELECT  'DR' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(DR_ID), 'DR000'), 3, 3)) + 1, 'FM000')
    INTO V_NEW_DR_ID
    FROM DRIVERS_TBL
    ;
    
    INSERT INTO DRIVERS_TBL
    (DR_ID, DR_NAME, DR_TEL, DR_GENDER)
    VALUES
    (V_NEW_DR_ID, IN_DR_NAME, IN_DR_TEL,  IN_DR_GENDER)
    ;
    
    
    
    EXCEPTION
    WHEN OTHERS THEN
    O_ERR_CODE := SQLCODE;
    O_ERR_MSG := SQLERRM;
    
    
    
  END PROC_INS_DRIVER;
  
  
  
   PROCEDURE PROC_SET_MEMBER_POINT
   (
        IN_MEMBER_TEL       IN          VARCHAR2,
        O_ERR_CODE          OUT         VARCHAR2,
        O_ERR_MSG           OUT         VARCHAR2
   )
   AS
   
   BEGIN
   
       MERGE INTO DR_MEMBER_TBL A
       USING 
       (
            SELECT 
                T1.R_TEL
                ,SUM(T2.R_PAY) AS TLT_PAY
                ,SUM(T2.R_PAY * 0.03) AS POINT 
           FROM DR_MEMBER_TBL T1, RESERVATION_TBL T2, DRIVER_RST_TBL T3, FINISH_DRIVE_TBL T4
           WHERE T1.R_TEL = T2.R_TEL(+)
           AND T2.R_ID =T3.R_ID(+)
           AND T3.R_ID = T4.R_ID AND T3.DR_ID = T4.DR_ID
           AND T4.F_GUBUN = 1
           GROUP BY T1.R_TEL      
       ) B
       ON (A.R_TEL = B.R_TEL)
       WHEN MATCHED THEN
       UPDATE SET
       A.MEM_POINT = B.POINT
       ;
   
   
       
    EXCEPTION
    WHEN OTHERS THEN
    O_ERR_CODE := SQLCODE;
    O_ERR_MSG := SQLERRM;
   
   
   END PROC_SET_MEMBER_POINT
   ;
   
   -- NO DATA FOUND 를 예외 처리로 사용할 경우
   PROCEDURE PROC_INS_MEMBER_1
   (
        IN_MEMBER_TEL       IN          VARCHAR2,
        O_ERR_CODE          OUT         VARCHAR2,
        O_ERR_MSG           OUT         VARCHAR2
   )
   AS
   
        V_R_TEL             VARCHAR2(20);
   
   BEGIN
   
    SELECT R_TEL
    INTO V_R_TEL
    FROM DR_MEMBER_TBL
    WHERE R_TEL = IN_MEMBER_TEL;
    
    O_ERR_CODE := 'ERR001';
    O_ERR_MSG := '이미 존재하는 회원 전화번호 입니다.';
    
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    INSERT INTO DR_MEMBER_TBL
    (R_TEL, MEM_POINT)
    VALUES(IN_MEMBER_TEL, 0);
    
    
    WHEN OTHERS THEN
    O_ERR_CODE := SQLCODE;
    O_ERR_MSG := SQLERRM;
    
   
   END PROC_INS_MEMBER_1;
   
   
    -- USER DEFINED EXCEPTION 를 예외 처리로 사용할 경우
   PROCEDURE PROC_INS_MEMBER_2
   (
        IN_MEMBER_TEL       IN          VARCHAR2,
        O_ERR_CODE          OUT         VARCHAR2,
        O_ERR_MSG           OUT         VARCHAR2
   )
   AS
   
        EXCEPT_INS_MEM          EXCEPTION;
        V_EXT_MEM                VARCHAR2(20);
   
   BEGIN
   
    SELECT MAX(R_TEL)
    INTO V_EXT_MEM
    FROM DR_MEMBER_TBL
    WHERE R_TEL = IN_MEMBER_TEL
    ;
    
    IF V_EXT_MEM IS NULL THEN
        INSERT INTO DR_MEMBER_TBL
        (R_TEL, MEM_POINT)
        VALUES(IN_MEMBER_TEL, 0);
    ELSE
        RAISE EXCEPT_INS_MEM;
    END IF
    ;
   
   
   EXCEPTION
   WHEN EXCEPT_INS_MEM THEN
    O_ERR_CODE := 'ERR001';
    O_ERR_MSG := '이미 존재하는 회원 전화번호 입니다.';
    
    WHEN OTHERS THEN
    O_ERR_CODE := SQLCODE;
    O_ERR_MSG := SQLERRM;
   
   END PROC_INS_MEMBER_2;
   
   
   
   
   
      PROCEDURE PROC_SEL_PERWEEK
      (
            O_CUR           OUT     SYS_REFCURSOR,
            O_ERR_CODE          OUT         VARCHAR2,
            O_ERR_MSG           OUT         VARCHAR2
      )
      AS
      
      BEGIN
      
      
      OPEN O_CUR FOR
      SELECT A.WEEK, NVL(B.R_PAY,0) AS R_PAY FROM
      (
      SELECT LEVEL AS LVL,
        CASE LEVEL WHEN 1 THEN '일요일'
                        WHEN 2 THEN '월요일'
                        WHEN 3 THEN '화요일'
                        WHEN 4 THEN '수요일'
                        WHEN 5 THEN '목요일'
                        WHEN 6 THEN '금요일'
                        WHEN 7 THEN '토요일'
        END AS WEEK    
      FROM DUAL
      CONNECT BY LEVEL <= 7
      ) A
      ,
      (
          SELECT TO_CHAR(F_DATE, 'DAY') AS WEEK
                   , TO_CHAR(F_DATE, 'D') AS LVL
                   , SUM(T1.R_PAY) AS R_PAY
          FROM RESERVATION_TBL T1, DRIVER_RST_TBL T2, FINISH_DRIVE_TBL T3
          WHERE T1.R_ID = T2.R_ID
          AND T2.R_ID = T3.R_ID AND T2.DR_ID = T3.DR_ID
          AND T3.F_GUBUN = 1
          GROUP BY TO_CHAR(F_DATE, 'DAY'), TO_CHAR(F_DATE, 'D')
      ) B
      WHERE A.LVL = B.LVL(+)
      ORDER BY A.LVL ASC
      ;
      
    EXCEPTION
    WHEN OTHERS THEN
    O_ERR_CODE := SQLCODE;
    O_ERR_MSG := SQLERRM;
      
      END PROC_SEL_PERWEEK;
   
   
   
   
   
   

END PKG_DRIVER;