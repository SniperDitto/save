
--대리기사 풀이

--이용자의 POINT 업데이트하기
    --포인트 조회
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
    ;
    

    
    
    ------MERGE INTO : PL/SQL에만 존재(ORACLE)------------기억하기
        --INSERT와 UPDATE를 동시에
    SELECT * FROM DRIVERS_TBL;
    
    INSERT INTO DRIVERS_TBL(DR_ID, DR_NAME, DR_TEL, DR_GENDER)
    VALUES('','','','');
    
    UPDATE DRIVERS_TBL
    SET DR_ID=''
        ,DR_NAME=''
        ,DR_TEL=''
        ,DR_GENDER=''
    WHERE DR_ID='DR050';
    
    --DRIVERS_TBL에 입력된 값의 DR_ID가 존재하면 UPDATE / 없으면 INSERT
    MERGE INTO DRIVERS_TBL A
    USING DUAL --단일 테이블의 경우
    --USING (원하는 SELECT문) B : 특정 테이블 B의 값을 이용할 때
    ON (
        A.DR_ID='DR001'
        --A.~~~=B.~~~
        ) --UPDATE
    --ON DR_ID='DR050' --INSERT
    WHEN MATCHED THEN
        --UPDATE
        UPDATE
        SET DR_ID=''
            ,DR_NAME=''
            ,DR_TEL=''
            ,DR_GENDER=''
    WHEN NOT MATCHED THEN
        --INSERT
        INSERT(DR_ID, DR_NAME, DR_TEL, DR_GENDER)
        VALUES('','','','');
    
    
    
    
    --SELECT 한 값을 이용해 UPDATE 하기
    MERGE INTO DR_MEMBER_TBL A
    USING
    (
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
    ) B
    ON (
        A.R_TEL=B.R_TEL
        )
    WHEN MATCHED THEN
        UPDATE
        SET A.MEM_POINT=B.POINT
        ;

        
------------------------------------------
    --CURSOR
    --묵시적/암시적 커서
    --명시적 커서
    
    SELECT * 
    FROM DRIVERS_TBL
    ORDER BY DR_ID ASC
    ;
    
    
    
    
-----------------
    --MERGE INTO
    --CURSOR(비추) : 정말 불가피한 경우에만 사용
-----------------

    --TRIGGER
    
    
    --010-1111-1111 대리운전 신청
    --부경대앞 -> 센텀 / 20000
    SELECT * FROM RESERVATION_TBL;
    INSERT INTO RESERVATION_TBL(R_ID,R_TEL,R_STR,R_DEST,R_PAY) 
    VALUES('R0016','010-1111-1111','부경대앞','센텀',20000);
    
    --예약번호 R0016을 대리기사 DR001이 수락
    SELECT * FROM DRIVER_RST_TBL;
    INSERT INTO DRIVER_RST_TBL(R_ID,DR_ID,RST_DATE) 
    VALUES('R0016','DR001',TO_DATE('2018-05-06 19:17:22','YYYY-MM-DD HH24:MI:SS'));
    
    --손님이 예약 취소
    SELECT * FROM FINISH_DRIVE_TBL;
    INSERT INTO FINISH_DRIVE_TBL(IDX,R_ID,DR_ID,F_DATE,F_GUBUN)
    VALUES(14,'R0016','DR001',TO_DATE('2018-05-06 19:27:52','YYYY-MM-DD HH24:MI:SS'),2);
    -->FINISH에 INSERT, GBN=2 일시 포인트 차감(TRIGGER/PROCEDURE)
    
    
    
    
    
    