CREATE OR REPLACE PROCEDURE PROC_TBL_TYPE 
(
  O_RESULT OUT VARCHAR2 
) AS 
    --배열 내용의 갯수가 정해져 있지 않아서 편하다
    TYPE TBL_TYPE IS TABLE OF VARCHAR2(30) INDEX BY PLS_INTEGER;
    
    V_TBL_TYPE  TBL_TYPE;
    V_INDEX NUMBER(10);
    
BEGIN
    V_INDEX := 0;
    /*
    V_TBL_TYPE(0) := 'KIM';
    V_TBL_TYPE(1) := 'LEE';
    V_TBL_TYPE(2) := 'PARK';
    V_TBL_TYPE(3) := 'CHOI';
    V_TBL_TYPE(4) := 'SHIN';
    
    FOR I IN 0..4
    LOOP
        DBMS_OUTPUT.PUT_LINE(V_TBL_TYPE(I));
    END LOOP;
    */
    ---------------------------------
    /*
    FOR CUR IN
    (
        SELECT DR_ID
        FROM FINISH_DRIVE_TBL
        WHERE F_GUBUN=2
    )
    LOOP
        V_TBL_TYPE(V_INDEX) := CUR.DR_ID;
        V_INDEX := V_INDEX+1;
    END LOOP;
    
    FOR I IN 0..V_INDEX-1
    LOOP
        INSERT INTO CANCEL_TBL(IDX, DR_ID, IN_DATE)
        VALUES(SEQ_DR_ID.NEXTVAL, V_TBL_TYPE(I), TO_DATE(SYSDATE,'YYYY-MM-DD HH24:MI:SS'))
        ;
    END LOOP;
    */
    
    MERGE INTO CANCEL_TBL A
    USING
    (
        SELECT DR_ID, F_DATE
        FROM FINISH_DRIVE_TBL
        WHERE F_GUBUN=2
            AND TO_CHAR(F_DATE,'YYYYMMDD')=TO_CHAR(SYSDATE,'YYYYMMDD')
    ) B
    ON
    (
        A.DR_ID=B.DR_ID
        AND TO_CHAR(A.IN_DATE,'YYYYMMDD')=TO_CHAR(B.F_DATE,'YYYYMMDD')
        
    )
    WHEN NOT MATCHED THEN
        
        INSERT(IDX, DR_ID, IN_DATE)
        VALUES(SEQ_DR_ID.NEXTVAL, B.DR_ID, SYSDATE)
        ;
    
END PROC_TBL_TYPE;