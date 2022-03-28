/*
DROP TABLE ADMISSION_MEDICINES_TBL;
DROP TABLE ADMISSION_ROOMS_TBL;
DROP TABLE ADMISSION_TBL;
DROP TABLE COMMONS_TBL;
DROP TABLE DISCHARGE_TBL;
DROP TABLE DOCTOR_TBL;
DROP TABLE HOSPITAL_TBL;
DROP TABLE INJECTION_TBL;
DROP TABLE PATIENT_TBL;
DROP TABLE PERSON_TBL;
DROP TABLE RESERVATION_TBL;
DROP TABLE TREAT_TBL;
DROP TABLE VACCINE_IN_TBL;
DROP TABLE VACCINE_TBL;
*/


--INJECTION_TBL SELECT
    --예약번호 접종자이름 주민번호 백신이름 차수 병원이름
    SELECT T2.RES_ID AS 예약번호
        ,T1.PER_NAME AS 접종자명
        ,T1.PER_ID AS 주민번호
        ,T5.COM_VAL AS 백신이름
        ,T6.INJ_CNT AS 접종차수
        ,T3.HOS_NAME AS 접종병원
    FROM PERSON_TBL T1
        ,RESERVATION_TBL T2
        ,HOSPITAL_TBL T3
        ,VACCINE_TBL T4
        ,COMMONS_TBL T5
        ,INJECTION_TBL T6
    WHERE T1.PER_ID=T2.PER_ID
        AND T2.HOS_ID=T3.HOS_ID
        AND T2.VAC_ID=T4.VAC_ID
        AND T2.RES_ID=T6.RES_ID
        AND T2.RES_ID LIKE '%'||:IN_RES_ID||'%'
        AND T1.PER_NAME LIKE '%'||:IN_PER_NAME||'%'
        AND T1.PER_ID LIKE '%'||:IN_PER_ID||'%'
        AND TRIM(T5.COM_VAL) LIKE '%'||TRIM(:IN_VAC_NAME)||'%'
        AND T6.INJ_CNT=:IN_INJ_CNT
    ;

--PERSON_TBL SELECT
    --이름 주민번호 성별 전화번호 주소
    SELECT T1.PER_NAME AS 이름
        ,T1.PER_ID AS 주민번호
        ,T1.PER_GENDER AS 성별
        ,T1.PER_TEL AS 전화번호
        ,'부산광역시 '||T2.COM_VAL AS 주소
    FROM PERSON_TBL T1
        ,COMMONS_TBL T2
    WHERE T1.PER_ADDR_GRP=T2.GRP_ID
        AND T1.PER_ADDR=T2.COM_ID
        AND T1.PER_ID LIKE '%'||:IN_PER_ID||'%'
        AND T1.PER_NAME LIKE '%'||:IN_PER_NAME||'%'
        AND T1.PER_GENDER LIKE '%'||:IN_PER_GENDER||'%'
        AND T1.PER_TEL LIKE '%'||:IN_PER_TEL||'%'
        AND TRIM(T2.COM_VAL) LIKE '%'||TRIM(:IN_PER_ADDR_VAL)||'%'
    ;


--PATIENT_TBL SELECT
    --방문아이디 방문자이름 증상 방문일 방문병원명
    SELECT T1.PAT_ID AS 방문아이디
        ,T2.PER_NAME AS 방문자명
        ,T4.COM_VAL||' 이상' AS 증상
        ,T1.PAT_IN_DATE AS 방문일
        ,T3.HOS_NAME AS 방문병원
    FROM PATIENT_TBL T1
        ,PERSON_TBL T2
        ,HOSPITAL_TBL T3
        ,COMMONS_TBL T4
    WHERE T1.PER_ID=T2.PER_ID
        AND T1.HOS_ID=T3.HOS_ID
        AND T1.PAT_SYMP_GRP=T4.GRP_ID
        AND T1.PAT_SYMP=T4.COM_ID
        AND T1.PAT_ID LIKE '%'||:IN_PAT_ID||'%'
        AND T1.PER_ID LIKE '%'||:IN_PER_ID||'%'
    ;


--COMMONS_TBL SELECT
--값 / 비고1 / 비고2 / 비고3
SELECT GRP_ID
        , DECODE(TRIM(PARENT_ID),'root','--- ','')||COM_VAL||DECODE(TRIM(PARENT_ID),'root',' ---','') AS COM_VAL
        , COM_ID
        , PARENT_ID
        , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(EXP_VAL1)),'([0-9]{3})','\1,')),'^,','') AS EXP_VAL1
        , EXP_VAL2
        , EXP_VAL3
    FROM COMMONS_TBL
    WHERE GRP_ID LIKE '%'||:IN_GRP_ID||'%'
        AND COM_ID LIKE '%'||:IN_COM_ID||'%'
        AND TRIM(COM_VAL) LIKE '%'||TRIM(:IN_COM_VAL)||'%'
    ;








