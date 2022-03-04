
    --오라클  TRANSACTION과 예외 처리

    CREATE TABLE BANK_MEMBERS
    (
        MID         CHAR(4)     PRIMARY KEY
        ,MNAME      VARCHAR2(30)    NOT NULL
    );
    
    INSERT INTO BANK_MEMBERS(MID, MNAME) VALUES('M001','강기수');
    INSERT INTO BANK_MEMBERS(MID, MNAME) VALUES('M002','장팔삼');
    INSERT INTO BANK_MEMBERS(MID, MNAME) VALUES('M003','정기유');
    
    
    CREATE TABLE BANKBOOK
    (
        BID         CHAR(4)         PRIMARY KEY
        ,BNAME      VARCHAR2(30)    NOT NULL
        ,MID        CHAR(4)         NOT NULL
    );
    
    INSERT INTO BANKBOOK(BID, BNAME, MID) VALUES('B001','일반통장','M001');
    INSERT INTO BANKBOOK(BID, BNAME, MID) VALUES('B002','일반통장','M002');
    INSERT INTO BANKBOOK(BID, BNAME, MID) VALUES('B003','일반통장','M003');


    
    
    --강기수 고객이 5000원 입금
    --강기수 고객이 8000원 입금
    --강기수 고객이 4000원 출금
    
    
    CREATE TABLE SAVE_TBL
    (
        IDX     INTEGER     PRIMARY KEY
        ,BID    CHAR(4)     NOT NULL
        ,PRICE  NUMBER      NOT NULL
        ,GBN    CHAR(1)     NOT NULL --I입금/O출금
    );
    
    INSERT INTO SAVE_TBL(IDX, BID, PRICE, GBN) VALUES(1,'B001',5000,'I');
    INSERT INTO SAVE_TBL(IDX, BID, PRICE, GBN) VALUES(2,'B001',8000,'I');
    INSERT INTO SAVE_TBL(IDX, BID, PRICE, GBN) VALUES(3,'B001',4000,'O');
    INSERT INTO SAVE_TBL(IDX, BID, PRICE, GBN) VALUES(4,'B002',12000,'I');


    SELECT * FROM BANK_MEMBERS;
    SELECT * FROM BANKBOOK;
    SELECT * FROM SAVE_TBL;
    
    
    SELECT DECODE(T2.GBN,'I','입금','출금') AS 입출금,
        T2.PRICE
    FROM BANKBOOK T1, SAVE_TBL T2
    WHERE T1.BID=T2.BID
    AND MID='M001'
    ORDER BY IDX ASC
    ;


    --강기수->장팔삼 6000원 이체
    --모든 과정들이 하나로 묶여 있음(ALL OR NOTHING)
    --1. 강기수의 통장에서 6000원 출금
        --강기수의 통장에 남은 돈이 충분한가 확인 필요
        SELECT SUM(PRICE*DECODE(GBN,'O',-1,1)) AS PRICE
        FROM SAVE_TBL
        WHERE BID='B001';
        --출금
        INSERT INTO SAVE_TBL(IDX, BID, PRICE, GBN) VALUES(5,'B001',6000,'O');
    --2. 장팔삼의 통장에 6000원 입금
        --장팔삼의 통장이 유효한 통장인지 먼저 확인 필요
        
        --입금
        INSERT INTO SAVE_TBL(IDX, BID, PRICE, GBN) VALUES(6,'B002',6000,'I');






















