create or replace NONEDITIONABLE PACKAGE BODY PKG_DRIVER AS

-------INSERT DRIVER
  PROCEDURE PROC_INS_DRIVER
    (
        IN_DR_NAME  IN  VARCHAR2
        ,IN_DR_TEL  IN  VARCHAR2
        ,IN_DR_GENDER   IN  VARCHAR2
    ) AS
        V_NEW_ID    CHAR(5);
  BEGIN
    
    --1. ID생성
    SELECT 'DR'||TO_CHAR(TO_NUMBER(NVL(SUBSTR(TRIM(MAX(DR_ID)),3,3),-1))+1,'FM000')
    INTO V_NEW_ID
    FROM DRIVERS_TBL
    ;
    
    --2. 추가
    INSERT INTO DRIVERS_TBL(DR_ID, DR_NAME, DR_TEL, DR_GENDER)
    VALUES(V_NEW_ID, IN_DR_NAME, IN_DR_TEL, IN_DR_GENDER)
    ;
    
  END PROC_INS_DRIVER;
  
-------UPDATE POINTS
  PROCEDURE PROC_UP_POINTS
    (
        IN_R_TEL   IN  VARCHAR2
        ,IN_R_ID    IN  VARCHAR2
        --예외
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_F_DRIVE   CHAR(1);
        V_PAY   NUMBER(7,0);
        
        NOT_FINISHED_EXCEPTION  EXCEPTION;
  BEGIN
    
    --1. 정상완료건인지 확인
    SELECT DECODE(MAX(R_ID),NULL,0,1)
    INTO V_CHK_F_DRIVE
    FROM FINISH_DRIVE_TBL
    WHERE F_GUBUN=1
    ;
    IF V_CHK_F_DRIVE=0 THEN
        RAISE NOT_FINISHED_EXCEPTION;
    END IF;
    
    --2. 이용금액의 3% 적립
        --포인트 내역 테이블 X
        --결제금액 조회
        SELECT R_PAY
        INTO V_PAY
        FROM RESERVATION_TBL
        WHERE R_ID=IN_R_ID
        ;
        --적립
        UPDATE DR_MEMBER_TBL
        SET MEM_POINT=MEM_POINT+ROUND((V_PAY*0.03),0)
        WHERE R_TEL=IN_R_TEL
        ;
    
    --예외
    EXCEPTION 
    WHEN NOT_FINISHED_EXCEPTION THEN
        O_ERRCODE := 'E001';
        O_ERRMSG := '정상적으로 완료된 운행이 아닙니다';
        ROLLBACK;
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
    
  END PROC_UP_POINTS;

-------INSERT MEMBER
  PROCEDURE PROC_INS_MEMBER
    (
        IN_R_TEL    IN  VARCHAR2
        --예외
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    ) AS
        V_CHK_MEMBER    CHAR(1);
        
        EXIST_EXCEPTION EXCEPTION;
  BEGIN
    
    --1. 새로운 이용자인지
    SELECT DECODE(MAX(R_TEL),NULL,0,1)
    INTO V_CHK_MEMBER
    FROM DR_MEMBER_TBL
    ;
    IF V_CHK_MEMBER=0 THEN
        RAISE EXIST_EXCEPTION;
    END IF;
    
    --2. 추가
    INSERT INTO DR_MEMBER_TBL(R_TEL, MEM_POINT)
    VALUES(IN_R_TEL,0)
    ;
    
    --예외
    EXCEPTION
    WHEN EXIST_EXCEPTION THEN
        O_ERRCODE := 'E002';
        O_ERRMSG := '이미 존재하는 회원입니다';
        ROLLBACK;
    WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
    
  END PROC_INS_MEMBER;

-------SELECT SALES 매출/요일별
  PROCEDURE PROC_SEL_DAY_SALES
    (
        O_CUR  OUT SYS_REFCURSOR
    ) AS

  BEGIN

    --해당 요일의 매출액 출력
    OPEN O_CUR FOR
    SELECT TO_CHAR(F.F_DATE,'YYYY/MM/DD DAY') AS 날짜
        , SUM(R_PAY) AS 매출
    FROM RESERVATION_TBL R, FINISH_DRIVE_TBL F
    WHERE R.R_ID=F.R_ID
        AND F.F_GUBUN=1
    GROUP BY TO_CHAR(F.F_DATE,'YYYY/MM/DD DAY')
    ;
        
  END PROC_SEL_DAY_SALES;
  
-------SELECT MONEY 회사/기사 번 돈
  PROCEDURE PROC_SEL_MONEY
    (
        O_CUR   OUT SYS_REFCURSOR
    ) AS

  BEGIN

    OPEN O_CUR FOR
    SELECT B.DRDATE
        , SUM(B.DRIVERMONEY) AS DRMONEY
        , SUM(B.COMPANYMONEY) AS COMMONEY
     FROM
     (
        --조건에 따라 수익 처리
         SELECT A.DRDATE
            ,CASE WHEN R.R_PAY>=20000 THEN R.R_PAY*0.8 ELSE R.R_PAY*0.9 END DRIVERMONEY
            ,CASE WHEN R.R_PAY>=20000 THEN R.R_PAY*0.2 ELSE R.R_PAY*0.1 END COMPANYMONEY
         FROM RESERVATION_TBL R,
         (
            --정상완료건
             SELECT R_ID, F_DATE
             FROM FINISH_DRIVE_TBL
             WHERE F_GUBUN=1
         ) F,
         (
            --5/2~5/5 날짜
             SELECT TO_DATE('20180502','YYYYMMDD')+LEVEL-1 AS DRDATE
             FROM DUAL
             CONNECT BY LEVEL<=(TO_DATE('20180505','YYYYMMDD')+1-TO_DATE('20180502','YYYYMMDD'))
         ) A
         WHERE R.R_ID=F.R_ID
            AND TO_CHAR(F.F_DATE,'YYYY/MM/DD')=A.DRDATE
    ) B
    GROUP BY B.DRDATE
    ORDER BY B.DRDATE ASC
    ;
    
    
  END PROC_SEL_MONEY;

END PKG_DRIVER;