
--함수
    --반복되는 행위를 정의하고 그 결과를 받아 사용
    --APPLICATION에서 호출 불가
    --TRANSACTION을 고려할 필요 없음
    --일반화
    
--프로시져(+패키지) : TRANSACTION (ALL OR NOTHING)
    --업무 단위
    --APPLICATION에서 호출해서 사용 가능
    
    
    SELECT * FROM STUDENTS_TBL;
    SELECT * FROM PROFESSORS_TBL;
    SELECT * FROM STUDENTS_TIME_TBL;
    SELECT * FROM COMMONS_TBL;
    
    --왼쪽 메뉴에서 함수 만들기
    --패키지에서 함수 만들기
        --다른 프로시져에서 불러올 때는 PKG_STUDENTS.FUNC_CREATE_STU_ID();




--2018-1학기 학생, 학과, 년도, 학기, 중간/기말 평균
    --수강신청 한 학생들만
    --학생ID와 이름으로 보여주기 위해 나머지 MAX()로 처리
    --학과별 처리 위해 PARTITION BY로 처리
    SELECT A.STU_ID, A.STU_NAME, 
        MAX(A.COM_ID) AS 학과ID, MAX(A.COM_VAL) AS 학과,
        MAX(A.DO_YEAR) AS 년도, MAX(A.SEMESTER) AS 학기,
        ROUND(NVL(AVG(C.SCORE),0),2) AS AVERAGE,
        SUM(NVL(C.SCORE,0)) AS TOTALSCORE,
        RANK() OVER(PARTITION BY MAX(A.COM_ID)
            ORDER BY ROUND(NVL(AVG(C.SCORE),0),2) DESC) AS RANKING
    FROM
    (
    SELECT T1.STU_ID, T1.STU_NAME, T2.COM_ID, T2.COM_VAL, T3.DO_YEAR, T3.SEMESTER, T4.SUB_ID, T4.SUB_NAME
        --학생 평균 구하는 함수를 만들면 JOIN으로 구하는 것보다 편함
        --왠만하면 JOIN으로 구하는 것이 낫다
        --각 ROW마다 함수가 실행되므로 속도가 느려진다
        --FUNC_GET_AVERAGE(T1.STU_ID, T3.DO_YEAR, T3.SEMESTER) AS AVERAGE
    FROM STUDENTS_TBL T1, COMMONS_TBL T2, STUDENTS_TIME_TBL T3, SUBJECTS_TBL T4
    WHERE T1.STU_DEPT_GRP=T2.GRP_ID
        AND T1.STU_DEPT=T2.COM_ID
        AND T1.STU_ID=T3.STU_ID
        AND T3.SUB_ID=T4.SUB_ID
        AND T3.DO_YEAR='2018'
        AND T3.SEMESTER='1'
        --479개
    ) A,
    (
        SELECT GUBUN
        FROM SCORES_TBL
        WHERE DO_YEAR='2018' AND SEMESTER='1'
        GROUP BY GUBUN
    ) B, --958개
    SCORES_TBL C
    WHERE A.STU_ID=C.STU_ID(+)
        AND A.SUB_ID=C.SUB_ID(+)
        AND B.GUBUN=C.GUBUN(+)--957개
        --AND C.GUBUN IS NULL--홍길동26, 화학3시험
        AND B.GUBUN='1'--중간/479개
        GROUP BY A.STU_ID, A.STU_NAME
    ;--모든학생의 모든시험 테이블과 SCORES를 JOIN





--학점 매기기
--COMMONS_TBL에 학점 처리 기준을 추가
    --함수를 만들어 처리한다
    --JOIN으로 처리하기에 너무 복잡하기 때문
    SELECT * FROM GRPCOMMONS_TBL;
    
    INSERT INTO GRPCOMMONS_TBL(GRP_ID, GRP_NAME) VALUES('GRP003','학점처리기준');
    
    --A : 90<=X<101 (4.5)
    --B : 80<=X<90 (3.5)
    --C : 70<=X<80 (2.5)
    --D : 60<=X<70 (1.5)
    --F : 0<=X<60 (0)
    
    --COMMONS_TBL에 예외값 컬럼을 추가해 점수 범위, 학점 수치를 표시
    
    SELECT * FROM COMMONS_TBL
    WHERE GRP_ID='GRP004';
    
    INSERT INTO COMMONS_TBL(COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3)
    VALUES('COM4000','GRP004','ROOT',0,'ROOT',NULL,NULL,NULL);
    INSERT INTO COMMONS_TBL(COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3)
    VALUES('COM0001','GRP004','A',1,'COM4000',4.5,90,101);
    INSERT INTO COMMONS_TBL(COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3)
    VALUES('COM0002','GRP004','B',1,'COM4000',3.5,80,90);
    INSERT INTO COMMONS_TBL(COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3)
    VALUES('COM0003','GRP004','C',1,'COM4000',2.5,70,80);
    INSERT INTO COMMONS_TBL(COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3)
    VALUES('COM0004','GRP004','D',1,'COM4000',1.5,60,70);
    INSERT INTO COMMONS_TBL(COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3)
    VALUES('COM0005','GRP004','F',1,'COM4000',0,0,60);
    
    
    
    --점수 처리 패키지 PKG_SCORES에 학점 구하는 함수 추가
    
    ---
    
    
    
    
    --과목별 평균
    SELECT SUB_ID, SCORE, SUB_CREDIT----------------------수정필요
        --수업 학점에 따라 반영 비율 수정
        ,PKG_SCORES.FUNC_GET_GRADE(NVL(SCORE,0)) AS GRADE
        ,SUB_CREDIT * PKG_SCORES.FUNC_GET_GRADE(NVL(SCORE,0)) AS TOTALGRADE
    FROM
    (
    SELECT D.SUB_ID, AVG(D.SCORE), MAX(SUB_CREDIT) AS SUB_CREDIT
    FROM
    (
    SELECT A.STU_ID, A.DO_YEAR, A.SEMESTER
        ,A.SUB_ID, A.SUB_CREDIT, NVL(C.SCORE,0) AS SCORE, B.GUBUN
        
    FROM
    (
        SELECT T1.STU_ID, T2.SUB_ID, T2.SUB_CREDIT, T1.DO_YEAR, T1.SEMESTER
        FROM STUDENTS_TIME_TBL T1, SUBJECTS_TBL T2
        WHERE T1.SUB_ID=T2.SUB_ID
            AND T1.STU_ID='STU001'
            AND T1.DO_YEAR='2018' AND T1.SEMESTER='1'
    ) A,
    (
        SELECT GUBUN
        FROM SCORES_TBL
        WHERE DO_YEAR='2018' AND SEMESTER='1'
        GROUP BY GUBUN
    ) B,
    SCORES_TBL C
    WHERE A.STU_ID=C.STU_ID(+)
        AND A.SUB_ID=C.SUB_ID(+)
        AND B.GUBUN=C.GUBUN(+)
    )D
    GROUP BY D.SUB_ID
    )
    GROUP BY SUB_ID, SCORE, SUB_CREDIT
        ;
    
    
    --COMMONS_TBL의 예외값으로 점수 찾기
    SELECT *
    FROM COMMONS_TBL
    WHERE GRP_ID='GRP004'
        AND COM_LVL='1'
        AND EXP_VAL3 > :IN_SCORE
        AND EXP_VAL2 <= :IN_SCORE
    ;

    SELECT PKG_SCORES.FUNC_GET_GRADE(NVL(85,0)) AS GRADE
    FROM DUAL;

--------------------------------------------

    --학과별 학생수
    SELECT T1.STU_DEPT_GRP, T1.STU_DEPT, T2.COM_ID, T2.COM_VAL, COUNT(T1.STU_ID) AS CNT
    FROM STUDENTS_TBL T1, COMMONS_TBL T2
    WHERE T1.STU_DEPT_GRP(+)=T2.GRP_ID
        AND T1.STU_DEPT(+)=T2.COM_ID
        AND T2.GRP_ID='GRP002'
        AND T2.COM_LVL=2
    GROUP BY T1.STU_DEPT_GRP, T1.STU_DEPT, T2.COM_ID, T2.COM_VAL
    ;
    
    --학과별 학생수 함수로
    SELECT COM_ID, COM_VAL, FUNC_GET_CNT_BYDEPT(COM_ID,'GRP002') AS CNT
    FROM COMMONS_TBL
    WHERE GRP_ID='GRP002'
        AND COM_LVL=2
    ;
    
---------------------------------------------
    
    --VIEW
    --메모리 상에 존재하는 가상의 테이블
    --VIEW와 TRIGGER는 사용 지양하는 것이 좋다
    
    SELECT * FROM VIEW_SCORE;
    
    UPDATE VIEW_SCORE
    SET STU_NAME='홍길순'
    WHERE STU_ID='STU017';
    
---------------------------------------------
    SELECT * FROM STUDENTS_TBL;
    SELECT * FROM PROFESSORS_TBL;
    SELECT * FROM SUBJECTS_TBL;
    
    --SEQUENCE
    --한번 호출될 때마다 증가 : 복구 X
    --IDX로 쓰기보다는 여러 테이블에 몇 회의 INSERT가 수행되었는지 등을 파악할 때 사용
    --PK로 쓰지 않는 것이 좋다.
    
    --혹은 증가값을 2로 두고 홀수만/짝수만 필요할 때 사용
    CREATE TABLE TEST_TBL
    (
        IDX     INTEGER         PRIMARY KEY,
        NAME    VARCHAR2(30)    NOT NULL
    );
    
    INSERT INTO TEST_TBL(IDX, NAME) VALUES(1,'홍길동');
    
-------------------------------------------------
    --중간에 있는 데이터를 지웠을 때 뒤의 번호들 앞으로 당기기
    --ALL OR NOTHING
      UPDATE TEST_TBL
      SET IDX=IDX-1
      WHERE IDX>IN_IDX;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
