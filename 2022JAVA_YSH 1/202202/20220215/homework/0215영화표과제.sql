
-- 고객이 영화를 예매한다
-- 고객 / 영화 : 엔티티
-- 예매 : 행위


-- 고객 테이블 : ID, 이름, 나이
CREATE TABLE CUSTOMERS(
    CUSID       CHAR(4)         NOT NULL,
    CUSNAME     VARCHAR2(20)    NOT NULL,
    AGE         NUMBER(2)       NOT NULL
);

-- 영화 테이블 : ID, 제목, 나이제한, 상영시간
CREATE TABLE MOVIES(
    MOVID       CHAR(4)         NOT NULL,
    MOVTITLE    VARCHAR2(50)    NOT NULL,
    MOVRATING   VARCHAR2(4)     NOT NULL,
    RTIME       NUMBER(3)       NOT NULL
);


-- 예매 테이블 : 고객ID, 영화ID, 예매일, 좌석, 구분(성인/청소년)
CREATE TABLE TICKETS(
    CUSID       CHAR(4)         NOT NULL,
    MOVID       CHAR(4)         NOT NULL,
    BOOKDATE    VARCHAR2(8)     NOT NULL,
    SEAT        CHAR(4)         NOT NULL,
    BOOKTYPE    VARCHAR2(10)    NOT NULL
);


-- 고객 데이터 추가
INSERT INTO CUSTOMERS(CUSID, CUSNAME, AGE) VALUES('001', '홍길동', 25);
INSERT INTO CUSTOMERS(CUSID, CUSNAME, AGE) VALUES('002', '홍길순', 25);
INSERT INTO CUSTOMERS(CUSID, CUSNAME, AGE) VALUES('003', '고길동', 40);
INSERT INTO CUSTOMERS(CUSID, CUSNAME, AGE) VALUES('004', '전우치', 29);
INSERT INTO CUSTOMERS(CUSID, CUSNAME, AGE) VALUES('005', '김철수', 33);
INSERT INTO CUSTOMERS(CUSID, CUSNAME, AGE) VALUES('006', '김영희', 30);
INSERT INTO CUSTOMERS(CUSID, CUSNAME, AGE) VALUES('007', '강감찬', 35);

-- 영화 데이터 추가
INSERT INTO MOVIES(MOVID, MOVTITLE, MOVRATING, RTIME) VALUES('M1', '언차티드', 'PG12', 116);
INSERT INTO MOVIES(MOVID, MOVTITLE, MOVRATING, RTIME) VALUES('M2', '더 배트맨', 'PG15', 176);
INSERT INTO MOVIES(MOVID, MOVTITLE, MOVRATING, RTIME) VALUES('M3', '리코리쉬 피자', 'PG15', 134);
INSERT INTO MOVIES(MOVID, MOVTITLE, MOVRATING, RTIME) VALUES('M4', '나일 강의 죽음', 'PG12', 127);
INSERT INTO MOVIES(MOVID, MOVTITLE, MOVRATING, RTIME) VALUES('M5', '듄', 'PG12', 155);
INSERT INTO MOVIES(MOVID, MOVTITLE, MOVRATING, RTIME) VALUES('M6', '해리 포터와 불사조 기사단', 'G', 137);
INSERT INTO MOVIES(MOVID, MOVTITLE, MOVRATING, RTIME) VALUES('M7', '스파이더맨 - 노 웨이 홈', 'PG12', 148);

-- 예매 데이터 추가
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('001', 'M1', '20220215', 'K15', 'ADULT');
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('001', 'M1', '20220215', 'K16', 'ADULT');
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('002', 'M3', '20220214', 'J10', 'CHILD');
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('002', 'M3', '20220214', 'J09', 'ADULT');
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('003', 'M6', '20220213', 'H22', 'ADULT');
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('003', 'M6', '20220213', 'H23', 'ADULT');
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('004', 'M4', '20220212', 'L16', 'ADULT');
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('005', 'M7', '20220214', 'K16', 'ADULT');
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('006', 'M7', '20220214', 'K17', 'ADULT');
INSERT INTO TICKETS(CUSID, MOVID, BOOKDATE, SEAT, BOOKTYPE)
VALUES('007', 'M5', '20220211', 'I21', 'ADULT');

SELECT * FROM TICKETS;
--COMMIT;

-- 성인 예약
SELECT * FROM TICKETS WHERE BOOKTYPE='ADULT';






