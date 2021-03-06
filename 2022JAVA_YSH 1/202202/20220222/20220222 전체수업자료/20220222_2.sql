CREATE TABLE MENUS1
(
    MID     CHAR(4)     NOT NULL   PRIMARY KEY,
    MNAME   VARCHAR2(50)        NOT NULL
);
--공지사항 수업자료 숙제 자료공유 동영상 개인게시판

INSERT INTO MENUS1 VALUES('M001','공지사항');
INSERT INTO MENUS1 VALUES('M002','수업자료');
INSERT INTO MENUS1 VALUES('M003','숙제');
INSERT INTO MENUS1 VALUES('M004','자료공유');
INSERT INTO MENUS1 VALUES('M005','동영상');
INSERT INTO MENUS1 VALUES('M006','개인게시판');
SELECT * FROM MENUS1;   --COMMIT;

CREATE TABLE MENUS2
(
    MID2    CHAR(4)    PRIMARY KEY,
    MNAME2  VARCHAR2(50)    NOT NULL,
    MID     CHAR(4)     NOT NULL
);
SELECT * FROM MENUS2;    --COMMIT;
--공지사항
INSERT INTO MENUS2 VALUES('M201', '공지사항', 'M001');
INSERT INTO MENUS2 VALUES('M202', 'PM게시판', 'M001');
INSERT INTO MENUS2 VALUES('M203', '김장현 가입안하나', 'M001');

--수업자료
INSERT INTO MENUS2 VALUES('M204', 'HTML',       'M002');
INSERT INTO MENUS2 VALUES('M205', 'JAVASCRIPT', 'M002');
INSERT INTO MENUS2 VALUES('M206', 'DATABASE',   'M002');
INSERT INTO MENUS2 VALUES('M207', 'WEBPROGRAM', 'M002');

--숙제
INSERT INTO MENUS2 VALUES('M208', '숙제1', 'M003');
INSERT INTO MENUS2 VALUES('M209', '숙제2', 'M003');

--자료공유
INSERT INTO MENUS2 VALUES('M210', '자료1', 'M004');
INSERT INTO MENUS2 VALUES('M211', '자료2', 'M004');




SELECT * FROM MENUS1;
SELECT * FROM MENUS2
WHERE MID = 'M005'
;

SELECT * FROM MENUS1 T1, MENUS2 T2
WHERE T1.MID = T2.MID(+)
AND T2.MID = 'M005'
;