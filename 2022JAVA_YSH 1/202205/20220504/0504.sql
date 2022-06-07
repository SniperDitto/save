--테스트
CREATE TABLE TESTBOARD
(
    IDX     NUMBER          PRIMARY KEY,
    TITLE   VARCHAR2(100)   NOT NULL,
    LVL     NUMBER          NOT NULL,
    COMBINE NUMBER          NOT NULL,
    ORDERS  NUMBER          NOT NULL,
    REGDATE DATE            NOT NULL
);

--------------------------------------
--수업

--첫글
INSERT INTO BOARDS(IDX, TITLE, CONTENT, USERID, 
                    REGNUM, LVL, COMBINE, VISITED,
                    REGDATE, LMENUID, ORD, DELNUM)
VALUES(1,'첫글','ASDF','ADMIN',1,1,1,0,SYSDATE,'MENU01',1,0);
--두번째글
INSERT INTO BOARDS(IDX, TITLE, CONTENT, USERID, 
                    REGNUM, LVL, COMBINE, VISITED,
                    REGDATE, LMENUID, ORD, DELNUM)
VALUES(2,'둘째글','ASDF','ADMIN',1,1,2,0,SYSDATE,'MENU01',1,0);
--첫글 - 답글
INSERT INTO BOARDS(IDX, TITLE, CONTENT, USERID, 
                    REGNUM, LVL, COMBINE, VISITED,
                    REGDATE, LMENUID, ORD, DELNUM)
VALUES(3,'첫글-답글','ASDF','ADMIN',1,2,1,0,SYSDATE,'MENU01',2,0);
--첫글 - 답글 - 답글
INSERT INTO BOARDS(IDX, TITLE, CONTENT, USERID, 
                    REGNUM, LVL, COMBINE, VISITED,
                    REGDATE, LMENUID, ORD, DELNUM)
VALUES(4,'첫글-답글-답글','ASDF','ADMIN',1,3,1,0,SYSDATE,'MENU01',3,0);
--첫글 - 답글2
UPDATE BOARDS SET ORD=ORD+1 WHERE ORD>1;
INSERT INTO BOARDS(IDX, TITLE, CONTENT, USERID, 
                    REGNUM, LVL, COMBINE, VISITED,
                    REGDATE, LMENUID, ORD, DELNUM)
VALUES(5,'첫글-답글2','ASDF','ADMIN',1,2,1,0,SYSDATE,'MENU01',2,0);


SELECT LPAD(' ', 4*(LVL-1))||TITLE
FROM BOARDS
ORDER BY COMBINE DESC, ORD ASC;
