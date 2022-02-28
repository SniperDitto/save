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
INSERT INTO DRIVERS_TBL VALUES('DR005', '구일장', '010-9748-8174', 'M');
INSERT INTO DRIVERS_TBL VALUES('DR006', '김민선', '010-2017-9364', 'F');
INSERT INTO DRIVERS_TBL VALUES('DR007', '박미진', '010-7004-0014', 'F');


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

--A. 쿼리

--1. 대리운전 이용자의 예약 현황을 보여주세요 (5점)
       --(이용자 연락처, 출발지, 도착지, 대리운전비)
       SELECT R_TEL, R_STR, R_DEST, R_PAY
       FROM RESERVATION_TBL;
       

--2. 대리기사가 선택한 대리운전 결정 리스트를 보여주세요(5점)
        --(대리운전기사 아이디, 대리운전기사 이름, 이용자연락처, 출발지, 도착지 대리운전비)
        SELECT D.DR_ID, D.DR_NAME, R.R_TEL, R.R_STR, R.R_DEST, R.R_PAY
        FROM DRIVERS_TBL D, DRIVER_RST_TBL DR, RESERVATION_TBL R
        WHERE D.DR_ID=DR.DR_ID AND DR.R_ID=R.R_ID;
        
        
        
--3. 이용자중 가장많이 대리운전을 예약한 사용자의 연락처를 찾아주세요 (5점)
        SELECT A.R_TEL, A.CNT
        FROM
        (
            SELECT R_TEL, COUNT(R_TEL) AS CNT,
                DENSE_RANK() OVER(ORDER BY COUNT(R_TEL) DESC) AS RNK
            FROM RESERVATION_TBL
            GROUP BY R_TEL
        ) A
        WHERE A.RNK=1;



--4. 대리운전 기사들의 수익을 가장많은 기사 부터 차례대로 순위를 붙여서 보여 주세요(5점)
        SELECT D.DR_ID, D.DR_NAME, SUM(NVL(R.R_PAY,0)) AS 수익,
            DENSE_RANK() OVER(ORDER BY SUM(NVL(R.R_PAY,0)) DESC) AS RNK
        FROM DRIVERS_TBL D, RESERVATION_TBL R, FINISH_DRIVE_TBL F
        WHERE D.DR_ID=F.DR_ID(+)
            AND R.R_ID(+)=F.R_ID
        GROUP BY D.DR_ID, D.DR_NAME
            ;


--5. 이용자들중에 대리운전 예약을 한 후 취소를 가장 많이 한 이용자의 핸드폰번호를 보여주세요(5점)
        SELECT A.R_TEL, A.CNT
        FROM
        (
        SELECT R.R_TEL, COUNT(F.F_GUBUN) AS CNT,
            DENSE_RANK() OVER(ORDER BY COUNT(F.F_GUBUN) DESC) AS RNK
        FROM RESERVATION_TBL R, FINISH_DRIVE_TBL F
        WHERE R.R_ID=F.R_ID AND F.F_GUBUN=2
        GROUP BY R.R_TEL
        ) A
        WHERE A.RNK=1;


--6. 대리운전 기사들의 성별로 대리운전결정 건수를 보여주세요(5점)
        SELECT D.DR_GENDER, COUNT(DR.DR_ID)
        FROM DRIVERS_TBL D, DRIVER_RST_TBL DR
        WHERE D.DR_ID=DR.DR_ID
        GROUP BY D.DR_GENDER;
        

--7. 2018년 5월 2일부터 5월 5일까지 대리기사가 결정된 건수, 정상적으로 완료된 건수, 취소된 건수를 보여주세요(5점)
        
        SELECT D.DAYS,
            NVL(A.RCNT,0) AS 결정건수,
            NVL(B.FCNT1,0) AS 정상완료,
            NVL(C.FCNT2,0) AS 취소
        FROM 
        (
            --예약결정건수
            SELECT TO_CHAR(DR.RST_DATE,'YYYYMMDD') AS RDAY,
                COUNT(*) AS RCNT
            FROM DRIVER_RST_TBL DR, FINISH_DRIVE_TBL F
            WHERE DR.R_ID=F.R_ID
            GROUP BY TO_CHAR(DR.RST_DATE,'YYYYMMDD')
        ) A, 
        (
            --정상완료건수
            SELECT TO_CHAR(F.F_DATE,'YYYYMMDD') AS FDAY1,
                COUNT(*) AS FCNT1
            FROM DRIVER_RST_TBL DR, FINISH_DRIVE_TBL F
            WHERE DR.R_ID=F.R_ID AND F.F_GUBUN=1
            GROUP BY TO_CHAR(F.F_DATE,'YYYYMMDD')
        ) B, 
        (
            --취소건수
            SELECT TO_CHAR(F.F_DATE,'YYYYMMDD') AS FDAY2,
                COUNT(*) AS FCNT2
            FROM DRIVER_RST_TBL DR, FINISH_DRIVE_TBL F
            WHERE DR.R_ID=F.R_ID AND F.F_GUBUN=2
            GROUP BY TO_CHAR(F.F_DATE,'YYYYMMDD')
        ) C, 
        (
            --날짜
            SELECT TO_DATE('20180502')+(LEVEL-1) AS DAYS
            FROM DUAL
            CONNECT BY LEVEL<5
        ) D
        WHERE D.DAYS=A.RDAY(+) AND D.DAYS=B.FDAY1(+) AND D.DAYS=C.FDAY2(+)
        ;

--8. 이용자는 대리운전 신청을 하였으나 대리기사가 결정되지 않아서 취소된 대리운전 건을 보여주세요(5점)
    --(이용자핸드폰번호, 출발지, 도착지, 금액)
    
--9. 정상적으로 완료된 대리운전중에 가장 시간이 많이 걸린 대리운전 건을 보여주세요(5점)

--10. 대리운전비가 가장 비싼 대리운전을 보여주세요(5점)
       --(대리기사이름, 출발지, 목적지, 이용자핸드폰, 금액, 완료여부)



--B. 패키지 프로시져 - 각 5점
--1. 대리운전의 업무를 위한 패키지를 하나 만들어주세요 패키지 이름 : PKG_DRIVER  

--2. 위의 패키지에 첫번째 프로시저를 하나 만들어주세요 - 
        --새로운 대리운전 기사를 등록하는 프로시저를 만들어주세요
        --대리기사 아이디는 따로 함수로 만들지 말고 프로시저 내부에 로직을 포함시켜주세요
        
--3. 위의 패키지에 두번째 프로시저를 만들어주세요
       --현재 불특정 회원의 POINT가 모두 0원입니다.
       --프로시저를 사용하여 POINT가 모두 계산 되도록 해주세요
       
--4. 위의 패키지에 세번째 프로시저를 만들어주세요
      -- 이용자가 대리운전을 요청하는 전화를 하면
      -- 입력하는 직원은 해당 프로시저에 이용자 연락처만 입력하고 저장하면
      -- 새로운 이용자이면 DR_MEMBER_TBL에 새롭게 추가하고
      -- 이미 등록된 이용자이면 사용자 예외처리를 활용하여 에러처리를 해 주세요
      
--5   위의 패키지에 네번째 프로시저를 만들어주세요
      -- 각 요일별로 대리운전 총 매출액을 계산해서 보여주는 프로시저를 만들어 주세요
      
--6. 위의 패키지에 다섯번째 프로시저를 만들어주세요
     --2018년 5월 2일 부터 5월5일까지 회사와 대리운전기사가 벌어들인 금액을 각각 표시하는 프로시저를 만들어주세요
     
     -------------------------------------
     --    DRDATE       COMAPNY   DRIVER -----------
     --  2018-05-02      8000      2000
     --  2018-05-03      20000     5000
     --  2018-05-04      32000     8000
     --  2018-05-05      16000     2000
     -- 위와 같은 형식으로 결과가 보여지도록 해 주세요

--C 트리거
-- 대리운전이 취소가 되면 해당 이용자의 포인트를 10% 차감하는 트리거를 만들어주세요 (10점)
-- 계산은 원단위까지만 하며 소수점은 반올림한다.




