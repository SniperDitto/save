--1. 각 교수별 시험출제 현황 리스트를 보여주세요
    --(교수이름, 과목명, 시험명)
    
    SELECT * FROM EXAMS;
    SELECT * FROM PROFESSORS;
    SELECT * FROM SUBJECTS;
    
    SELECT T2.PNAME, T3.SNAME, T1.ENAME
    FROM EXAMS T1, PROFESSORS T2, SUBJECTS T3
    WHERE T1.PID = T2.PID
    AND T1.SUBID = T3.SUBID
    ORDER BY T3.SNAME ASC
    ;
    
    
    