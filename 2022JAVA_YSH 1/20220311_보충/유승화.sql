--업무 설명
--1. 회사는 대리기사를 모집하고 관리한다.
--2. 불특정 다수의 대리운전 이용자는 전화를 하고 대리운전기사를 예약한다.
--3. 전화를 받은 대리기사 회사의 직원은 걸려온 전화를 내용을 입력하고 대리기사의 선택을 기다린다.
--4. 선택된 대리기사는 전화를 한 이용자에게 대리운전을 하고 예정된 금액을 받는다.
--5. 대리가 완료되면 불특정 다수의 이용자에게 대리 금액의 3%를 포인트로 적립한다. - 계산은 원단위까지에서 소수점은 반올림 한다.
--6. 수익은 20000원 이상이면 대리기사 80% 회사 20%를 그 미만이면 대리기사 90% 회사 10%를 가져간다.


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
        SELECT A.R_TEL, A.CNT||'회' AS 예약횟수
        FROM
        (
            SELECT R_TEL, COUNT(R_TEL) AS CNT,
                DENSE_RANK() OVER(ORDER BY COUNT(R_TEL) DESC) AS RNK
            FROM RESERVATION_TBL
            GROUP BY R_TEL
        ) A
        WHERE A.RNK=1;



--4. 대리운전 기사들의 수익을 가장많은 기사 부터 차례대로 순위를 붙여서 보여 주세요(5점)
        
        --기사별 수익 + 순위
        SELECT D.DR_ID, D.DR_NAME, SUM(NVL(R.R_PAY,0)) AS 수익,
            DENSE_RANK() OVER(ORDER BY SUM(NVL(R.R_PAY,0)) DESC) AS RNK
        FROM DRIVERS_TBL D, RESERVATION_TBL R,
        (
            --예약이 정상적으로 완료된 건들    
            SELECT R_ID, DR_ID
            FROM FINISH_DRIVE_TBL
            WHERE F_GUBUN = 1
        ) A
        WHERE D.DR_ID=A.DR_ID
            AND R.R_ID=A.R_ID
        GROUP BY D.DR_ID, D.DR_NAME
        ;
        
        


--5. 이용자들중에 대리운전 예약을 한 후 취소를 가장 많이 한 이용자의 핸드폰번호를 보여주세요(5점)
        SELECT A.R_TEL, A.CNT||'회' AS 취소횟수
        FROM
        (
            --이용자별 취소횟수
            SELECT R.R_TEL, COUNT(F.F_GUBUN) AS CNT,
                DENSE_RANK() OVER(ORDER BY COUNT(F.F_GUBUN) DESC) AS RNK
            FROM RESERVATION_TBL R, FINISH_DRIVE_TBL F
            WHERE R.R_ID=F.R_ID(+) 
                AND F.F_GUBUN=2
            GROUP BY R.R_TEL
        ) A
        WHERE A.RNK=1;
        


--6. 대리운전 기사들의 성별로 대리운전결정 건수를 보여주세요(5점)
        SELECT DECODE(D.DR_GENDER,'M','남자','F','여자') AS GENDER,
            COUNT(DR.DR_ID) AS CNT
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
        ORDER BY D.DAYS ASC
        ;

--8. 이용자는 대리운전 신청을 하였으나 대리기사가 결정되지 않아서 취소된 대리운전 건을 보여주세요(5점)
    --(이용자핸드폰번호, 출발지, 도착지, 금액)
        
    SELECT R.R_TEL AS 이용자번호,
        R.R_STR AS 출발지,
        R.R_DEST AS 도착지,
        R.R_PAY AS 금액
    FROM RESERVATION_TBL R, DRIVER_RST_TBL DR
    WHERE R.R_ID=DR.R_ID(+)
        AND DR.DR_ID IS NULL
    ;
    
--9. 정상적으로 완료된 대리운전중에 가장 시간이 많이 걸린 대리운전 건을 보여주세요(5점)

    --가장 많이 걸린 건
    SELECT A.R_ID
        ,A.RDATE AS 출발시각
        ,A.FDATE AS 도착시각
        ,A.RUNTIME AS 걸린시간
    FROM
    (
        --정상완료건들 걸린 시간
        SELECT F.R_ID, TO_CHAR(DR.RST_DATE, 'YYYY/MM/DD HH:MI:SS') AS RDATE
            ,TO_CHAR(F.F_DATE, 'YYYY/MM/DD HH:MI:SS') AS FDATE
            ,ROUND((F.F_DATE-DR.RST_DATE)*24*60,2)||'분' AS RUNTIME
            ,DENSE_RANK() OVER(ORDER BY ROUND((F.F_DATE-DR.RST_DATE)*24*60,2) DESC) AS RNK 
        FROM FINISH_DRIVE_TBL F, DRIVER_RST_TBL DR
        WHERE F.R_ID=DR.R_ID
            AND F.F_GUBUN=1
    ) A
    WHERE A.RNK=1
    ;
    

--10. 대리운전비가 가장 비싼 대리운전을 보여주세요(5점)
       --(대리기사이름, 출발지, 목적지, 이용자핸드폰, 금액, 완료여부)
    SELECT *
    FROM
    (
        --금액 랭킹
        SELECT D.DR_NAME AS 기사이름,
            R.R_STR AS 출발지,
            R.R_DEST AS 목적지,
            R.R_TEL AS 이용자번호,
            R.R_PAY AS 금액,
            DECODE(F.F_GUBUN,1,'O',2,'X') AS 완료여부,
            DENSE_RANK() OVER(ORDER BY R.R_PAY DESC) AS RANKING
        FROM RESERVATION_TBL R, FINISH_DRIVE_TBL F, DRIVERS_TBL D
        WHERE R.R_ID=F.R_ID
            AND F.DR_ID=D.DR_ID
            --AND F.F_GUBUN=1 --완료건
            --AND F.F_GUBUN=2 --취소건
    ) A
    WHERE A.RANKING=1
    ;


--B. 패키지 프로시져 - 각 5점
--1. 대리운전의 업무를 위한 패키지를 하나 만들어주세요 패키지 이름 : PKG_DRIVER 
    

--2. 위의 패키지에 첫번째 프로시저를 하나 만들어주세요 - 
        --새로운 대리운전 기사를 등록하는 프로시저를 만들어주세요
        --대리기사 아이디는 따로 함수로 만들지 말고 프로시저 내부에 로직을 포함시켜주세요
        
        --아이디만들기
        SELECT 'DR'||TO_CHAR(TO_NUMBER(NVL(SUBSTR(TRIM(MAX(DR_ID)),3,3),-1))+1,'FM000')
        FROM DRIVERS_TBL
        ;

--3. 위의 패키지에 두번째 프로시저를 만들어주세요
       --현재 불특정 회원의 POINT가 모두 0원입니다.
       --프로시저를 사용하여 POINT가 모두 계산 되도록 해주세요
       
       
       --포인트 내역 테이블 따로 X
        UPDATE DR_MEMBER_TBL
        SET MEM_POINT=MEM_POINT+(IN_PAY*0.03)
        WHERE R_TEL=:IN_R_TEL
        ;
       
--4. 위의 패키지에 세번째 프로시저를 만들어주세요
      -- 이용자가 대리운전을 요청하는 전화를 하면
      -- 입력하는 직원은 해당 프로시저에 이용자 연락처만 입력하고 저장하면
      -- 새로운 이용자이면 DR_MEMBER_TBL에 새롭게 추가하고
      -- 이미 등록된 이용자이면 사용자 예외처리를 활용하여 에러처리를 해 주세요
        INSERT INTO DR_MEMBER_TBL(R_TEL, MEM_POINT)
        VALUES(IN_R_TEL,0)
        ;
      
--5   위의 패키지에 네번째 프로시저를 만들어주세요
      -- 각 요일별로 대리운전 총 매출액을 계산해서 보여주는 프로시저를 만들어 주세요

        SELECT TO_CHAR(F.F_DATE,'YYYY/MM/DD DAY') AS 날짜
            , SUM(R_PAY) AS 매출
        FROM RESERVATION_TBL R, FINISH_DRIVE_TBL F
        WHERE R.R_ID=F.R_ID
            AND F.F_GUBUN=1
        GROUP BY TO_CHAR(F.F_DATE,'YYYY/MM/DD DAY')
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
     
     --날짜만들기
     SELECT TO_DATE('20180502','YYYYMMDD')+LEVEL-1
     FROM DUAL
     CONNECT BY LEVEL<=(TO_DATE('20180505','YYYYMMDD')+1-TO_DATE('20180502','YYYYMMDD'))
     ;
     
     --해당 날짜에 일어난 정상완료건에 한하여 R_ID로 R_PAY를 조회하고 그 금액에 따라 수익 분배
     --20000원 이상이면 대리기사 80% 회사 20% / 미만이면 대리기사 90% 회사 10%
     SELECT --F.R_ID, 
        TO_CHAR(F.F_DATE,'YYYY/MM/DD') AS DRDATE
        --, R.R_PAY
        ,CASE WHEN R.R_PAY>=20000 THEN R.R_PAY*0.8 ELSE R.R_PAY*0.9 END DRIVERMONEY
        ,CASE WHEN R.R_PAY>=20000 THEN R.R_PAY*0.2 ELSE R.R_PAY*0.1 END COMPANYMONEY
     FROM RESERVATION_TBL R,
     (
         SELECT R_ID, F_DATE
         FROM FINISH_DRIVE_TBL
         WHERE F_GUBUN=1
     ) F
     WHERE R.R_ID=F.R_ID
     ;
     
     ----------------------날짜별로 기사/회사
     SELECT B.DRDATE
        , SUM(B.DRIVERMONEY) AS DRMONEY
        , SUM(B.COMPANYMONEY) AS COMMONEY
     FROM
     (
         SELECT A.DRDATE
            ,CASE WHEN R.R_PAY>=20000 THEN R.R_PAY*0.8 ELSE R.R_PAY*0.9 END DRIVERMONEY
            ,CASE WHEN R.R_PAY>=20000 THEN R.R_PAY*0.2 ELSE R.R_PAY*0.1 END COMPANYMONEY
         FROM RESERVATION_TBL R,
         (
             SELECT R_ID, F_DATE
             FROM FINISH_DRIVE_TBL
             WHERE F_GUBUN=1
         ) F,
         (
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
    
--C 트리거
-- 대리운전이 취소가 되면 해당 이용자의 포인트를 10% 차감하는 트리거를 만들어주세요 (10점)
-- 계산은 원단위까지만 하며 소수점은 반올림한다.
    