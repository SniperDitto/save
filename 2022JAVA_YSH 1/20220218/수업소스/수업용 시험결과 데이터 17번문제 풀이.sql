--17. 평균점수가 가장 높은 시험의 가장높은 점수를 받은 학생을 찾아주세요


--1. 시험별로 평균점수를 구해야 되는데 왜 학생별로 구하고 지롤이야 .......
SELECT T1.SID, T1.SNAME, SUM(T2.SCORE), AVG(T2.SCORE)
FROM STUDENTS T1, SCORES T2
WHERE T1.SID = T2.SID
GROUP BY T1.SID, T1.SNAME
ORDER BY AVG(T2.SCORE) DESC
;

--평균점수가 가장높은 시험
        SELECT * FROM
        (
            SELECT T1.PID, T1.SUBID, AVG(T2.SCORE) AS SCOREAVG
            FROM EXAMS T1, SCORES T2
            WHERE T1.PID = T2.PID AND T1.SUBID = T2.SUBID
            --AND T1.PID = 'P008' AND T2.SUBID = 'S006'
            GROUP BY T1.PID, T1.SUBID
            ORDER BY AVG(T2.SCORE) DESC
        ) A, SCORES B
        WHERE A.PID = B.PID AND A.SUBID = B.SUBID
        ORDER BY SCOREAVG DESC, B.SCORE DESC

        ;
        
        SELECT * FROM
        (
            SELECT T1.PID, T1.SUBID, AVG(T2.SCORE) AS SCOREAVG
            FROM EXAMS T1, SCORES T2
            WHERE T1.PID = T2.PID AND T1.SUBID = T2.SUBID
            GROUP BY T1.PID, T1.SUBID
            ORDER BY AVG(T2.SCORE) DESC        
            ;

    


