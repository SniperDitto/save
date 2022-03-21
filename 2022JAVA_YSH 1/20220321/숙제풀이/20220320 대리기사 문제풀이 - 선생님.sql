--업무 설명
--1. 회사는 대리기사를 모집하고 관리한다.
--2. 불특정 다수의 대리운전 이용자는 전화를 하고 대리운전기사를 예약한다.
--3. 전화를 받은 대리기사 회사의 직원은 걸려온 전화를 내용을 입력하고 대리기사의 선택을 기다린다.
--4. 선택된 대리기사는 전화를 한 이용자에게 대리운전을 하고 예정된 금액을 받는다.
--5. 대리가 완료되면 불특정 다수의 이용자에게 대리 금액의 3%를 포인트로 적립한다. - 계산은 원단위까지에서 소수점은 반올림 한다.
--6. 수익은 20000원 이상이면 대리기사 80% 회사 20%를 그 미만이면 대리기사 90% 회사 10%를 가져간다.

--대리기사 테이블
CREATE TABLE DRIVERS_TBL
(
    DR_ID    CHAR(5)     PRIMARY KEY,  --대리기사 아이디
    DR_NAME     VARCHAR2(30)        NOT NULL, --대리기사 이름
    DR_TEL      VARCHAR2(20)            NOT NULL, --대리기사 연락처
    DR_GENDER       CHAR(1)                 NOT NULL --대리기사 성별 M:남자,  F:여자
);

--DATA 
INSERT INTO DRIVERS_TBL VALUES('DR001', '김동구', '010-6759-0954', 'M');
INSERT INTO DRIVERS_TBL VALUES('DR002', '박도길', '010-7415-1254', 'M');
INSERT INTO DRIVERS_TBL VALUES('DR003', '도이길', '010-2289-0098', 'M');
INSERT INTO DRIVERS_TBL VALUES('DR004', '김선이', '010-4444-4444', 'F');
INSERT INTO DRIVERS_TBL VALUES('DR005', '구일장', '010-9748-8174', 'M');
INSERT INTO DRIVERS_TBL VALUES('DR006', '김민선', '010-2017-9364', 'F');
INSERT INTO DRIVERS_TBL VALUES('DR007', '박미진', '010-7004-0014', 'F');
--COMMIT;

--불특정 다수 회원 테이블
CREATE TABLE DR_MEMBER_TBL
(
    R_TEL   VARCHAR2(20)        PRIMARY KEY,
    MEM_POINT   NUMBER(7)           NOT NULL
);

--DATA
INSERT INTO DR_MEMBER_TBL VALUES('010-1111-1111', 0);
INSERT INTO DR_MEMBER_TBL VALUES('010-2222-1111', 0);
INSERT INTO DR_MEMBER_TBL VALUES('010-3333-1111', 0);
INSERT INTO DR_MEMBER_TBL VALUES('010-4444-1111', 0);
INSERT INTO DR_MEMBER_TBL VALUES('010-5555-1111', 0);
INSERT INTO DR_MEMBER_TBL VALUES('010-6666-1111', 0);
--COMMIT;

--이용자가 대리운전  신청 전화를 하면 직원은 그 내용을 아래의 테이블에 입력한다.
--대리 예약 테이블
CREATE TABLE RESERVATION_TBL
(
    R_ID     CHAR(5)        PRIMARY KEY, --대리예약 아이디
    R_TEL      VARCHAR2(20)     NOT NULL, --예약자 전화번호
    R_STR       VARCHAR2(100)       NOT NULL, --대리운전 출발지
    R_DEST      VARCHAR2(100)       NOT NULL, --대리운전 목적지
    R_PAY       NUMBER(7)              NOT NULL --대리운전 금액
);

INSERT INTO RESERVATION_TBL VALUES('R0001', '010-1111-1111', '부경대앞','부산대앞', 15000);
INSERT INTO RESERVATION_TBL VALUES('R0002', '010-2222-1111', '경성대앞','부산대앞', 13000);
INSERT INTO RESERVATION_TBL VALUES('R0003', '010-1111-1111', '동아대앞','부경대앞', 25000);
INSERT INTO RESERVATION_TBL VALUES('R0004', '010-4444-1111', '부경대앞','부산대앞', 15000);
INSERT INTO RESERVATION_TBL VALUES('R0005', '010-3333-1111', '동의대앞','부산대앞', 17000);
INSERT INTO RESERVATION_TBL VALUES('R0006', '010-5555-1111', '부경대앞','부산대앞', 15000);
INSERT INTO RESERVATION_TBL VALUES('R0007', '010-1111-1111', '동아대앞','부산대앞', 30000);
INSERT INTO RESERVATION_TBL VALUES('R0008', '010-2222-1111', '해양대앞','부경대앞', 20000);
INSERT INTO RESERVATION_TBL VALUES('R0009', '010-4444-1111', '부산대앞','해양대앞', 25000);
INSERT INTO RESERVATION_TBL VALUES('R0010', '010-3333-1111', '부산대앞','동아대앞', 30000);
INSERT INTO RESERVATION_TBL VALUES('R0011', '010-1111-1111', '경성대앞','동의대앞', 20000);
INSERT INTO RESERVATION_TBL VALUES('R0012', '010-5555-1111', '부산외대앞','동아대앞', 32000);
INSERT INTO RESERVATION_TBL VALUES('R0013', '010-2222-1111', '울산대앞','부산대앞', 50000);
INSERT INTO RESERVATION_TBL VALUES('R0014', '010-2222-1111', '동아대앞','동의대앞', 18000);
INSERT INTO RESERVATION_TBL VALUES('R0015', '010-6666-1111', '해양대앞','동의대앞', 23000);
--COMMIT;



--대리기사는 등록된 대리운전 리스트에서 원하는 항목을 선택하면 아래의 테이블에 결정 내용이 저장된다.
--대리기사 결정 테이블
CREATE TABLE DRIVER_RST_TBL
(
    R_ID    CHAR(5)     NOT NULL,  --대리예약 아이디
    DR_ID   CHAR(5)     NOT NULL,  --대리기사 아이디
    RST_DATE        DATE        NOT NULL --대리예약시간
);

--ROLLBACK;
--COMMIT;

INSERT INTO DRIVER_RST_TBL VALUES('R0001', 'DR003', TO_DATE('2018-05-02 21:00:14', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0002', 'DR002', TO_DATE('2018-05-02 23:11:45', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0003', 'DR001', TO_DATE('2018-05-02 20:00:14', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0004', 'DR004', TO_DATE('2018-05-03 01:48:27', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0005', 'DR005', TO_DATE('2018-05-03 19:51:38', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0006', 'DR005', TO_DATE('2018-05-03 23:14:54', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0008', 'DR005', TO_DATE('2018-05-03 20:11:37', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0010', 'DR001', TO_DATE('2018-05-04 02:15:58', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0011', 'DR002', TO_DATE('2018-05-04 18:55:19', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0012', 'DR003', TO_DATE('2018-05-05 21:47:55', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0013', 'DR004', TO_DATE('2018-05-05 23:00:44', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0014', 'DR005', TO_DATE('2018-05-05 22:40:37', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO DRIVER_RST_TBL VALUES('R0015', 'DR003', TO_DATE('2018-05-05 22:14:34', 'YYYY-MM-DD HH24:MI:SS'));


--대리 기사가 대리운전을 완료하면 아래의 테이블에 결과를 저장하고 또는 손님이 그 장소에 없을 경우 취소를 한다.
--대리 완료 테이블
CREATE TABLE FINISH_DRIVE_TBL
(
    IDX     NUMBER(5)   NOT NULL, --순번
    R_ID    CHAR(5)     NOT NULL, --대리예약 아이디
    DR_ID   CHAR(5)     NOT NULL, --대리기사 아이디
    F_DATE  DATE        NOT NULL, --대리 완료 시간   
    F_GUBUN     CHAR(1)     NOT NULL --대리 정상 완료 여부 정상적 완료 : 1, 대리취소 : 2
);

INSERT INTO FINISH_DRIVE_TBL VALUES(1, 'R0001', 'DR003', TO_DATE('2018-05-02 21:30:44', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO FINISH_DRIVE_TBL VALUES(2, 'R0002', 'DR002', TO_DATE('2018-05-02 23:14:45', 'YYYY-MM-DD HH24:MI:SS'), '2');
INSERT INTO FINISH_DRIVE_TBL VALUES(3, 'R0003', 'DR001', TO_DATE('2018-05-02 20:24:14', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO FINISH_DRIVE_TBL VALUES(4, 'R0004', 'DR004', TO_DATE('2018-05-03 02:28:27', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO FINISH_DRIVE_TBL VALUES(5, 'R0005', 'DR005', TO_DATE('2018-05-03 20:11:38', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO FINISH_DRIVE_TBL VALUES(6, 'R0006', 'DR005', TO_DATE('2018-05-03 23:54:01', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO FINISH_DRIVE_TBL VALUES(7, 'R0008', 'DR005', TO_DATE('2018-05-03 20:31:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO FINISH_DRIVE_TBL VALUES(8, 'R0010', 'DR001', TO_DATE('2018-05-04 02:55:08', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO FINISH_DRIVE_TBL VALUES(9, 'R0011', 'DR002', TO_DATE('2018-05-04 19:35:10', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO FINISH_DRIVE_TBL VALUES(10,'R0012', 'DR003', TO_DATE('2018-05-05 21:50:55', 'YYYY-MM-DD HH24:MI:SS'), '2');
INSERT INTO FINISH_DRIVE_TBL VALUES(11, 'R0013', 'DR004', TO_DATE('2018-05-05 23:07:14', 'YYYY-MM-DD HH24:MI:SS'), '2');
INSERT INTO FINISH_DRIVE_TBL VALUES(12, 'R0014', 'DR005', TO_DATE('2018-05-05 22:59:07', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO FINISH_DRIVE_TBL VALUES(13, 'R0015', 'DR003', TO_DATE('2018-05-05 22:39:00', 'YYYY-MM-DD HH24:MI:SS'), '1');
--COMMIT;


SELECT * FROM DRIVERS_TBL;
SELECT * FROM DR_MEMBER_TBL;
SELECT * FROM RESERVATION_TBL;
--A. 쿼리

--1. 대리운전 이용자의 예약 현황을 보여주세요 (5점)
       --(이용자 연락처, 출발지, 도착지, 대리운전비)
       SELECT T2.R_TEL, T1.R_STR, T1.R_DEST, T1.R_PAY 
       FROM RESERVATION_TBL T1, DR_MEMBER_TBL T2
       WHERE T1.R_TEL = T2.R_TEL
       ORDER BY T1.R_TEL ASC
       ;

--2. 대리기사가 선택한 대리운전 결정 리스트를 보여주세요(5점)
        --(대리운전기사 아이디, 대리운전기사 이름, 이용자연락처, 출발지, 도착지 대리운전비)
        SELECT T4.DR_ID, T4.DR_NAME, T2.R_TEL, T1.R_STR, T1.R_DEST, T1.R_PAY
        FROM RESERVATION_TBL T1, DR_MEMBER_TBL T2, DRIVER_RST_TBL T3, DRIVERS_TBL T4
        WHERE T1.R_TEL = T2.R_TEL
        AND T1.R_ID = T3.R_ID
        AND T3.DR_ID = T4.DR_ID
        ORDER BY T4.DR_ID ASC
        ;
        
        --LEFT JOIN 활용하여 대리운전 결정을 한번도 하지 않은 대리기사 까지 보여주고 싶을 경우
        SELECT * FROM
        DRIVERS_TBL A,
        (
            SELECT  T2.R_TEL, T1.R_STR, T1.R_DEST, T1.R_PAY, T3.DR_ID
            FROM RESERVATION_TBL T1, DR_MEMBER_TBL T2, DRIVER_RST_TBL T3
            WHERE T1.R_TEL = T2.R_TEL
            AND T1.R_ID = T3.R_ID
        ) B
        WHERE A.DR_ID = B.DR_ID(+)
        ORDER BY A.DR_ID ASC
        ;
        
--3. 이용자중 가장많이 대리운전을 예약한 사용자의 연락처를 찾아주세요 (5점)
    SELECT A.R_TEL, A.CNT FROM
    (
        SELECT T1.R_TEL, COUNT(T2.R_TEL) AS CNT,
                  DENSE_RANK() OVER( ORDER BY COUNT(T2.R_TEL) DESC) AS RNK
        FROM DR_MEMBER_TBL T1, RESERVATION_TBL T2
        WHERE T1.R_TEL = T2.R_TEL(+)
        GROUP BY T1.R_TEL
    ) A
    WHERE A.RNK = 1
    ;


--4. 대리운전 기사들의 수익을 가장많은 기사 부터 차례대로 순위를 붙여서 보여 주세요(5점)

    -- RESULT LIST
    SELECT *
    FROM DRIVERS_TBL T1, DRIVER_RST_TBL T2, RESERVATION_TBL T3, FINISH_DRIVE_TBL T4
    WHERE T1.DR_ID = T2.DR_ID(+)
    AND T2.R_ID = T3.R_ID(+)
    AND T2.R_ID = T4.R_ID(+) AND T2.DR_ID = T4.DR_ID(+)
    ORDER BY T1.DR_ID ASC
    ;

    
    SELECT 
        T1.DR_ID, T1.DR_NAME,
        SUM( DECODE(T4.F_GUBUN, 1, T3.R_PAY, 0) ) AS TOTAL_PAY,
        RANK() OVER(ORDER BY SUM( DECODE(T4.F_GUBUN, 1, T3.R_PAY, 0) ) DESC) AS RNK
    FROM DRIVERS_TBL T1, DRIVER_RST_TBL T2, RESERVATION_TBL T3, FINISH_DRIVE_TBL T4
    WHERE T1.DR_ID = T2.DR_ID(+)
    AND T2.R_ID = T3.R_ID(+)
    AND T2.R_ID = T4.R_ID(+) AND T2.DR_ID = T4.DR_ID(+)
    GROUP BY T1.DR_ID, T1.DR_NAME
    ;


--5. 이용자들중에 대리운전 예약을 한 후 취소를 가장 많이 한 이용자의 핸드폰번호를 보여주세요(5점)
    SELECT A.R_TEL FROM
    (
        SELECT T1.R_TEL,  COUNT(*) AS CNT,
                  RANK() OVER( ORDER BY COUNT(*) DESC ) AS RNK
        FROM DR_MEMBER_TBL T1, RESERVATION_TBL T2, DRIVER_RST_TBL T3, FINISH_DRIVE_TBL T4
        WHERE T1.R_TEL = T2.R_TEL
        AND T2.R_ID = T3.R_ID
        AND T3.R_ID = T4.R_ID
        AND T4.F_GUBUN = 2
        GROUP BY T1.R_TEL
    ) A
    WHERE A.RNK = 1
    ;


--6. 대리운전 기사들의 성별로 대리운전결정 건수를 보여주세요(5점)
    SELECT DECODE(T1.DR_GENDER, 'M', '남자', '여자') AS DR_GENDER
              , COUNT(T2.DR_ID) AS CNT
    FROM DRIVERS_TBL T1, DRIVER_RST_TBL T2
    WHERE T1.DR_ID = T2.DR_ID(+)
    GROUP BY T1.DR_GENDER
    ;

--7. 2018년 5월 2일부터 5월 5일까지 대리기사가 결정된 건수, 정상적으로 완료된 건수, 취쇠된 건수를 보여주세요(5점)
    --SELECT * FROM DRIVER_RST_TBL;
    --SELECT * FROM FINISH_DRIVE_TBL;
    
    --1. 등록된 날짜별로 대리기사 결정건수를 구한다.
    SELECT TO_CHAR(T1.RST_DATE, 'YYYY-MM-DD') AS RST_DATE
              , SUM( DECODE(T2.F_GUBUN, 1, 1, 0) ) AS FINISH_CNT
              , SUM( DECODE(T2.F_GUBUN, 2, 1, 0) ) AS CANCEL_CNT
    FROM DRIVER_RST_TBL T1, FINISH_DRIVE_TBL T2
    WHERE T1.R_ID = T2.R_ID(+) AND T1.DR_ID = T2.DR_ID(+)
    -- 여기서 왜 LEFT JOIN을 사용했는지 고민 해 볼 것
    GROUP BY TO_CHAR(T1.RST_DATE, 'YYYY-MM-DD')
    ;
    
    --여기까지만 구했다면 현장에서는 큰 로직에러를 범한 것이라 볼 수 있다.
    --왜냐하면 다행히도 데이터가 5월 2일부터 5월 5일까지 있지만
    --실제로는 데이터가 없을수고 있기 때문
    
    --그래서 날짜만을 표현하는 인라인 뷰를 만들어야 한다.
    SELECT TO_CHAR(TO_DATE('2018-05-02', 'YYYY-MM-DD') + ( LEVEL - 1 ), 'YYYY-MM-DD') AS BS_DATE
    FROM DUAL
    CONNECT BY LEVEL <= TO_DATE('2018-05-05', 'YYYY-MM-DD') -  TO_DATE('2018-05-02', 'YYYY-MM-DD') + 1
    ;
    
    
    --결과
    SELECT 
        A.BS_DATE
        ,NVL(B.FINISH_CNT, 0) AS FINISH_CNT
        ,NVL(B.CANCEL_CNT, 0) AS CANCEL_CNT
    FROM
    (
        SELECT TO_CHAR(TO_DATE('2018-05-02', 'YYYY-MM-DD') + ( LEVEL - 1 ), 'YYYY-MM-DD') AS BS_DATE
        FROM DUAL
        CONNECT BY LEVEL <= TO_DATE('2018-05-05', 'YYYY-MM-DD') -  TO_DATE('2018-05-02', 'YYYY-MM-DD') + 1
    ) A
    ,
    (
        SELECT TO_CHAR(T1.RST_DATE, 'YYYY-MM-DD') AS RST_DATE
                  , SUM( DECODE(T2.F_GUBUN, 1, 1, 0) ) AS FINISH_CNT
                  , SUM( DECODE(T2.F_GUBUN, 2, 1, 0) ) AS CANCEL_CNT
        FROM DRIVER_RST_TBL T1, FINISH_DRIVE_TBL T2
        WHERE T1.R_ID = T2.R_ID(+)  -- 여기서 왜 LEFT JOIN을 사용했는지 고민 해 볼 것
        GROUP BY TO_CHAR(T1.RST_DATE, 'YYYY-MM-DD')    
    ) B
    WHERE A.BS_DATE = B.RST_DATE(+)
    ;
    
    

--8. 이용자는 대리운전 신청을 하였으나 대리기사가 결정되지 않아서 취소된 대리운전 건을 보여주세요(5점)
    --(이용자핸드폰번호, 출발지, 도착지, 금액)
    SELECT T1.R_TEL, T2.R_STR, T2.R_DEST, T2.R_PAY
    FROM DR_MEMBER_TBL T1, RESERVATION_TBL T2, DRIVER_RST_TBL T3
    WHERE T1.R_TEL = T2.R_TEL
    AND T2.R_ID = T3.R_ID(+)
    AND T3.R_ID IS NULL
    ;
    
    
--9. 정상적으로 완료된 대리운전중에 가장 시간이 많이 걸린 대리운전 건을 보여주세요(5점)
    SELECT TO_CHAR(RST_DATE, 'YYYY-MM-DD HH24:MI:SS') FROM DRIVER_RST_TBL;
    SELECT TO_CHAR(F_DATE, 'YYYY-MM-DD HH24:MI:SS') FROM FINISH_DRIVE_TBL;
    
    --LIST
    SELECT TO_CHAR(F_DATE, 'YYYY-MM-DD HH24:MI:SS'), TO_CHAR(RST_DATE, 'YYYY-MM-DD HH24:MI:SS')
              ,F_DATE - RST_DATE AS DIFF_TIME
              ,RANK() OVER(ORDER BY F_DATE - RST_DATE DESC) AS DIFF_TIME_RNK
    FROM DRIVER_RST_TBL T1, FINISH_DRIVE_TBL T2
    WHERE T1.R_ID = T2.R_ID
    AND T2.F_GUBUN = 1
    ;
    
    
    --가장 시간이 많이 걸린 대리운전 건
    SELECT   C.R_TEL, D.DR_ID, D.DR_NAME,B.R_STR, B.R_DEST, B.R_PAY,
                A.DIFF_TIME_RNK, A.R_ID, A.DR_ID, A.F_DATE, A.RST_DATE, A.DIFF_TIME
    FROM
    (
        SELECT T1.R_ID, T1.DR_ID
                  , TO_CHAR(F_DATE, 'YYYY-MM-DD HH24:MI:SS') AS F_DATE
                  , TO_CHAR(RST_DATE, 'YYYY-MM-DD HH24:MI:SS') AS RST_DATE
                  , F_DATE - RST_DATE AS DIFF_TIME
                  , RANK() OVER(ORDER BY F_DATE - RST_DATE DESC) AS DIFF_TIME_RNK
        FROM DRIVER_RST_TBL T1, FINISH_DRIVE_TBL T2
        WHERE T1.R_ID = T2.R_ID
        AND T2.F_GUBUN = 1
    ) A, RESERVATION_TBL B, DR_MEMBER_TBL C, DRIVERS_TBL D
    WHERE A.R_ID = B.R_ID
    AND B.R_TEL = C.R_TEL
    AND A.DR_ID = D.DR_ID
    AND A.DIFF_TIME_RNK = 1
    ;

--10. 대리운전비가 가장 비싼 대리운전을 보여주세요(5점)
       --(대리기사이름, 출발지, 목적지, 이용자핸드폰, 금액, 완료여부)
       
    SELECT * FROM FINISH_DRIVE_TBL
    ;
       
    SELECT T1.R_TEL, T4.DR_ID, T4.DR_NAME
              , T2.R_STR, T2.R_DEST, T2.R_PAY
              , DECODE(T5.F_GUBUN, 1, '완료', '취소') AS F_GUBUN
              , RANK() OVER(ORDER BY T2.R_PAY DESC) AS RNK
    FROM DR_MEMBER_TBL T1, RESERVATION_TBL T2, DRIVER_RST_TBL T3, DRIVERS_TBL T4, FINISH_DRIVE_TBL T5
    WHERE T1.R_TEL = T2.R_TEL
    AND T2.R_ID = T3.R_ID
    AND T3.DR_ID = T4.DR_ID
    AND T3.R_ID = T5.R_ID AND T3.DR_ID = T5.DR_ID
    ;



--B. 패키지 프로시져 - 각 5점
--1. 대리운전의 업무를 위한 패키지를 하나 만들어주세요 패키지 이름 : PKG_DRIVER  

--2. 위의 패키지에 첫번째 프로시저를 하나 만들어주세요 - 
        --새로운 대리운전 기사를 등록하는 프로시저를 만들어주세요
        --대리기사 아이디는 따로 함수로 만들지 말고 프로시저 내부에 로직을 포함시켜주세요
        SELECT * FROM DRIVERS_TBL;
        SELECT  'DR' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(DR_ID), 'DR000'), 3, 3)) + 1, 'FM000')
        FROM DRIVERS_TBL;
        
--3. 위의 패키지에 두번째 프로시저를 만들어주세요
       --현재 불특정 회원의 POINT가 모두 0원입니다.
       --프로시저를 사용하여 POINT가 모두 계산 되도록 해주세요
       SELECT * FROM DR_MEMBER_TBL;
       SELECT * FROM DRIVER_RST_TBL;
       SELECT * FROM FINISH_DRIVE_TBL;
       
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
       ;
       
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
       
       
--4. 위의 패키지에 세번째 프로시저를 만들어주세요
      -- 이용자가 대리운전을 요청하는 전화를 하면
      -- 입력하는 직원은 해당 프로시저에 이용자 연락처만 입력하고 저장하면
      -- 새로운 이용자이면 DR_MEMBER_TBL에 새롭게 추가하고
      -- 이미 등록된 이용자이면 사용자 예외처리를 활용하여 에러처리를 해 주세요
      
      
      
--5   위의 패키지에 네번째 프로시저를 만들어주세요
      -- 각 요일별로 대리운전 총 매출액을 계산해서 보여주는 프로시저를 만들어 주세요
      
      SELECT * FROM FINISH_DRIVE_TBL;
      
      SELECT F_DATE, TO_CHAR(F_DATE, 'DAY')
      FROM FINISH_DRIVE_TBL
      ;
      
      
      --LEFT JOIN 왼쪽에 들어갈 테이블
      SELECT LEVEL,
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
      ;
      
      
      --LEFT JOIN 오른쪽에 들어갈 실제 데이터
      SELECT TO_CHAR(F_DATE, 'DAY'), TO_CHAR(F_DATE, 'D'), SUM(T1.R_PAY)
      FROM RESERVATION_TBL T1, DRIVER_RST_TBL T2, FINISH_DRIVE_TBL T3
      WHERE T1.R_ID = T2.R_ID
      AND T2.R_ID = T3.R_ID AND T2.DR_ID = T3.DR_ID
      AND T3.F_GUBUN = 1
      GROUP BY TO_CHAR(F_DATE, 'DAY'), TO_CHAR(F_DATE, 'D')
      ;
      
      
      --결과
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
      
      
--6. 위의 패키지에 다섯번째 프로시저를 만들어주세요
     --2018년 5월 2일 부터 5월5일까지 회사와 대리운전기사가 벌어들인 금액을 각각 표시하는 프로시저를 만들어주세요
     
     -------------------------------------
     --    DRDATE       COMAPNY   DRIVER -----------
     --  2018-05-02      8000      2000
     --  2018-05-03      20000     5000
     --  2018-05-04      32000     8000
     --  2018-05-05      16000     2000
     -- 위와 같은 형식으로 결과가 보여지도록 해 주세요
    
    
    SELECT TO_CHAR(TO_DATE('2018-05-02', 'YYYY-MM-DD') + ( LEVEL - 1 ), 'YYYY-MM-DD') AS BS_DATE
    FROM DUAL
    CONNECT BY LEVEL <= TO_DATE('2018-05-05', 'YYYY-MM-DD') -  TO_DATE('2018-05-02', 'YYYY-MM-DD') + 1
    ;
     
     
    --6. 수익은 20000원 이상이면 대리기사 80% 회사 20%를 
    --   그 미만이면 대리기사 90% 회사 10%를 가져간다.
    
    SELECT * FROM RESERVATION_TBL;
    SELECT * FROM FINISH_DRIVE_TBL;
    
    SELECT *
    FROM RESERVATION_TBL T1, DRIVER_RST_TBL T2, FINISH_DRIVE_TBL T3
    WHERE T1.R_ID = T2.R_ID
    AND T2.R_ID = T3.R_ID AND T2.DR_ID = T3.DR_ID
    AND T3.F_GUBUN = 1
    ;
    
    SELECT TO_CHAR(T3.F_DATE, 'YYYY-MM-DD')
                , SUM(T1.R_PAY) AS TLT_PAY
                , SUM(
                    CASE 
                        WHEN T1.R_PAY >= 20000 THEN T1.R_PAY * 0.8
                        ELSE  T1.R_PAY * 0.9
                    END 
                ) AS COMPAY
                , SUM(
                    CASE 
                        WHEN T1.R_PAY >= 20000 THEN T1.R_PAY * 0.2
                        ELSE  T1.R_PAY * 0.1
                    END 
                ) AS DRIVER
            
    FROM RESERVATION_TBL T1, DRIVER_RST_TBL T2, FINISH_DRIVE_TBL T3
    WHERE T1.R_ID = T2.R_ID
    AND T2.R_ID = T3.R_ID AND T2.DR_ID = T3.DR_ID
    AND T3.F_GUBUN = 1
    GROUP BY TO_CHAR(T3.F_DATE, 'YYYY-MM-DD')
    ;
    
    
    SELECT A.BS_DATE
              , NVL(B.COMPANY, 0) AS COMPANY
              , NVL(B.DRIVER, 0) AS DRIVER
    FROM
    (
        SELECT TO_CHAR(TO_DATE('2018-05-02', 'YYYY-MM-DD') + ( LEVEL - 1 ), 'YYYY-MM-DD') AS BS_DATE
        FROM DUAL
        CONNECT BY LEVEL <= TO_DATE('2018-05-05', 'YYYY-MM-DD') -  TO_DATE('2018-05-02', 'YYYY-MM-DD') + 1
    ) A
    ,
    (
        SELECT TO_CHAR(T3.F_DATE, 'YYYY-MM-DD') AS BS_DATE
                    , SUM(T1.R_PAY) AS TLT_PAY
                    , SUM(
                        CASE 
                            WHEN T1.R_PAY >= 20000 THEN T1.R_PAY * 0.8
                            ELSE  T1.R_PAY * 0.9
                        END 
                    ) AS COMPANY
                    , SUM(
                        CASE 
                            WHEN T1.R_PAY >= 20000 THEN T1.R_PAY * 0.2
                            ELSE  T1.R_PAY * 0.1
                        END 
                    ) AS DRIVER
                
        FROM RESERVATION_TBL T1, DRIVER_RST_TBL T2, FINISH_DRIVE_TBL T3
        WHERE T1.R_ID = T2.R_ID
        AND T2.R_ID = T3.R_ID AND T2.DR_ID = T3.DR_ID
        AND T3.F_GUBUN = 1
        GROUP BY TO_CHAR(T3.F_DATE, 'YYYY-MM-DD')    
    ) B
    WHERE A.BS_DATE = B.BS_DATE(+)
    ;
    
    
     

--C 트리거
-- 대리운전이 취소가 되면 해당 이용자의 포인트를 10% 차감하는 트리거를 만들어주세요 (10점)
-- 계산은 원단위까지만 하며 소수점은 반올림한다.




