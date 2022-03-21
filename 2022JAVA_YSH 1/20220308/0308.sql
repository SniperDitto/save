    

    
--트리거 TRIGGER
--특정 테이블에 이벤트(UPDATE, INSERT, DELETE)가 발생하면 자동으로 실행되는 프로시져
    --학생 한명이 자퇴를 하면 자퇴 테이블에 추가
    CREATE TABLE JATOE_TBL
    (
        STU_ID      CHAR(6)         PRIMARY KEY
        ,STU_NAME   VARCHAR2(30)    NOT NULL
    );
    --1
    DELETE FROM STUDENTS_TBL WHERE STU_ID='STU092';
    
    --2
    INSERT INTO JATOE_TBL(STU_ID, STU_NAME) VALUES('STU092', '최두욱');
    --TRIGGER가 되는 DELETE문이 ROLLBACK되면 작동했던 내용들도 모두 ROLLBACK된다
        --PROCEDURE : ALL OR NOTHING

    --              OLD                 NEW
    --UPDATE   수정 전 데이터     수정 후 데이터
    --DELETE  삭제 이전 데이터     없음(삭제됨)
    --INSERT  없음(생기기 전)   새로 추가된 데이터
    
    
    --여러개의 행에 변화가 생김 : FOR EACH ROW 이용
    -------------------------------------
    
    --성적 입력 수정시 HISTORY에 추가
    CREATE TABLE SCORES_HISTORY
    (
        STU_ID  CHAR(6)
        ,SUB_ID CHAR(7)
        ,BEFORE_SCORE   NUMBER(5,2)
        ,UPDATE_SCORE   NUMBER(5,2)
    );
    
    UPDATE SCORES_TBL
    SET SCORE=78
    WHERE STU_ID='STU001' AND SUB_ID='SUB0060';
    
    --BEFORE와 AFTER의 차이?
    --ORACLE : BEFORE, AFTER
    --MS SQL : BEFORE, AFTER, INSTEAD OF
    -----------------------------------------
    SELECT * FROM BANK_MEMBERS;
    SELECT * FROM BANKBOOK;
    
    --통장 개설시 1000원
    INSERT INTO BANKBOOK(BID, BNAME, MID) VALUES('B004', '일반통장', 'M001');
    
    --------------------
    --학생 또는 교수가 전과 : 소속이 바뀌면?
    SELECT * FROM STUDENTS_TBL;
    --기록 남기기
    --역정규화된 테이블

    /*
    CREATE TABLE STUDENTS_TRANSFER
    (
        STU_ID          CHAR(6)     NOT NULL
        ,TRANS_IDX      INTEGER     NOT NULL
        ,BEFORE_DEPT    CHAR(7)     NOT NULL
        ,BEFORE_GRP     CHAR(6)     NOT NULL
        ,TRANS_DEPT     CHAR(7)     NOT NULL
        ,TRANS_GRP      CHAR(6)     NOT NULL
    );
    */
    
    CREATE TABLE STUDENTS_TRANSFER2
    (
        STU_ID          CHAR(6)     NOT NULL
        ,TRANS_IDX      INTEGER     NOT NULL
        ,STU_DEPT       CHAR(7)     NOT NULL
        ,STU_DEPT_GRP   CHAR(6)     NOT NULL
        ,GBN            CHAR(1)     NOT NULL -- 이전학과 : O / 옮긴학과 : T
    );
    
    SELECT * 
    FROM STUDENTS_TBL T1, COMMONS_TBL T1
    WHERE T1.STU_DEPT=T2.COM_ID 
        AND T1.STU_DEPT_GRP=T2.GRP_ID
        AND STU_ID='STU021'
    ;
    --STUDENTS_TBL UPDATE TRIGGER (AFTER)
    --국문과 GRP002 COM0006
    --사학과 GRP002 COM0007 전과
    --영문과 GRP002 COM0008 전과
    --INSERT INTO STUDENTS_TRIGGER
    
    UPDATE STUDENTS_TBL
    SET STU_DEPT_GRP='GRP002',
        STU_DEPT='COM0010'
    WHERE STU_ID='STU021'
    ;
    SELECT * FROM STUDENTS_TRANSFER;
    SELECT * FROM STUDENTS_TRANSFER2;
    --DELETE FROM STUDENTS_TRANSFER;
    --DELETE FROM STUDENTS_TRANSFER2;



