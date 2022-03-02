
--PROCEDURE
--함수와 다름
--업무의 최소 단위 (TRANSACTION : 반복작업)
    --ALL OR NOTHING


SELECT * FROM STUDENTS_TBL;

--새로운 학생이 추가될 때
    SELECT * FROM COMMONS_TBL
    WHERE GRP_ID='GRP001'
    ;
    --부산 해운대구 우동 거주
    --GRP001 / COM0002 / COM0021 / COM0038
    SELECT * FROM COMMONS_TBL
    WHERE GRP_ID='GRP002'
    ;
    --자연과학대학 식품영양학과 소속
    --GRP002 / COM0002 / COM013
    
    INSERT INTO STUDENTS_TBL(STU_ID, STU_NAME, STU_TEL, STU_ADDR_GRP, STU_ADDR, STU_DEPT_GRP, STU_DEPT, STU_ADDR2)
    VALUES('STU0091', '감득실', '010-2222-4444', 'GRP001', 'COM0038', 'GRP002', 'COM0013', 'COM0002');


--TRANSACTION
--둘 다 동시에 실행되어야 하는 경우
-- EX) 계좌이체(A출금 & B입금) : 어느 한쪽만 실행되어서는 안 된다(ALL OR NOTHING)

--프로시져 실행 후 확인
SELECT * FROM STUDENTS_TBL;

    --다음 학생ID를 만들기 위해 현재 ID중 최댓값 확인후 1을 더해 양식에 맞춘다
    SELECT 'STU'||TO_CHAR(TO_NUMBER(SUBSTR(MAX(STU_ID),4,3))+1,'FM000')
    FROM STUDENTS_TBL;
    
    

------------------------------------------
    /*
    --두 숫자를 더하고 10을 곱해서 출력
    CREATE PROCEDURE PROC_TEST
    (
        IN_NUM1     IN      NUMBER
        ,IN_NUM2    IN      NUMBER
        ,O_RESULT   OUT     NUMBER
    )
    AS
        V_RESULT    NUMBER(10);
    
    BEGIN
    
        O_RESULT := (IN_NUM1+IN_NUM2)*10;
    
    END PROC_TEST;
    */

---------------------


SELECT * FROM STUDENTS_TBL
WHERE STU_ID='STU004';


---------------------
/*
CREATE PROCEDURE PROC_SELECT_STUDENTLIST
(
    IN_STU_ID   IN  VARCHAR2
    ,O_CURSOR   OUT SYS_REFCURSOR
)
AS

BEGIN
    
    OPEN O_CURSOR FOR
    SELECT * FROM STUDENTS_TBL
    WHERE STU_ID=IN_STU_ID
    ;

END PROC_SELECT_STUDENTLIST;
*/

----------------------------------------

--UPDATE STUDENTS_TBL SET STU_PASS='1111';


/*
CREATE PROCEDURE PROC_STU_LOGIN
(
    IN_STU_ID       IN      VARCHAR2
    ,IN_STU_PASS    IN      VARCHAR2
    ,O_RESULT       OUT     VARCHAR2
)
AS

    V_CNT   NUMBER;
    --V_RESULT    VARCHAR2(100)

BEGIN
    --유효한 학생ID와 비밀번호가 입력되었을 때 로그인
    SELECT COUNT(*) INTO V_CNT
    FROM STUDENTS_TBL
    WHERE STU_ID=IN_STU_ID
    AND STU_PASS=IN_STU_PASS
    ;
    
    IF V_CNT=1 THEN
        O_RESULT := '로그인 성공';
    ELSE
        O_RESULT := '로그인 성공';
    END IF
    
    ;

END PROC_STU_LOGIN;
*/
---------------


--SELECT의 조건에 맞는 데이터가 없으면 MAX가 NULL을 반환한다
SELECT MAX(STU_ID) FROM STUDENTS_TBL
WHERE STU_ID='STU004' AND STU_PASS='1112';


---------------

--패키지
    --HEAD : PROCEDURE의 이름, 매개변수
    --BODY : 실행되는 내용
    
    
    
    
--------------

/*
    SELECT * FROM STUDENTS_TBL
    WHERE STU_ID = :IN_STU_ID
        AND STU_NAME = :IN_STU_NAME
        ;
*/


--아이디에 10이 포함 + 이름에 홍 포함되는 학생?
    --아이디에 10 포함
    SELECT * FROM STUDENTS_TBL
    WHERE STU_ID LIKE '%9%';
    
    --이름에 홍 포함되는 학생
    SELECT * FROM STUDENTS_TBL
    WHERE STU_ID LIKE '%홍%';
    
    
    --아이디에 10이 포함 + 이름에 홍 포함
    SELECT * FROM STUDENTS_TBL
    WHERE STU_ID LIKE '%'||:IN_STU_ID||'%'
        AND STU_NAME LIKE '%'||:IN_STU_NAME||'%';
    --입력값이 비어있으면 모든 경우 출력
    
    
--학생데이터수정
UPDATE STUDENTS_TBL
SET STU_NAME=IN_STU_NAME,
    STU_TEL=IN_STU_TEL,
    STU_ADDR_GRP=IN_STU_ADDR_GRP,
    STU_ADDR=IN_STU_ADDR,
    STU_DEPT_GRP=IN_STU_DEPT_GRP,
    STU_DEPT=IN_STU_DEPT,
    STU_ADDR2=IN_STU_ADDR2,
    STU_PASS=IN_STU_PASS
WHERE STU_ID=IN_STU_ID;
    
    
-----------------
/*
--새 페이지에서 해야 함
--프로시져 짜기 전 임시로 확인할 때 사용

--SET SERVEROUTPUT ON;
DECLARE
    --변수선언(IN/OUT 아님)
    V_NUM1  NUMBER(10);
    V_NUM2  NUMBER(10);
    V_NUM3  NUMBER(10);
BEGIN
    V_NUM1 := 15;
    V_NUM2 := 3456;
    V_NUM3 := V_NUM1 * v_NUM2;--51840
    
    --DBMS_OUTPUT.PUT_LINE(V_NUM3);

END;

*/


--JOIN이 어렵다고 모두 PROCEDURE로 해결하면 안됨
--확장성이 전혀 없다
--결과는 나올 수 있지만 수정하기 매우 힘들다













