--BC -- BEFORE 예수님 0000:01:01:00:00:00


--2. 날짜함수 -- 엔진이 전부 숫자 취급
SELECT SYSDATE + 14 FROM DUAL;
SELECT SYSTIMESTAMP FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM DUAL;

SELECT * FROM PROFESSORS;

--오늘날짜를 기준으로 생일이 지난 교수
SELECT BIRTH, BIRTH + 40, TO_DATE(BIRTH), TO_DATE(BIRTH) + 40 FROM PROFESSORS;

SELECT * FROM SCORES;