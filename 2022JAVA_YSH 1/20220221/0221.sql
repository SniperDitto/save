
--함수
--필요한 기능이 생기면 만들어 반복적으로 사용

--1. 문자열 함수
--CONCAT : 두 개의 문자열을 합친다
    SELECT * FROM STUDENTS;
    SELECT CONCAT(SNAME, SADDR) FROM STUDENTS;
    SELECT SNAME||SADDR FROM STUDENTS;
    SELECT SNAME||'는'||SADDR||'에 삽니다.' FROM STUDENTS;
    SELECT CONCAT(CONCAT(SNAME, SADDR),'안녕') FROM STUDENTS;

--LOWER : 모든 영어 대문자를 소문자로 변환
    SELECT 'AAAAABBBBB' FROM DUAL;
    SELECT LOWER('ASDFasdfASDF') FROM DUAL;
    SELECT LOWER(SNAME) FROM STUDENTS;
    
--UPPER : 모든 영어 소문자를 대문자로 변환
    SELECT 'aassddfff' FROM DUAL;
    SELECT UPPER('AaSsDdFf') AS RESULT FROM DUAL;
    
--INITCAP : 문장 첫글자를 대문자로
    SELECT INITCAP('this is ...') FROM DUAL;
    
--CHR : 해당 글자의 아스키코드값을 넣어 글자로 변환
    SELECT CHR(77) FROM DUAL;
    
--TRIM, LTRIM, RTRIM : 공백 제거
    SELECT '      ASDF    ' FROM DUAL;
    SELECT TRIM('      AS DF    ') FROM DUAL;--양쪽 끝의 공백 제거
    SELECT LTRIM('      AS DF    ') FROM DUAL;--왼쪽 공백 제거
    SELECT RTRIM('      AS DF    ') FROM DUAL;--오른쪽 공백 제거
    
--LPAD, RPAD : 해당 컬럼의 글자수를 입력한 숫자만큼 고정
-- 계층형 데이터를 다룰 때 많이 사용한다
    SELECT * FROM PROFESSORS;
    SELECT 'AAABBB' FROM DUAL;
    SELECT LPAD('AAABBB', 10, ' ') AS RESULT FROM DUAL;--글자수가 더 적으면 공백 추가
    SELECT LPAD('AAABBB', 10, '@') AS RESULT FROM DUAL;--글자수가 더 적으면 해당 문자로 채우기
    SELECT LPAD('AAABBB', 11, '?!') AS RESULT FROM DUAL;--여러 글자면 번갈아서 추가
    SELECT LPAD('ㅂㅈㄷㄱㅁㄴㅇㄹㅋㅌㅊㅍ', 10) AS RESULT FROM DUAL;--한글 한글자에 2BYTE
    
    SELECT RPAD('AAABBB', 10, ' ') AS RESULT FROM DUAL;
    SELECT RPAD('AAABBB', 10, '@') AS RESULT FROM DUAL;
    SELECT RPAD('AAABBB', 11, '?!') AS RESULT FROM DUAL;
    SELECT RPAD('ㅂㅈㄷㄱㅁㄴㅇㄹㅋㅌㅊㅍ', 10) AS RESULT FROM DUAL;

--REPLACE : 특정 문자열 대체 (문자열, 버릴것, 새것)
    SELECT 'AAA-BBB-CCC' FROM DUAL;
    SELECT REPLACE('AAA-BBB-CCC', '-', ',') FROM DUAL;
    SELECT REPLACE(REPLACE('AAA-BBB!CCC','-',','),'!',',') FROM DUAL;
    SELECT REPLACE(SNAME, '김', '@') FROM STUDENTS;
    
--SUBSTR : 문자열 잘라내기 (문자열, N, M) N번째부터 M개 자르기
    SELECT '1234567890' FROM DUAL;
    SELECT SUBSTR('1234567890', 1, 3) FROM DUAL;--첫글자 INDEX가 1인 점 주의
    SELECT SUBSTR(TRIM(BIRTH),5,4) FROM PROFESSORS;-- 생일
    SELECT SUBSTR(TRIM(BIRTH),5,2)||'월'||SUBSTR(TRIM(BIRTH),7,2)||'일' FROM PROFESSORS;
    
--INSTR : 특정 문자열 찾기(INDEXOF와 유사)
    SELECT '1234567890' FROM DUAL;
    SELECT INSTR('1234567890', 4) FROM DUAL;--INDEX 1부터 시작
    SELECT INSTR('!@#*()_+(*%)$%^&%&(','(') FROM DUAL;--가장 먼저 나오는 위치
    
--TO_CHAR : 데이터의 타입을 문자열로 변환 (문자열, 양식?) / TO_DATE:날짜로 변환
    SELECT TO_CHAR(SAGE, '0000') FROM STUDENTS;



--2. 날짜 함수
--SYSDATE : 현재시각
    SELECT SYSDATE FROM DUAL;
    --내부적으로 BC 0000/01/01/00:00:00 기준으로 한 숫자값을 날짜로 계산
--날짜를 더하고 뺄 수 있다
    SELECT SYSDATE -2 FROM DUAL; -- 2일 전 현재시각
    --날짜는 정수, 시간은 소숫점 아래 자리로 계산됨
    SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM DUAL;

    SELECT * FROM PROFESSORS;
    SELECT TO_DATE(BIRTH), TO_DATE(BIRTH)+5 FROM PROFESSORS;
    --오늘 날짜 기준으로 생일이 지난 교수?

-- SYSTIMESTAMP : 더 정밀한 시각(1억분의 1초까지)
    SELECT SYSTIMESTAMP FROM DUAL;
    
--TO_DATE : 날짜타입으로 변환 (변환할데이터, 날짜형식)
    --변환할만한 데이터만 변환 가능
    SELECT TO_DATE('19550409', 'YYYY/MM/DD HH:MI:SS') FROM DUAL;
    
--2. 날짜 연산 - 윤년 등 포함해서 계산
    SELECT '19990101' + 5 FROM DUAL;
    SELECT TO_NUMBER('19990101') + 5 FROM DUAL; -- 1999만 101 + 5
    SELECT TO_DATE('19990101') + 5 FROM DUAL; -- 1999/01/01에서 5일 이후의 날짜

--나이 구하기
    --날짜에서 숫자를 빼면 : 날짜(N일 전의 날짜)
    --날짜에서 날짜를 빼면 : 숫자(날짜 차이)
    SELECT SYSDATE-SYSDATE FROM DUAL;
    SELECT SYSDATE-TO_DATE('19950929') FROM DUAL;--태어난지 9642일

    --1999/01/01생이 2020/02/02에는 몇살인가?
    SELECT 20200220-19990101 FROM DUAL; -- 2020만 220 - 1999만 101
    SELECT TO_DATE(20200220,'YYYY/MM/DD') - TO_DATE(19990101,'YYYY/MM/DD') FROM DUAL; -- 두 날짜간 몇일 차이인지
    
--NEXT_DAY(날짜, 찾을 요일)
    SELECT TO_DATE(BIRTH), NEXT_DAY(TO_DATE(BIRTH) ,1) FROM PROFESSORS;

-- ~~DAY : 요일 구하기
-- ~~DATE : 날짜 구하기

--ADD_MONTHS(날짜, 더할 개월수)
    SELECT TO_DATE(BIRTH), ADD_MONTHS(TO_DATE(BIRTH), -3) FROM PROFESSORS; -- 3개월 전의 날짜

--CURRENT_DATE : 현재 트랜젝션의 시작 날짜
    SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS'), TO_CHAR(CURRENT_DATE, 'YYYY/MM/DD HH:MI:SS') FROM DUAL;

--LAST_DAY : 해당 월의 마지막 날(요일아님)
    SELECT TO_DATE(BIRTH), LAST_DAY(TO_DATE(BIRTH)) FROM PROFESSORS;

--MONTHS_BETWEEN(앞의날짜, 뒤의날짜) : 앞의날짜-뒤의날짜 개월수 차이
    SELECT MONTHS_BETWEEN('19990101', '20220202') FROM DUAL;
    --소숫점 이하 버리면(개월수만)
    SELECT TRUNC(MONTHS_BETWEEN('19990101', '20220202')) FROM DUAL;
    
--TRUNC : 소숫점이하 버리기


--교수의 한국나이 구하기
    SELECT BIRTH, SUBSTR(BIRTH, 1, 4) AS BYEAR FROM PROFESSORS;--연도만
    SELECT BIRTH, SUBSTR(BIRTH, 1, 4) AS BYEAR, TO_CHAR(SYSDATE, 'YYYY') AS NOW FROM PROFESSORS;
    SELECT BIRTH, SUBSTR(BIRTH, 1, 4) AS BYEAR,
                  TO_CHAR(SYSDATE, 'YYYY') AS NOWYEAR ,
                  TO_CHAR(SYSDATE, 'YYYY')-SUBSTR(BIRTH, 1, 4) AS AGE
    FROM PROFESSORS;
    
    --'YYYY'만으로 연도만 따로 구할 수 있음
    SELECT TO_CHAR(SYSDATE, 'HH24') FROM DUAL; -- 24시간제
    SELECT TO_CHAR(SYSDATE,'YYYY')||'년 '||TO_CHAR(SYSDATE,'MM')||'월 '||TO_CHAR(SYSDATE,'DD')||'일' AS 날짜 FROM DUAL;
    
    
-- 나이대별로 COUNT
    SELECT BIRTH, SUBSTR(TRIM(BIRTH), 1, 4) AS BIRTHYEAR,
                  TO_CHAR(TO_DATE(BIRTH, 'YYYYMMDD'), 'YYYY') AS BIRTHYEAR2,
                  TO_CHAR(SYSDATE, 'YYYY') AS NOWYEAR,
                  TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(TO_DATE(BIRTH, 'YYYYMMDD'), 'YYYY') AS AGE,
                  TRUNC(TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(TO_DATE(BIRTH, 'YYYYMMDD'), 'YYYY'), -1)||'대' AS YEARS
    FROM PROFESSORS;

    SELECT TRUNC(TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(TO_DATE(BIRTH, 'YYYYMMDD'), 'YYYY'), -1)||'대' AS YEARS,
           COUNT(*)
    FROM PROFESSORS
    GROUP BY TRUNC(TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(TO_DATE(BIRTH, 'YYYYMMDD'), 'YYYY'), -1)||'대';
    
--태어난 연도별 COUNT(1900~1910 이후 10년단위)
    --생일 앞3자리 잘라서 0붙임
    SELECT SUBSTR(BIRTH, 1, 3)||'0 ~ '||SUBSTR(BIRTH, 1, 3)||'0' AS YEARS, COUNT(*) 
    FROM PROFESSORS
    GROUP BY SUBSTR(BIRTH, 1, 3)||'0 ~ '||SUBSTR(BIRTH, 1, 3);



--LEVEL : 1부터 조건에 맞는 만큼 ROW를 만들어준다
--for문의 i와 비슷한 느낌?
    SELECT LEVEL FROM DUAL CONNECT BY LEVEL<10;
    SELECT SYSDATE-LEVEL, SYSDATE, LEVEL FROM DUAL CONNECT BY LEVEL<10;
    SELECT 200-LEVEL||'0' FROM DUAL CONNECT BY LEVEL<10;

    SELECT A.YEARS, B.CNT
    FROM (
        --연도 표시하는 가상의 테이블(VIEW), 메모리상에 임시로 존재
        SELECT 190+LEVEL||'0' AS YEARS 
        FROM DUAL 
        CONNECT BY LEVEL<=12
    ) A, (
        --생일에서 출생연도를 뽑아서 0을 붙여 연대를 만듬
        SELECT SUBSTR(TRIM(BIRTH), 1, 3)||'0' AS BYEAR, COUNT(*) AS CNT
        FROM PROFESSORS
        GROUP BY SUBSTR(TRIM(BIRTH), 1, 3)||'0'
    ) B
    WHERE A.YEARS=B.BYEAR(+)
    GROUP BY A.YEARS, B.CNT
    ORDER BY A.YEARS DESC;
    


--1970~1990 사이에 연도별 태어난 교수의 수
    --1. 년도별 태어난 사람의 수
    SELECT SUBSTR(TRIM(BIRTH), 1, 4)BYEAR, COUNT(*) AS CNT
    FROM PROFESSORS
    GROUP BY SUBSTR(TRIM(BIRTH), 1, 4)
    ORDER BY SUBSTR(TRIM(BIRTH), 1, 4) ASC;
    
    --2. 연도 테이블
    SELECT 1969+LEVEL AS BYEARS
    FROM DUAL
    CONNECT BY LEVEL<=21;

    --3. 두 테이블을 조합
    SELECT B.BYEARS AS 년도, NVL(A.CNT,0) AS 태어난사람수
    FROM (
        --년도별 태어난 사람의 수
        SELECT SUBSTR(TRIM(BIRTH), 1, 4)BYEAR, COUNT(*) AS CNT
        FROM PROFESSORS
        GROUP BY SUBSTR(TRIM(BIRTH), 1, 4)
    ) A, (
        --연도 목록(1970~1990)
        SELECT 1969+LEVEL AS BYEARS
        FROM DUAL
        CONNECT BY LEVEL<=21
    ) B
    WHERE A.BYEAR(+)=B.BYEARS
    ORDER BY B.BYEARS ASC;


--3&4정규화
--계층형 데이터
--JOIN : INLINE VIEW, INLINE QUERY

--다음주 : PROCEDURE, PACKAGE, FUNCTION, TRIGGER, MERGE INTO
--         DB PROJECT(조 새로 편성)
--그다음주 : VIEW, INDEX, TYPE, SEQUENCE, SCHEDULER

----------------------------------------------------------

--TO_CHAR 날짜 포맷
--1. 세기(21C)
    SELECT TO_CHAR(SYSDATE, 'CC') FROM DUAL;
    SELECT TO_CHAR(SYSDATE, 'SCC') FROM DUAL;

--2. 분기(QUARTER) 1~3 / 4~6 / 7~9 / 10~12 **********중요
    SELECT TO_CHAR(SYSDATE, 'Q') FROM DUAL;
    SELECT TO_CHAR(TO_DATE('20210405','YYYY-MM-DD'),'Q'),
           TO_CHAR(TO_DATE('20210715','YYYY-MM-DD'),'Q'),
           TO_CHAR(TO_DATE('20211125','YYYY-MM-DD'),'Q')
    FROM DUAL;
    
    --교수들 생일 몇분기인가
    SELECT TO_CHAR(TO_DATE(BIRTH,'YYYYMMDD'),'Q') FROM PROFESSORS;

--3. 월 표시
    SELECT BIRTH, TO_CHAR(TO_DATE(BIRTH,'YYYYMMDD'), 'MM'),
            TO_CHAR(TO_DATE(BIRTH,'YYYYMMDD'), 'MONTH'),
            TO_CHAR(TO_DATE(BIRTH,'YYYYMMDD'), 'MON')
    FROM PROFESSORS;

--4. 해당 년도의 몇주차인가 *************중요
    SELECT TO_CHAR(SYSDATE, 'WW') FROM DUAL; -- 22/02/21은 올해 8주차
    SELECT TO_CHAR(SYSDATE, 'W') FROM DUAL; -- 22/02/21은 2월 3주차

    SELECT TO_CHAR(TO_DATE('20211230', 'YYYYMMDD'),'WW'),--52주차
           TO_CHAR(TO_DATE('20211231', 'YYYYMMDD'),'WW'),--53주차
           TO_CHAR(TO_DATE('20220101', 'YYYYMMDD'),'WW')--01주차 / 1월 1일에 리셋되는 경우
    FROM DUAL;
    --실제 업무일 기준(결과 같음) - 달력기준
    SELECT TO_CHAR(TO_DATE('20211231', 'YYYYMMDD'),'IW'),--53주차
           TO_CHAR(TO_DATE('20220101', 'YYYYMMDD'),'IW')--53주차
    FROM DUAL;
   
    --해당 년, 월, 주의 몇일차인가(일요일 기준 1일)
    SELECT TO_CHAR(SYSDATE, 'DDD') FROM DUAL;--올해 52일차
    SELECT TO_CHAR(SYSDATE, 'DD') FROM DUAL;--이번달 21일차
    SELECT TO_CHAR(SYSDATE, 'D') FROM DUAL;--이번주 2일차

--5. 주 표시
    SELECT TO_CHAR(SYSDATE, 'DY') FROM DUAL;--'월'
    SELECT TO_CHAR(SYSDATE, 'DAY') FROM DUAL;--'월요일'
    SELECT TO_CHAR(SYSDATE, 'YYYY.MM.DD')||' ('||TO_CHAR(SYSDATE, 'DY')||')' FROM DUAL;

--6. 년도 표시
    SELECT TO_CHAR(SYSDATE, 'Y') FROM DUAL; --2
    SELECT TO_CHAR(SYSDATE, 'YY') FROM DUAL; --22
    SELECT TO_CHAR(SYSDATE, 'YYY') FROM DUAL; --022
    SELECT TO_CHAR(SYSDATE, 'YYYY') FROM DUAL; --2022
    SELECT TO_CHAR(SYSDATE, 'I') FROM DUAL; --2
    SELECT TO_CHAR(SYSDATE, 'IY') FROM DUAL; --22
    SELECT TO_CHAR(SYSDATE, 'IYY') FROM DUAL; --022
    SELECT TO_CHAR(SYSDATE, 'IYYY') FROM DUAL; --2022
    
    --로마자 연도 표시
    SELECT TO_CHAR(SYSDATE, 'RM') FROM DUAL;--II
    SELECT TO_CHAR(SYSDATE, 'RR') FROM DUAL;--22
    SELECT TO_CHAR(SYSDATE, 'RRRR') FROM DUAL;--2022
    
    --영어 스펠링
    SELECT TO_CHAR(SYSDATE, 'YEAR') FROM DUAL;
    SELECT TO_CHAR(SYSDATE, 'SYEAR') FROM DUAL;
    
--7. 시간 표시 HH=HH12, HH24
    --오전/오후 표시
    SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;--14:57:28
    SELECT TO_CHAR(SYSDATE, 'HH:MI:SS AM') FROM DUAL;--02:57:23 오후
    SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;--오후 02:57:06 (02시)
    SELECT TO_CHAR(SYSDATE, 'TS') FROM DUAL;--오후 3:03:37 (3시)

--8. 초 표시
    SELECT TO_CHAR(SYSDATE, 'SS') FROM DUAL;--현재 분의 초
    SELECT TO_CHAR(SYSDATE, 'SSSSS') FROM DUAL;--오늘00시부터 초
    


--TO_CHAR의 문자열로서의 사용법 ******************중요
    -- ID : MEM001, MEM002, ... MEM100, MEM101,...
    SELECT TO_CHAR(1,'000') FROM DUAL;--세글자로( 001)
    SELECT TO_CHAR(1,'FM000') FROM DUAL;--앞의 공백 제거(001)

-- 다음번 추가되는 학생의 SID는? ******중요
    SELECT * FROM STUDENTS; 
    --1. ID의 최댓값
    SELECT MAX(SID) FROM STUDENTS;--S010
    --2. 숫자를 분리
    SELECT SUBSTR(MAX(SID), 2) FROM STUDENTS;--010
    --3. 숫자로 변환
    SELECT TO_NUMBER(SUBSTR(MAX(SID), 2)) FROM STUDENTS;--10
    --4. 1을 더한다
    SELECT TO_NUMBER(SUBSTR(MAX(SID), 2))+1 FROM STUDENTS;--11
    --5. 다시 문자로 바꾼다
    SELECT 'S'||TO_CHAR(TO_NUMBER(SUBSTR(MAX(SID), 2))+1,'FM000') FROM STUDENTS;--S011

    --LPAD 이용(왼쪽에글자추가) LPAD(숫자, 자리수, 채울글자)
    SELECT LPAD(1, 3, '0') FROM DUAL;
    SELECT LPAD(TO_NUMBER(SUBSTR(MAX(SID), 2))+1, 3, '0') FROM STUDENTS;--011

--숫자 3자리마다 ,로 구분
    SELECT 1234567890 FROM DUAL;
    SELECT TO_CHAR(1234567890, 'FM999,999,999,999,999,999') FROM DUAL;--충분히 큰 숫자만큼
    

-----------------------------------------------------------------------------------------------------

    SELECT * FROM STUDENTS2;
    SELECT * FROM SUBJECTS2;
    SELECT * FROM ATTENDANCE;
    --출석 데이터에 며칠동안 데이터가 있는가
    SELECT TO_CHAR(ADATE, 'YYYY-MM-DD AM HH:MI:SS') FROM ATTENDANCE;
    --시간 포함된 날짜 데이터인 경우 GROUP BY 주의
    SELECT COUNT(*) 
    FROM(
        SELECT TO_CHAR(ADATE, 'YYYYMMDD')AS ATTDATE 
        FROM ATTENDANCE 
        GROUP BY TO_CHAR(ADATE, 'YYYYMMDD')
    );--3일치
    
    
-- 학생이 하루에 2회 이상 출석체크를 했는지 확인(외출/조퇴)
-- 학생별+날짜별 출석 횟수 COUNT
    SELECT SID, TO_CHAR(ADATE, 'YYYYMMDD'),COUNT(*) 
    FROM ATTENDANCE
    GROUP BY SID, TO_CHAR(ADATE, 'YYYYMMDD')
    HAVING COUNT(*)>=6;
    
--A : 학생별 출석 횟수
    SELECT S.SID, S.SNAME, COUNT(*) AS ATTCNT
    FROM STUDENTS S, ATTENDANCE A
    WHERE S.SID=A.SID
    GROUP BY S.SID, S.SNAME;
    
--B : 모든 과목을 출석했을 때(전체출석수) : 필드가 하나뿐임
    SELECT COUNT(*) FROM SUBJECTS2;
    
--C : 출석 날짜
    SELECT COUNT(*) 
    FROM (
        SELECT TO_CHAR(ADATE, 'YYYYMMDD') 
        FROM ATTENDANCE 
        GROUP BY TO_CHAR(ADATE, 'YYYYMMDD')
    );

--UPDATE ATTENDANCE SET SUBID='SUB2' WHERE AIDX=218
    
--1. 학생별 출석률 : 이름, 출석률, 출석수, 전체과목수, 전체날짜수, 결석수, 출석률

    --CROSS JOIN 
    SELECT A.SID, A.SNAME, A.ATTCNT,
           B.SUBCNT, C.DAYCNT,
           (B.SUBCNT*C.DAYCNT)-A.ATTCNT AS ABSCNT,
           ROUND((A.ATTCNT/(B.SUBCNT*C.DAYCNT))*100,2)||'%' AS ATTRATE
    FROM (
            SELECT S.SID, S.SNAME, COUNT(*) AS ATTCNT 
            FROM STUDENTS2 S, ATTENDANCE A 
            WHERE S.SID=A.SID 
            GROUP BY S.SID, S.SNAME
         ) A,
         (
            SELECT COUNT(*) AS SUBCNT 
            FROM SUBJECTS2
         ) B,
         (
            SELECT COUNT(*) AS DAYCNT 
            FROM (
                    SELECT TO_CHAR(ADATE, 'YYYYMMDD')
                    FROM ATTENDANCE
                    GROUP BY TO_CHAR(ADATE, 'YYYYMMDD')
                 )
         ) C;



--2021년 학생들의 출석률을 주차별로 구하기

--날짜별 학생들 출석현황 : 날짜, 학생ID, 이름, 출석수(, 결석한 과목들)
    SELECT TO_CHAR(ADATE, 'YYYYMMDD'), ST.SID, ST.SNAME, COUNT(*) AS CNT
    FROM STUDENTS2 ST, ATTENDANCE A
    WHERE ST.SID=A.SID
    GROUP BY TO_CHAR(ADATE, 'YYYYMMDD'), ST.SID, ST.SNAME
    ORDER BY TO_CHAR(ADATE, 'YYYYMMDD') ASC;

--20210405 결석 한과목이라도 한 학생들의 목록 : 학생ID, 이름
    SELECT * FROM ATTENDANCE
    WHERE TO_CHAR(ADATE, 'YYYYMMDD')='20210405';
    
    --A : 모든 학생이 모든 과목에 출석한 경우(하루 기준)
    SELECT * FROM STUDENTS2 ST, SUBJECTS2 SU;
    
    --B : 학생들의 출석 데이터
    SELECT * FROM STUDENTS2 ST, ATTENDANCE A
    WHERE ST.SID=A.SID(+)
    AND TO_CHAR(ADATE, 'YYYYMMDD')='20210405'; -- 한번이라도 출석하면 결석이 잡히지 않음
    
    --20210405 결석 한과목이라도 한 학생들의 목록 & 결석과목
    SELECT C.SID, C.SNAME, COUNT(*) 
    FROM
    (
        SELECT A.SID, A.SNAME, A.SUBID, A.SUBNAME, B.ADATE
        FROM 
        (
            --A : 모든날짜 & 모든수업 & 모든학생 출석 데이터
            SELECT ST.SID, ST.SNAME, SU.SUBID, SU.SNAME AS SUBNAME, T3.ADATE 
            FROM 
            STUDENTS2 ST,
            SUBJECTS2 SU,
            (
                -- T3 : 20210405 ~ 20210407 날짜목록
                SELECT TO_CHAR(TO_DATE('20210405','YYYYMMDD')+(LEVEL-1),'YYYYMMDD')AS ADATE 
                FROM DUAL 
                CONNECT BY LEVEL<=3
            ) T3
        ) A,
        (   
            -- B : 날짜별 학생들 출석 데이터
            SELECT ST.SID, ST.SNAME, A.SUBID, A.ADATE 
            FROM STUDENTS2 ST, ATTENDANCE A 
            WHERE ST.SID=A.SID(+) --AND TO_CHAR(ADATE, 'YYYYMMDD')='20210405';
        ) B
        WHERE A.SID=B.SID(+) 
            AND A.SUBID=B.SUBID(+) 
            AND B.SID IS NULL 
            AND A.ADATE=TO_CHAR(B.ADATE(+),'YYYYMMDD')
    )C 
    GROUP BY C.SID, C.SNAME;















