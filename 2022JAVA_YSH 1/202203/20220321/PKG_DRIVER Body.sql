create or replace NONEDITIONABLE PACKAGE BODY PKG_DRIVER AS

--1. INSERT DRIVER
  PROCEDURE PRO_INS_DRIVERS
    (
        IN_DR_NAME  IN  VARCHAR2
        ,IN_DR_TEL  IN  VARCHAR2
        ,IN_DR_GENDER  IN  VARCHAR2
        --
        ,O_ERRCODE   OUT VARCHAR2
        ,O_ERRMSG   OUT VARCHAR2
    )  AS
    
        V_NEW_DR_ID CHAR(5);

    BEGIN
        --아이디만들기
        SELECT 'DR'||TO_CHAR(TO_NUMBER(NVL(SUBSTR(TRIM(MAX(DR_ID)),3,3),-1))+1,'FM000')
        INTO V_NEW_DR_ID
        FROM DRIVERS_TBL
        ;

        --INSERT
        INSERT INTO DRIVERS_TBL(DR_ID,DR_NAME,DR_TEL,DR_GENDER)
        VALUES(V_NEW_DR_ID,IN_DR_NAME,IN_DR_TEL,IN_DR_GENDER)
        ;
        
        --EXC
        EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE:=SQLCODE;
            O_ERRMSG:=SQLERRM;
            
    END PRO_INS_DRIVERS;
    
--2. UPDATE MEMBER
  PROCEDURE PROC_UP_DR_MEMBER
    (
        IN_DR_ID    IN  VARCHAR2
        ,IN_DR_NAME IN  VARCHAR2
        ,IN_DR_TEL  IN  VARCHAR2
        ,IN_DR_GENDER   IN  VARCHAR2
        --
        ,O_ERRCODE   OUT VARCHAR2
        ,O_ERRMSG   OUT VARCHAR2
    ) AS
  BEGIN
    UPDATE DRIVERS_TBL
    SET DR_NAME=IN_DR_NAME
        ,DR_TEL=IN_DR_TEL
        ,DR_GENDER=IN_DR_GENDER
    ;
    
    --EXC
    EXCEPTION
    WHEN OTHERS THEN
        O_ERRCODE:=SQLCODE;
        O_ERRMSG:=SQLERRM;
            
  END PROC_UP_DR_MEMBER;

  PROCEDURE PROC_MER_DR_MEMBER
    (
        IN_DR_ID    IN  VARCHAR2
        ,IN_DR_NAME IN  VARCHAR2
        ,IN_DR_TEL  IN  VARCHAR2
        ,IN_DR_GENDER   IN  VARCHAR2
        --
        ,O_ERRCODE   OUT VARCHAR2
        ,O_ERRMSG   OUT VARCHAR2
    ) AS
        V_NEW_DR_ID CHAR(5);
  BEGIN
    --아이디만들기
    SELECT 'DR'||TO_CHAR(TO_NUMBER(NVL(SUBSTR(TRIM(MAX(DR_ID)),3,3),-1))+1,'FM000')
    INTO V_NEW_DR_ID
    FROM DRIVERS_TBL
    ;
        
    --DRIVERS_TBL에 입력된 값의 DR_ID가 존재하면 UPDATE / 없으면 INSERT
    MERGE INTO DRIVERS_TBL
    USING DUAL
    ON (DR_ID=IN_DR_ID) --UPDATE
    --ON DR_ID='DR050' --INSERT
    WHEN MATCHED THEN
        --UPDATE
        UPDATE
        SET DR_NAME=IN_DR_NAME
            ,DR_TEL=IN_DR_TEL
            ,DR_GENDER=IN_DR_GENDER
    WHEN NOT MATCHED THEN
        --INSERT
        INSERT(DR_ID, DR_NAME, DR_TEL, DR_GENDER)
        VALUES(V_NEW_DR_ID,IN_DR_NAME,IN_DR_TEL,IN_DR_GENDER);
    
    
    --EXC
    EXCEPTION
    WHEN OTHERS THEN
        O_ERRCODE:=SQLCODE;
        O_ERRMSG:=SQLERRM;
            
  END PROC_MER_DR_MEMBER;


--4. SELECT DRIVER
  PROCEDURE PROC_SEL_DRIVER
    (
        IN_DR_ID    IN  VARCHAR2
        ,IN_DR_NAME IN  VARCHAR2
        ,O_CUR  OUT SYS_REFCURSOR
    ) AS
  BEGIN
    OPEN O_CUR FOR
    SELECT * 
    FROM DRIVERS_TBL
    WHERE DR_ID=IN_DR_ID
    ;
  END PROC_SEL_DRIVER;


--5.
  PROCEDURE PROC_UP_POINT
    (
        IN_R_TEL    IN  VARCHAR2
    ) AS
        V_POINT_SUM     NUMBER(20);
  BEGIN
    V_POINT_SUM := 0;
    --명시적 커서
        --커서가 해당 테이블을 돌면서 값을 가리킴
    FOR DR_CUR IN
    (
        --포인트 계산
        SELECT T1.R_TEL
            ,SUM(T2.R_PAY) AS PAY
            ,SUM(T2.R_PAY)*0.03 AS POINT
        FROM DR_MEMBER_TBL T1, RESERVATION_TBL T2, FINISH_DRIVE_TBL T3, FINISH_DRIVE_TBL T4
        WHERE T1.R_TEL=T2.R_TEL
            AND T2.R_ID=T3.R_ID
            AND T3.R_ID=T4.R_ID 
            AND T3.DR_ID=T4.DR_ID
            AND T4.F_GUBUN=1
        GROUP BY T1.R_TEL
    )
    LOOP
        --위 테이블에 대해 데이터 하나당 반복실행됨
        DBMS_OUTPUT.PUT_LINE(DR_CUR.R_TEL||' / '||DR_CUR.POINT);
        UPDATE DR_MEMBER_TBL
        SET MEM_POINT=DR_CUR.POINT
        WHERE R_TEL=DR_CUR.R_TEL
        ;
        V_POINT_SUM := V_POINT_SUM+DR_CUR.POINT;
    END LOOP;
    
  END PROC_UP_POINT;
  
  
--6. 수익
  PROCEDURE PROC_PROFIT
    (
        O_CUR   OUT SYS_REFCURSOR
    ) AS
        V_COM   NUMBER(10);
        V_DRI   NUMBER(10);
  BEGIN
    V_COM:=0;
    V_DRI:=0;
    FOR CUR IN
    (
        SELECT TO_CHAR(T1.F_DATE,'YYYY-MM-DD') AS F_DATE
            ,R_PAY
        FROM FINISH_DRIVE_TBL T1, RESERVATION_TBL T2
        WHERE T1.R_ID=T2.R_ID
            AND TO_CHAR(T1.F_DATE,'YYYY-MM-DD')='2018-05-02'
            AND T1.F_GUBUN=1
    )
    LOOP
        IF CUR.R_PAY>=20000 THEN
            V_COM:=V_COM + CUR.R_PAY*0.2;
            V_DRI:=V_DRI + CUR.R_PAY*0.8;
        ELSE
            V_COM:=V_COM + CUR.R_PAY*0.1;
            V_DRI:=V_DRI + CUR.R_PAY*0.9;
        END IF;
    END LOOP;
  END PROC_PROFIT;

END PKG_DRIVER;