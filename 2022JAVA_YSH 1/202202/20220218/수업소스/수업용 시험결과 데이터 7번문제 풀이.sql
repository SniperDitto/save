--7. 각 학생별로 시험을 치룬 과목수를 리스트로 보여주세요
SELECT * FROM STUDENTS;
SELECT * FROM EXAMS;
SELECT * FROM SCORES;

SELECT T1.SID, T1.SNAME, COUNT(*) FROM STUDENTS T1, SCORES T2
WHERE T1.SID = T2.SID
GROUP BY T1.SID, T1.SNAME
ORDER BY T1.SID ASC
;
