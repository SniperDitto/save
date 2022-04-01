create or replace NONEDITIONABLE PACKAGE BODY PKG_STUDENTS AS

    FUNCTION FUNC_CREATE_STU_ID
    RETURN VARCHAR2 
    AS
        V_NEW_STU_ID            CHAR(6);
    BEGIN
    
           SELECT 'STU' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID), 'STU000'), 4, 3)) + 1, 'FM000')
           INTO V_NEW_STU_ID
           FROM STUDENTS_TBL
           ; 
           
        RETURN V_NEW_STU_ID;
           
    END FUNC_CREATE_STU_ID
    ;



  PROCEDURE PROC_INS_STUDENTS
    (
          IN_STU_NAME       IN VARCHAR2 
        , IN_STU_TEL        IN VARCHAR2 
        , IN_STU_ADDR_GRP   IN VARCHAR2 
        , IN_STU_ADDR       IN VARCHAR2 
        , IN_STU_DEPT_GRP   IN VARCHAR2 
        , IN_STU_DEPT       IN VARCHAR2 
        , IN_STU_ADDR2      IN VARCHAR2 
    ) 
  AS
  
  V_NEW_STU_ID      VARCHAR2(6);
  
  BEGIN

    /*
    SELECT 'STU' || TO_CHAR(TO_NUMBER(SUBSTR(MAX(STU_ID), 4,3)) + 1, 'FM000')
    INTO V_NEW_STU_ID
    FROM STUDENTS_TBL
    ;
    */
    V_NEW_STU_ID := PKG_STUDENTS.FUNC_CREATE_STU_ID();
    
    
    INSERT INTO STUDENTS_TBL(STU_ID, STU_NAME, STU_TEL, STU_ADDR_GRP, STU_ADDR, STU_DEPT_GRP, STU_DEPT, STU_ADDR2)
    VALUES(
            V_NEW_STU_ID
            , IN_STU_NAME
            , IN_STU_TEL
            , IN_STU_ADDR_GRP
            , IN_STU_ADDR
            , IN_STU_DEPT_GRP
            , IN_STU_DEPT
            , IN_STU_ADDR2
    );


  END PROC_INS_STUDENTS;
  
  
      --2. 조회
    PROCEDURE PROC_SEL_STUDENTS
    (
        IN_STU_ID           IN VARCHAR2
        , IN_STU_NAME       IN VARCHAR2
        , O_CURSOR          OUT     SYS_REFCURSOR
    )
    AS
    
    BEGIN
        
        OPEN O_CURSOR FOR
        SELECT * FROM STUDENTS_TBL
        WHERE STU_ID LIKE '%' || IN_STU_ID || '%'
        AND STU_NAME LIKE '%' || IN_STU_NAME ||'%'
        ;
        
        
    END PROC_SEL_STUDENTS;
    
    
    
    --3.수정
    PROCEDURE PROC_UP_STUDENTS
    (
          IN_STU_ID         IN VARCHAR2
        , IN_STU_NAME       IN VARCHAR2 
        , IN_STU_TEL        IN VARCHAR2 
        , IN_STU_ADDR_GRP   IN VARCHAR2 
        , IN_STU_ADDR       IN VARCHAR2 
        , IN_STU_DEPT_GRP   IN VARCHAR2 
        , IN_STU_DEPT       IN VARCHAR2 
        , IN_STU_ADDR2      IN VARCHAR2 
        , IN_STU_PASS       IN VARCHAR2
    )
    AS
    BEGIN

        UPDATE STUDENTS_TBL
        SET STU_NAME = IN_STU_NAME,
            STU_TEL = IN_STU_TEL,
            STU_ADDR_GRP = IN_STU_ADDR_GRP,
            STU_ADDR = IN_STU_ADDR,
            STU_DEPT_GRP = IN_STU_DEPT_GRP,
            STU_DEPT = IN_STU_DEPT,
            STU_ADDR2 = IN_STU_ADDR2,
            STU_PASS = IN_STU_PASS
        WHERE STU_ID = IN_STU_ID
        ;

    END PROC_UP_STUDENTS;
    
    
    --4. 삭제
    PROCEDURE PROC_DEL_STUDENT
    (
        IN_STU_ID           IN VARCHAR2,
        O_ERRCODE           OUT VARCHAR2,
        O_ERRMSG            OUT VARCHAR2
    )
    AS
    V_STUDENTS_CNT          NUMBER(1);
    V_STUTIME_CNT           NUMBER(1);
    V_SCORE_CNT             NUMBER(1);
    
    STUDENTS_DEL_EXCEPTION         EXCEPTION;
    STUTIME_DEL_EXCEPTION          EXCEPTION;
    SCORES_DEL_EXCEPTION           EXCEPTION;
    
    BEGIN
        --아래의 3개의 업무가 반드시 동시에 발생 -- 하나의 트랜잭션 -- ALL OR NOTHING
        --학생 데이터를 지운다
        --시간표 데이터 삭제
        --성적 데이터 삭제
        
        SELECT DECODE(MAX(STU_ID), NULL, 0, 1) INTO V_STUDENTS_CNT
        FROM STUDENTS_TBL
        WHERE STU_ID = IN_STU_ID
        ;
        
        --1. 학생 데이터를 지운다
        IF V_STUDENTS_CNT = 0 THEN
            --에러발생 -- 예외처리
            RAISE STUDENTS_DEL_EXCEPTION;
        ELSE
            DELETE FROM STUDENTS_TBL
            WHERE STU_ID = IN_STU_ID
            ;
        END IF
        ;
        
        SELECT DECODE(MAX(STU_ID), NULL, 0 , 1)
        INTO V_STUTIME_CNT
        FROM STUDENTS_TIME_TBL
        WHERE STU_ID = IN_STU_ID
        ;
        
        --2. 시간표 데이터 삭제
        IF V_STUTIME_CNT = 0 THEN
            RAISE STUTIME_DEL_EXCEPTION;
        ELSE
            DELETE FROM STUDENTS_TIME_TBL
            WHERE STU_ID = IN_STU_ID
            ;
        END IF;
        
        SELECT COUNT(*) INTO V_SCORE_CNT
        FROM SCORES_TBL
        WHERE STU_ID = IN_STU_ID
        ;
        
        --3.성적 데이터 삭제 
        IF V_SCORE_CNT = 0 THEN
            RAISE SCORES_DEL_EXCEPTION;
        ELSE
            DELETE FROM SCORES_TBL
            WHERE STU_ID = IN_STU_ID
            ;
        END IF;
        
        
        
        EXCEPTION
        WHEN STUDENTS_DEL_EXCEPTION THEN
        O_ERRCODE := 'ERR001';
        O_ERRMSG := '삭제하시려는 학생의 데이터가 존재하지 않습니다. !!!';
        ROLLBACK;
        
        WHEN STUTIME_DEL_EXCEPTION THEN
        O_ERRCODE := 'ERR002';
        O_ERRMSG := '삭제하시려는 학생의 수강신청 데이터가 존재하지 않습니다. !!!';
        ROLLBACK;
        
        WHEN SCORES_DEL_EXCEPTION THEN
        O_ERRCODE := 'ERR003';
        O_ERRMSG := '삭제하시려는 학생의 성적 데이터가 존재하지 않습니다. !!!';
        ROLLBACK;
        
        WHEN OTHERS THEN
        O_ERRCODE := SQLCODE;
        O_ERRMSG := SQLERRM;
    
    END PROC_DEL_STUDENT;
    
    
    --5.학생별 신청과목 리스트
    PROCEDURE PROC_REQ_SUBJECT_LIST
    (
        IN_STU_ID           IN VARCHAR2
        ,IN_STU_NAME        IN VARCHAR2
        ,O_CURSOR           OUT SYS_REFCURSOR
    )
    AS
    
    BEGIN
    
        OPEN O_CURSOR FOR
        SELECT A.STU_ID, A.STU_NAME, B.COMVAL || ' ' || B.COM_VAL, A.SUB_ID, A.SUB_NAME, A.SUB_CREDIT  FROM
        (
            SELECT T1.STU_ID, T1.STU_NAME, T1.STU_DEPT_GRP, T1.STU_DEPT, T3.SUB_ID, T3.SUB_NAME, T3.SUB_CREDIT
            FROM STUDENTS_TBL T1, STUDENTS_TIME_TBL T2, SUBJECTS_TBL T3
            WHERE T1.STU_ID = T2.STU_ID
            AND T3.SUB_ID = T2.SUB_ID
        ) A
        ,
        (
            SELECT T2.GRP_ID, T2.COM_ID, T2.COM_VAL, T1.COM_VAL AS COMVAL  
            FROM COMMONS_TBL T1, COMMONS_TBL T2
            WHERE T1.GRP_ID = T2.GRP_ID AND T1.COM_ID = T2.PARENT_ID
            AND T1.GRP_ID = 'GRP002' AND T2.COM_LVL = 2
        ) B
        WHERE A.STU_DEPT_GRP = B.GRP_ID AND A.STU_DEPT = B.COM_ID
        AND A.STU_ID LIKE '%' || IN_STU_ID || '%'
        AND A.STU_NAME LIKE '%' ||  IN_STU_NAME || '%'
        ORDER BY A.STU_ID ASC
        ;
    
    END PROC_REQ_SUBJECT_LIST;
    
    
  
  

END PKG_STUDENTS;