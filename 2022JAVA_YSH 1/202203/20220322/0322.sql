DROP TABLE CANCEL_TBL;
--취소된 건의 기사 ID 테이블
CREATE TABLE CANCEL_TBL
(
    IDX         NUMBER(5)   NOT NULL    PRIMARY KEY
    ,DR_ID      CHAR(5)     NOT NULL
    ,IN_DATE    DATE    NOT NULL
);


SELECT *
FROM FINISH_DRIVE_TBL
WHERE F_GUBUN=2;



    
    
    
    
    
    
    