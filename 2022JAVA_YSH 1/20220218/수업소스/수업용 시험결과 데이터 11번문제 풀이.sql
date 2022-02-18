--11. 20대 여학생이 치른 시험의 총점과 평균을 구해주세요

SELECT * FROM STUDENTS
WHERE SAGE >= 20 AND SAGE < 30

;

SELECT * FROM SCORES;

SELECT T1.SID, T1.SNAME, SUM(T2.SCORE), ROUND(AVG(SCORE), 1), --ROUND(SUM(T2.SCORE) / 6, 1)
    ROUND(SUM(T2.SCORE) / (SELECT COUNT(*) FROM SUBJECTS), 1)
FROM STUDENTS T1, SCORES T2
WHERE T1.SID = T2.SID
GROUP BY T1.SID, T1.SNAME
ORDER BY T1.SID ASC
;

SELECT '20대여성', SUM(T2.SCORE), ROUND(SUM(T2.SCORE) / 
                                    (
                                        (SELECT COUNT(*) FROM SUBJECTS)
                                        *
                                        (SELECT COUNT(*) FROM STUDENTS
                                        WHERE SAGE >= 20 AND SAGE < 30)
                                    ), 1) AS SAVG
FROM STUDENTS T1, SCORES T2
WHERE T1.SID = T2.SID
AND T1.SAGE >= 20 AND T1.SAGE < 30
GROUP BY '20대여성'
;

SELECT SUM(T2.SCORE), AVG(T2.SCORE), SUM(T2.SCORE) / (SELECT COUNT(*) FROM SUBJECTS)
FROM STUDENTS T1, SCORES T2
WHERE T1.SID = T2.SID
AND T1.SAGE >= 20 AND T1.SAGE < 30

;

SELECT *
FROM STUDENTS T1, SCORES T2
WHERE T1.SID = T2.SID
AND T1.SAGE >= 20 AND T1.SAGE < 30
AND SGENDER = 'F'


