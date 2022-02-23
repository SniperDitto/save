--함수 -- 필요한 기능이 있으면 만들엇 반복적으로 사용
--오라클이 제공하고 있는 내장함수
--1. 문자열 함수
--1.1. CONCAT -- 두개의 문자열 합치는 역할
SELECT * FROM STUDENTS;
SELECT CONCAT(SNAME, SADDR)  FROM STUDENTS;
SELECT SNAME || SADDR FROM STUDENTS;
SELECT SNAME || '는 ' || SADDR || '에 삽니다' FROM STUDENTS;
SELECT CONCAT(CONCAT(SNAME, SADDR), '안녕')  FROM STUDENTS;

--김돌우는 부산에 삽니다.

--1.2 LOWER 함수 --모든 영문문자를 소문자로 바꿔 줍니다.
SELECT 'AAAAABVVBBBB' FROM DUAL;
SELECT LOWER('AAAAABVVBBBBadfasdf') FROM DUAL;
SELECT LOWER(SNAME) FROM STUDENTS;

--1.3 UPPER 함수 --필드의 모든 소문자를 대문자로 취환한다.
SELECT 'aaabbb' FROM DUAL;
SELECT UPPER('aaabbb') AS RESULT FROM DUAL;

--1.4 INITCAP 함수 -- 단락별 첫자글자를 대문자로 취환
SELECT INITCAP('this is a book') FROM DUAL;

--1.5 CHR -- 아스키코드값 
SELECT CHR(104) FROM DUAL;

--1.6 TRIM, LTRIM, RTRIM
SELECT '     ADFADSF  ' FROM DUAL;
SELECT  TRIM('     ADF  ADSF  ') FROM DUAL; -- 양쪽 공백을 제거합니다.
SELECT  LTRIM('     ADF  ADSF  ') FROM DUAL; --왼쪽 공백 제거
SELECT  RTRIM('     ADF  ADSF  ') FROM DUAL; --오른쪽 공백 제거

--1.7 LPAD, RPAD --계층형 데이터를 다룰때 많이 사용
SELECT * FROM PROFESSORS;
SELECT 'AAABBB' FROM DUAL;
SELECT LPAD('AAABBB', 10) AS RESULT FROM DUAL;
SELECT LPAD('가나다라', 10) AS RESULT FROM DUAL;  --한글 2BYTE 
SELECT LPAD('AAABBB', 10, '@') AS RESULT FROM DUAL;
SELECT LPAD('AAABBB', 12, ' ') AS RESULT FROM DUAL;
SELECT LPAD('AAABBB', 13, '!@') AS RESULT FROM DUAL;

SELECT RPAD('AAABBB', 10, '@') AS RESULT FROM DUAL;
SELECT RPAD('AAABBB', 12, ' ') AS RESULT FROM DUAL;
SELECT RPAD('AAABBB', 13, '!@') AS RESULT FROM DUAL;


--1.8 REPLACE --특정문자열을 대처
SELECT 'AAA-BBB:CCC' FROM DUAL;
SELECT REPLACE('AAA-BBB:CCC', '-', '!!!') FROM DUAL;
SELECT REPLACE('AAA-BBB:CCC', ':', '!!!') FROM DUAL;
SELECT REPLACE(REPLACE('AAA-BBB:CCC', '-', '!!!'), ':', '!!!') FROM DUAL;
SELECT REPLACE(SNAME, 'ㄱ', 'ㄴ') FROM STUDENTS;  --안되요....


--1.9 SUBSTR  -- 특정문자열을 잘라 내는데 사용
SELECT '1234567890' FROM DUAL;
SELECT SUBSTR('1234567890', 2, 7) FROM DUAL;  --문자열을 자르는 시작 1 부터
SELECT SUBSTR(TRIM(BIRTH),5,4) FROM PROFESSORS;
SELECT SUBSTR(TRIM(BIRTH),5,2) || '월' || SUBSTR(TRIM(BIRTH),7,2) || '일' FROM PROFESSORS;

--1.10 INSTR  -- 특정문자열을 찾아주는 함수
SELECT '1234567890' FROM DUAL;
SELECT INSTR('1234567890', '4') FROM DUAL;  --INDEX는 1부터 사용하여 리턴
SELECT INSTR('!@#$%^&(_#$%#$*(_)', '#$') FROM DUAL;


--1.11 --오라클을하면 절대로 모르면 안되는 함수, 모를수도 없어요 -- 페이지 여는곳마다 잔뜩 사용되는 함수
--TO_CHAR()  --데이타타입을 문자열로 변환하는 함수.
SELECT TO_CHAR(SAGE, '0000') FROM STUDENTS;

