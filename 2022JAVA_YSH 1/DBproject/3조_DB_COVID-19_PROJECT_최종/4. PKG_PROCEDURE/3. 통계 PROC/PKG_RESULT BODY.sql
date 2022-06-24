CREATE OR REPLACE
PACKAGE BODY PKG_RESULT AS

  PROCEDURE PROC_TASK_1 
    (
        IN_HOS_ID        IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
  
    OPEN O_CURSOR FOR
    SELECT A.HOS_ID, A.HOS_NAME, B.COM_VAL, A.PATIENT
        FROM
        (
            SELECT T3.HOS_ID, T3.HOS_NAME, T3.HOS_ADDR, COUNT(T1.PER_ID) AS PATIENT
            FROM TREAT_TBL T1, DOCTOR_TBL T2, HOSPITAL_TBL T3
            WHERE T1.DOC_ID = T2.DOC_ID
            AND T2.HOS_ID = T3.HOS_ID
            GROUP BY T3.HOS_ID, T3.HOS_NAME, T3.HOS_ADDR
        )A, COMMONS_TBL B
        WHERE A.HOS_ADDR = B.COM_ID
        AND A.HOS_ID LIKE '%'||IN_HOS_ID||'%'
        ;
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_1;
-----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_2
    (
        IN_PER_ID        IN      VARCHAR2
        ,IN_PER_NAME     IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
    OPEN O_CURSOR FOR
    
    SELECT T1.PER_ID, T4.PER_NAME, T2.INJ_DATE, T2.INJ_CNT, T3.VAC_ID
    FROM ADMISSION_TBL T1, INJECTION_TBL T2, RESERVATION_TBL T3,PERSON_TBL T4
    WHERE T1.PER_ID = T3.PER_ID
    AND T2.RES_ID = T3.RES_ID
    AND T1.PER_ID = T4.PER_ID
    AND T1.PER_ID LIKE '%'||IN_PER_ID||'%'
    AND T4.PER_NAME LIKE '%'||IN_PER_NAME||'%'
    GROUP BY T1.PER_ID, T2.INJ_DATE, T2.INJ_CNT, T3.VAC_ID,T4.PER_NAME
    ORDER BY T1.PER_ID ASC;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_2;
-----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_3
    (
        IN_INJ_CNT       IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
  
    OPEN O_CURSOR FOR
    SELECT A.INJ_CNT, ROUND((A.INJ_PERSON / COUNT(B.PER_ID)), 2) * 100 || '%' AS INJ_RATE
        FROM
        (
            SELECT T1.INJ_CNT, COUNT(T3.PER_ID) AS INJ_PERSON
            FROM INJECTION_TBL T1, PERSON_TBL T2, RESERVATION_TBL T3
            WHERE T1.RES_ID = T3.RES_ID
            AND T2.PER_ID = T3.PER_ID
            GROUP BY T1.INJ_CNT
        )A, PERSON_TBL B
        WHERE A.INJ_CNT LIKE '%'||IN_INJ_CNT||'%'
        GROUP BY A.INJ_CNT, A.INJ_PERSON
        ORDER BY A.INJ_CNT ASC
        ;
        
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_3;
-----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_4
    (
        IN_INJ_CNT       IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
    OPEN O_CURSOR FOR
    SELECT AA.INJ_CNT, ROUND((AA.PAT_PER / COUNT(BB.RES_ID)), 3) * 100 || '%' AS PCT
    FROM
        (
            SELECT B.INJ_CNT, COUNT(A.PAT_ID) AS PAT_PER
            FROM 
            (   
                SELECT T1.PAT_ID, T1.PER_ID, T1.HOS_ID
                FROM PATIENT_TBL T1, PERSON_TBL T2
                WHERE T1.PER_ID = T2.PER_ID
            ) A,
            (
                SELECT T2.INJ_CNT, T1.PER_ID, T1.HOS_ID
                FROM RESERVATION_TBL T1, INJECTION_TBL T2
                WHERE T1.RES_ID = T2.RES_ID
            ) B
            WHERE A.PER_ID = B.PER_ID
            AND A.HOS_ID = B.HOS_ID
            GROUP BY B.INJ_CNT
        ) AA, INJECTION_TBL BB
    WHERE AA.INJ_CNT = BB.INJ_CNT
    AND AA.INJ_CNT LIKE '%'||IN_INJ_CNT||'%'
    GROUP BY AA.INJ_CNT, AA.PAT_PER
    ORDER BY AA.INJ_CNT
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_4;
-----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_5
    (
        IN_AGE_GROUP     IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
    OPEN O_CURSOR FOR

    SELECT C.BASIC_AGE || '대' AS AGE_GROUP 
           , NVL(D.INJECT_CNT, 0) AS INJECT_CNT
           , NVL(D.TREAT_CNT, 0) AS TREAT_CNT
           , NVL(D.PERCENT, 0) || '%' AS PERCENT
    FROM
    (
        SELECT LEVEL * 10 AS BASIC_AGE
        FROM DUAL
        CONNECT BY LEVEL <= 12
    ) C
    ,
    (
        SELECT AGE2, COUNT(*) AS INJECT_CNT, COUNT(PER_ID2) AS TREAT_CNT 
                , ROUND(COUNT(PER_ID2) / COUNT(*) * 100, 2) AS PERCENT
        FROM
        (
            SELECT A.PER_ID, A.PER_NAME, B.PER_ID AS PER_ID2
                    , TO_CHAR(SYSDATE, 'YYYY') AS N_YEAR
                    , CASE 
                        WHEN SUBSTR(A.PER_ID, 8,1) = '3' OR SUBSTR(A.PER_ID, 8,1) = '4' THEN '20' || SUBSTR(TRIM(A.PER_ID), 1, 2)
                        ELSE '19' || SUBSTR(TRIM(A.PER_ID), 1, 2)
                      END AS B_YEAR
                    , TO_CHAR(SYSDATE, 'YYYY') - 
                      CASE 
                        WHEN SUBSTR(A.PER_ID, 8,1) = '3' OR SUBSTR(A.PER_ID, 8,1) = '4' THEN '20' || SUBSTR(TRIM(A.PER_ID), 1, 2)
                        ELSE '19' || SUBSTR(TRIM(A.PER_ID), 1, 2)
                      END AS AGE
                    , 
                    TRUNC(
                    TO_CHAR(SYSDATE, 'YYYY') - 
                      CASE 
                        WHEN SUBSTR(A.PER_ID, 8,1) = '3' OR SUBSTR(A.PER_ID, 8,1) = '4' THEN '20' || SUBSTR(TRIM(A.PER_ID), 1, 2)
                        ELSE '19' || SUBSTR(TRIM(A.PER_ID), 1, 2)
                      END
                    , -1) AS AGE2
                    
            FROM
            (
                SELECT T1.PER_ID, T1.PER_NAME 
                FROM PERSON_TBL T1, RESERVATION_TBL T2, INJECTION_TBL T3
                WHERE T1.PER_ID = T2.PER_ID
                AND T2.RES_ID = T3.RES_ID
                GROUP BY T1.PER_ID, T1.PER_NAME
            ) A
            ,
            (
                SELECT PER_ID FROM PATIENT_TBL
                GROUP BY PER_ID
            ) B
            WHERE A.PER_ID = B.PER_ID(+)
        )
        GROUP BY AGE2
    ) D
    WHERE C.BASIC_AGE = D.AGE2(+)
    AND C.BASIC_AGE = IN_AGE_GROUP
    ORDER BY C.BASIC_AGE ASC
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_5;
-----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_6
    (
        IN_AGE_GROUP     IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
    OPEN O_CURSOR FOR
    
    SELECT AVGAGE || '대', AVG(TLTPRICE) AS AVGPRICE
    FROM
    (
    SELECT
            CASE WHEN T5.AGE < 10 THEN '10세 미만'
                WHEN T5.AGE < 20 THEN '10'
                WHEN T5.AGE < 30 THEN '20'
                WHEN T5.AGE < 40 THEN '30'
                WHEN T5.AGE < 50 THEN '40'
                WHEN T5.AGE < 60 THEN '50'
                WHEN T5.AGE < 70 THEN '60'
                WHEN T5.AGE < 80 THEN '70'
                WHEN T5.AGE < 90 THEN '80'
                WHEN T5.AGE < 100 THEN '90'
                WHEN T5.AGE < 110 THEN '100'
                WHEN T5.AGE < 120 THEN '110'
                WHEN T5.AGE < 130 THEN '120'
                ELSE 'ERROR'
            END AS AVGAGE
                
        , (T2.TREPER_TREPAY + T3.ADMPER_ROOMPAY + T4.ADMPER_MEDPAY) AS TLTPRICE
    FROM PERSON_TBL T1,
    (
        --진료받은사람별 진료비
        SELECT T2.PER_ID, SUM(T2.TRE_PAY) AS TREPER_TREPAY
        FROM PATIENT_TBL T1
            , TREAT_TBL T2
        WHERE T1.PAT_ID=T2.PAT_ID
        GROUP BY T2.PER_ID
    ) T2,
    (
        --입원한사람별 병실비
        SELECT A.PER_ID, A.PER_NAME, SUM(B.ROOMPAY) AS ADMPER_ROOMPAY
        FROM
        (
            --사람 + 입원
            SELECT T1.PER_NAME, T1.PER_ID, T2.ADM_ID
            FROM PERSON_TBL T1, ADMISSION_TBL T2
            WHERE T1.PER_ID=T2.PER_ID
        ) A,
        (
            --입원건별 병실비
            SELECT T2.ADM_ID
                , SUM(TO_NUMBER(T1.EXP_VAL1)) AS ROOMPAY
            FROM COMMONS_TBL T1
                , ADMISSION_ROOMS_TBL T2
            WHERE T1.GRP_ID=T2.ADM_ROOM_GRP
                AND T1.COM_ID=T2.ADM_ROOM
            GROUP BY T2.ADM_ID
        ) B
        WHERE A.ADM_ID=B.ADM_ID
        GROUP BY A.PER_ID, A.PER_NAME
    ) T3,
    (
        --입원한사람별 약값
        SELECT A.PER_ID, A.PER_NAME, SUM(B.MEDPAY) AS ADMPER_MEDPAY
        FROM
        (
            --사람 + 입원
            SELECT T1.PER_NAME, T1.PER_ID, T2.ADM_ID
            FROM PERSON_TBL T1, ADMISSION_TBL T2
            WHERE T1.PER_ID=T2.PER_ID
        ) A,
        (
            --입원건별 약값
            SELECT T2.ADM_ID
                , SUM(TO_NUMBER(T1.EXP_VAL1)*ADM_MED_QTY) AS MEDPAY
            FROM COMMONS_TBL T1
                , ADMISSION_MEDICINES_TBL T2
            WHERE T1.GRP_ID=T2.ADM_MED_GRP
                AND T1.COM_ID=T2.ADM_MED
            GROUP BY T2.ADM_ID
        ) B
        WHERE A.ADM_ID=B.ADM_ID
        GROUP BY A.PER_ID, A.PER_NAME
    ) T4,
    (
        SELECT PER_ID, (TO_CHAR(SYSDATE, 'YYYY') - TO_NUMBER(DECODE(SUBSTR(PER_ID, 8, 1), 1, 19, 2, 19, 3, 20, 4, 20) || SUBSTR(PER_ID, 0, 2))) AS AGE
        FROM PERSON_TBL
    ) T5
    WHERE T1.PER_ID = T2.PER_ID
        AND T1.PER_ID = T3.PER_ID
        AND T1.PER_ID = T4.PER_ID
        AND T1.PER_ID = T5.PER_ID
    )
    WHERE AVGAGE = IN_AGE_GROUP
    GROUP BY AVGAGE
    ORDER BY TO_NUMBER(AVGAGE) ASC
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
    
  END PROC_TASK_6;
-----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_7
    (
        IN_COM_VAL       IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR  
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
    OPEN O_CURSOR FOR
    
    SELECT A.COM_VAL, TO_CHAR(AVG(B.TLTUSEROOM + C.TLTPRICE + TRE_PAY), '999,999,999') AS AVGPRICE
    FROM
    (
        SELECT T1.PER_ID, T3.COM_VAL
        FROM PATIENT_TBL T1, PERSON_TBL T2, COMMONS_TBL T3 --병원 방문자의 지역
        WHERE T1.PER_ID = T2.PER_ID
        AND T2.PER_ADDR_GRP = T3.GRP_ID
        AND T2.PER_ADDR = T3.COM_ID
    ) A,
    (
        SELECT T1.ADM_ID, T1.PER_ID, SUM(T3.EXP_VAL1) AS TLTUSEROOM --병실사용료
        FROM ADMISSION_TBL T1, ADMISSION_ROOMS_TBL T2, COMMONS_TBL T3
        WHERE T1.ADM_ID = T2.ADM_ID
        AND T2.ADM_ROOM_GRP = T3.GRP_ID
        AND T2.ADM_ROOM = T3.COM_ID
        GROUP BY T1.ADM_ID, T1.PER_ID, T3.EXP_VAL1
    ) B, 
    (
        SELECT T1.ADM_ID, SUM(T2.EXP_VAL1 * T1.ADM_MED_QTY) AS TLTPRICE --처방약품비
        FROM ADMISSION_MEDICINES_TBL T1, COMMONS_TBL T2
        WHERE T1.ADM_MED_GRP = T2.GRP_ID
        AND T1.ADM_MED = T2.COM_ID
        GROUP BY T1.ADM_ID
    ) C,
    (
        SELECT T1.PER_ID, SUM(T2.TRE_PAY) AS TRE_PAY --진료비
        FROM PATIENT_TBL T1, TREAT_TBL T2
        WHERE T1.PAT_ID = T2.PAT_ID
        AND T1.PER_ID = T2.PER_ID
        GROUP BY T1.PER_ID
    ) D
    WHERE A.PER_ID = B.PER_ID
    AND B.ADM_ID = C.ADM_ID
    AND B.PER_ID = D.PER_ID
    AND A.COM_VAL LIKE '%'||IN_COM_VAL||'%'
    GROUP BY A.COM_VAL
    ORDER BY A.COM_VAL ASC;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_7;
-----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_8
    (
        IN_HOS_ID        IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
    OPEN O_CURSOR FOR
    
    SELECT D.HOS_ID, D.HOS_NAME, NVL(A.TREATFEE,0)AS 진료비, NVL(B.ROOMFEE,0)AS 병실사용료, NVL(C.MEDFEE,0)AS 약값,
    NVL((A.TREATFEE + B.ROOMFEE + C.MEDFEE),0)AS 의료비총액
    FROM HOSPITAL_TBL D,
    
    (--진료비 합계
        SELECT T2.HOS_ID, SUM(T1.TRE_PAY)AS TREATFEE
        FROM TREAT_TBL T1, DOCTOR_TBL T2
        WHERE T1.DOC_ID = T2.DOC_ID
        GROUP BY T2.HOS_ID
        ORDER BY T2.HOS_ID
    )A,
    (--입원병실 합계
        SELECT T5.HOS_ID, SUM (T2.EXP_VAL1)AS ROOMFEE
        FROM ADMISSION_ROOMS_TBL T1, COMMONS_TBL T2, ADMISSION_TBL T3, TREAT_TBL T4, DOCTOR_TBL T5
        WHERE T1.ADM_ROOM_GRP = T2.GRP_ID
        AND T1.ADM_ROOM = T2.COM_ID
        AND T1.ADM_ID = T3.ADM_ID
        AND T3.TRE_ID=T4.TRE_ID
        AND T4.DOC_ID=T5.DOC_ID
        GROUP BY T5.HOS_ID
        ORDER BY T5.HOS_ID
    )B,
    (--약값 합계
        SELECT T5.HOS_ID, SUM(T2.EXP_VAL1)AS MEDFEE
        FROM ADMISSION_MEDICINES_TBL T1, COMMONS_TBL T2, ADMISSION_TBL T3, TREAT_TBL T4,
        DOCTOR_TBL T5
        WHERE T1.ADM_MED_GRP = T2.GRP_ID
        AND T1.ADM_MED = T2.COM_ID
        AND T1.ADM_ID = T3.ADM_ID
        AND T3.TRE_ID=T4.TRE_ID
        AND T4.DOC_ID=T5.DOC_ID
        GROUP BY T5.HOS_ID
        ORDER BY T5.HOS_ID
    )C
    WHERE D.HOS_ID = A.HOS_ID(+)
    AND D.HOS_ID = B.HOS_ID(+)
    AND D.HOS_ID = C.HOS_ID(+)
    AND D.HOS_ID LIKE '%'||IN_HOS_ID||'%'
    ORDER BY D.HOS_ID;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_8;
-----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_9
    (
        IN_PER_ID        IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
    OPEN O_CURSOR FOR
    
    SELECT T2.PER_ID, T4.PER_NAME, COUNT(T2.PER_ID) AS 최종접종차수
    FROM INJECTION_TBL T1, RESERVATION_TBL T2, PATIENT_TBL T3, PERSON_TBL T4
    WHERE T1.RES_ID(+) =  T2.RES_ID
    AND T1.INJ_DATE IS NOT NULL 
    AND T2.PER_ID=T3.PER_ID(+)
    AND T3.PER_ID IS NULL
    AND T2.PER_ID=T4.PER_ID
    AND T2.PER_ID LIKE '%'||IN_PER_ID||'%'
    GROUP BY T2.PER_ID, T4.PER_NAME;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_9;
  -----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_10
    (
        IN_PER_NAME      IN      VARCHAR2
        ,IN_COM_VAL      IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
    OPEN O_CURSOR FOR
    
    SELECT A.PER_ID, A.PER_NAME, B.COM_VAL, A.HOS_ID, A.HOS_NAME
    FROM
    (
        SELECT T1.PER_ID, T1.PER_NAME, T1.PER_ADDR_GRP, T1.PER_ADDR, T4.HOS_ID, T4.HOS_NAME
        FROM PERSON_TBL T1, INJECTION_TBL T2, RESERVATION_TBL T3, HOSPITAL_TBL T4
        WHERE T1.PER_ID = T3.PER_ID
        AND T2.RES_ID = T3.RES_ID
        AND T3.HOS_ID = T4.HOS_ID
        AND T1.PER_ADDR_GRP = T4.HOS_ADDR_GRP
        AND T1.PER_ADDR = T4.HOS_ADDR
    ) A, COMMONS_TBL B
    WHERE A.PER_ADDR_GRP = B.GRP_ID
    AND B.COM_VAL  LIKE '%'||IN_COM_VAL||'%'
    AND A.PER_NAME LIKE '%'||IN_PER_NAME||'%'
    AND A.PER_ADDR = B.COM_ID
    GROUP BY A.PER_ID, A.PER_NAME, B.COM_VAL, A.HOS_ID, A.HOS_NAME
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_10;
-----------------------------------------------------------------------------

  PROCEDURE PROC_TASK_11    
    (   
        IN_PER_ID        IN      VARCHAR2
        ,IN_PER_NAME     IN      VARCHAR2
        ,IN_ADM_ID       IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
 AS
  BEGIN
    OPEN O_CURSOR FOR
    SELECT T1.ADM_ID
        , T1.PER_ID
        , T1.PER_NAME
        , TO_CHAR(T2.ROOMPAY,'999,999,999') AS ROOMPAY
        , TO_CHAR(T2.MEDPAY,'999,999,999') AS MEDPAY
        , TO_CHAR(T2.TRE_PAY,'999,999,999') AS TREPAY
        , TO_CHAR(T2.TOTALPAY,'999,999,999') AS TOTALPAY
    FROM
    (
        --사람 + 입원
        SELECT T1.PER_NAME, T1.PER_ID, T2.ADM_ID
        FROM PERSON_TBL T1, ADMISSION_TBL T2
        WHERE T1.PER_ID=T2.PER_ID
    ) T1,
    (
        --입원건당 병실비 + 약값 + 진료비
        SELECT A.ADM_ID
            , A.ROOMPAY
            , B.MEDPAY
            , C.TRE_PAY
            , SUM(A.ROOMPAY+B.MEDPAY+C.TRE_PAY) AS TOTALPAY
        FROM
        (
            --입원건별 병실비
            SELECT T2.ADM_ID
                , SUM(TO_NUMBER(T1.EXP_VAL1)) AS ROOMPAY
            FROM COMMONS_TBL T1
                , ADMISSION_ROOMS_TBL T2
            WHERE T1.GRP_ID=T2.ADM_ROOM_GRP
                AND T1.COM_ID=T2.ADM_ROOM
            GROUP BY T2.ADM_ID
        ) A,
        (
            --입원건별 약값
            SELECT T2.ADM_ID
                , SUM(TO_NUMBER(T1.EXP_VAL1)*ADM_MED_QTY) AS MEDPAY
            FROM COMMONS_TBL T1
                , ADMISSION_MEDICINES_TBL T2
            WHERE T1.GRP_ID=T2.ADM_MED_GRP
                AND T1.COM_ID=T2.ADM_MED
            GROUP BY T2.ADM_ID
        ) B,
        (
            --입원건별 진료비
            SELECT T3.ADM_ID
                , T2.TRE_PAY
            FROM PATIENT_TBL T1
                , TREAT_TBL T2
                , ADMISSION_TBL T3
            WHERE T1.PAT_ID=T2.PAT_ID
                AND T2.TRE_ID=T3.TRE_ID
        ) C,
        ADMISSION_TBL T1
        WHERE T1.ADM_ID=A.ADM_ID
            AND T1.ADM_ID=B.ADM_ID
            AND T1.ADM_ID=C.ADM_ID
        GROUP BY A.ADM_ID, A.ROOMPAY, B.MEDPAY, C.TRE_PAY
    ) T2, DISCHARGE_TBL T3
    WHERE T1.ADM_ID=T2.ADM_ID
        AND T1.ADM_ID=T3.ADM_ID
        AND T1.PER_ID LIKE '%'||IN_PER_ID||'%'
        AND T1.PER_NAME LIKE '%'||IN_PER_NAME||'%'
        AND T1.ADM_ID LIKE '%'||IN_ADM_ID||'%'
    ORDER BY T1.ADM_ID ASC
    ;
    
    EXCEPTION
        WHEN OTHERS THEN
            O_ERRCODE := SQLCODE;
            O_ERRMSG := SQLERRM;
  END PROC_TASK_11;
-----------------------------------------------------------------------------

END PKG_RESULT;