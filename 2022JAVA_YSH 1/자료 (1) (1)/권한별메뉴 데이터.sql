--6.���Ѻ� �޴�
CREATE TABLE AUTH_MENUS
(
    AMID            CHAR(7)         NOT NULL,
    AUTHID          CHAR(7)         NOT NULL,
    MENUID          CHAR(7)         NOT NULL,
    
    --������ȭ
    AUTH_SEL        CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_INS        CHAR(1)     DEFAULT 'N'   NOT NULL, 
    AUTH_UP         CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_DEL        CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_FILEUP     CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_FILEDN     CHAR(1)     DEFAULT 'N'   NOT NULL,
    
    CONSTRAINT AUTH_MENUS_PK PRIMARY KEY (AMID, AUTHID, MENUID)
);





/*********************************************************************************************************/
--��ü�޴� ��� ���� -- AUTH001

--����޴�1101 -- MENU012
INSERT INTO AUTH_MENUS VALUES('AM00001','AUTH001','MENU012','Y','Y','Y','Y','Y','Y');
--����޴�1102 -- MENU013
INSERT INTO AUTH_MENUS VALUES('AM00002','AUTH001','MENU013','Y','Y','Y','Y','Y','Y');


--����޴�1201 -- MENU014
INSERT INTO AUTH_MENUS VALUES('AM00003','AUTH001','MENU014','Y','Y','Y','Y','Y','Y');
--����޴�1202 -- MENU015
INSERT INTO AUTH_MENUS VALUES('AM00004','AUTH001','MENU015','Y','Y','Y','Y','Y','Y');
--����޴�1203 -- MENU016
INSERT INTO AUTH_MENUS VALUES('AM00005','AUTH001','MENU016','Y','Y','Y','Y','Y','Y');


--����޴�2001 -- MENU007
INSERT INTO AUTH_MENUS VALUES('AM00006','AUTH001','MENU007','Y','Y','Y','Y','Y','Y');


--����޴�3101 -- MENU017
INSERT INTO AUTH_MENUS VALUES('AM00007','AUTH001','MENU017','Y','Y','Y','Y','Y','Y');


--����޴�4111 -- MENU023
INSERT INTO AUTH_MENUS VALUES('AM00008','AUTH001','MENU023','Y','Y','Y','Y','Y','Y');
--����޴�4112 -- MENU024
INSERT INTO AUTH_MENUS VALUES('AM00009','AUTH001','MENU024','Y','Y','Y','Y','Y','Y');


--����޴�4121 -- MENU025
INSERT INTO AUTH_MENUS VALUES('AM00010','AUTH001','MENU025','Y','Y','Y','Y','Y','Y');
--����޴�4122 -- MENU026
INSERT INTO AUTH_MENUS VALUES('AM00011','AUTH001','MENU026','Y','Y','Y','Y','Y','Y');
--����޴�4122 -- MENU027
INSERT INTO AUTH_MENUS VALUES('AM00012','AUTH001','MENU027','Y','Y','Y','Y','Y','Y');


--����޴�4201 -- MENU020
INSERT INTO AUTH_MENUS VALUES('AM00013','AUTH001','MENU020','Y','Y','Y','Y','Y','Y');


--����޴�4301 -- MENU021
INSERT INTO AUTH_MENUS VALUES('AM00014','AUTH001','MENU021','Y','Y','Y','Y','Y','Y');
--����޴�4302 -- MENU022
INSERT INTO AUTH_MENUS VALUES('AM00015','AUTH001','MENU022','Y','Y','Y','Y','Y','Y');
/*********************************************************************************************************/



/*********************************************************************************************************/
--�Ϻα���01 -- AUTH002

--����޴�1101 -- MENU012
INSERT INTO AUTH_MENUS VALUES('AM00001','AUTH002','MENU012','Y','Y','Y','Y','N','N');
--����޴�1102 -- MENU013
INSERT INTO AUTH_MENUS VALUES('AM00002','AUTH002','MENU013','Y','Y','Y','Y','N','N');


--����޴�1201 -- MENU014
INSERT INTO AUTH_MENUS VALUES('AM00003','AUTH002','MENU014','Y','Y','N','N','N','N');
--����޴�1202 -- MENU015
INSERT INTO AUTH_MENUS VALUES('AM00004','AUTH002','MENU015','Y','Y','Y','N','N','N');
--����޴�1203 -- MENU016
INSERT INTO AUTH_MENUS VALUES('AM00005','AUTH002','MENU016','Y','Y','Y','N','N','N');


--����޴�2001 -- MENU007
INSERT INTO AUTH_MENUS VALUES('AM00006','AUTH002','MENU007','Y','Y','Y','Y','Y','Y');


--����޴�3101 -- MENU017
INSERT INTO AUTH_MENUS VALUES('AM00007','AUTH002','MENU017','N','N','N','N','N','N');


--����޴�4111 -- MENU023
INSERT INTO AUTH_MENUS VALUES('AM00008','AUTH002','MENU023','N','N','N','N','N','N');
--����޴�4112 -- MENU024
INSERT INTO AUTH_MENUS VALUES('AM00009','AUTH002','MENU024','Y','N','N','N','N','N');


--����޴�4121 -- MENU025
INSERT INTO AUTH_MENUS VALUES('AM00010','AUTH002','MENU025','Y','Y','Y','Y','Y','Y');
--����޴�4122 -- MENU026
INSERT INTO AUTH_MENUS VALUES('AM00011','AUTH002','MENU026','Y','Y','Y','Y','Y','Y');
--����޴�4122 -- MENU027
INSERT INTO AUTH_MENUS VALUES('AM00012','AUTH002','MENU027','Y','Y','Y','Y','Y','Y');


--����޴�4201 -- MENU020
INSERT INTO AUTH_MENUS VALUES('AM00013','AUTH002','MENU020','Y','N','N','N','N','N');


--����޴�4301 -- MENU021
INSERT INTO AUTH_MENUS VALUES('AM00014','AUTH002','MENU021','Y','Y','Y','N','N','N');
--����޴�4302 -- MENU022
INSERT INTO AUTH_MENUS VALUES('AM00015','AUTH002','MENU022','Y','Y','Y','N','Y','Y');
/*********************************************************************************************************/



/*********************************************************************************************************/
--�Ϻα���03 -- AUTH003

--����޴�1101 -- MENU012
INSERT INTO AUTH_MENUS VALUES('AM00001','AUTH003','MENU012','Y','N','N','N','N','N');
--����޴�1102 -- MENU013
INSERT INTO AUTH_MENUS VALUES('AM00002','AUTH003','MENU013','Y','N','N','N','N','N');


--����޴�1201 -- MENU014
INSERT INTO AUTH_MENUS VALUES('AM00003','AUTH003','MENU014','Y','N','N','N','N','N');
--����޴�1202 -- MENU015
INSERT INTO AUTH_MENUS VALUES('AM00004','AUTH003','MENU015','Y','N','N','N','N','N');
--����޴�1203 -- MENU016
INSERT INTO AUTH_MENUS VALUES('AM00005','AUTH003','MENU016','Y','N','N','N','N','N');


--����޴�2001 -- MENU007
INSERT INTO AUTH_MENUS VALUES('AM00006','AUTH003','MENU007','Y','N','N','N','N','N');


--����޴�3101 -- MENU017
INSERT INTO AUTH_MENUS VALUES('AM00007','AUTH003','MENU017','Y','N','N','N','N','N');


--����޴�4111 -- MENU023
INSERT INTO AUTH_MENUS VALUES('AM00008','AUTH003','MENU023','Y','N','N','N','N','N');
--����޴�4112 -- MENU024
INSERT INTO AUTH_MENUS VALUES('AM00009','AUTH003','MENU024','Y','N','N','N','N','N');


--����޴�4121 -- MENU025
INSERT INTO AUTH_MENUS VALUES('AM00010','AUTH003','MENU025','Y','Y','Y','Y','Y','Y');
--����޴�4122 -- MENU026
INSERT INTO AUTH_MENUS VALUES('AM00011','AUTH003','MENU026','Y','Y','Y','Y','Y','Y');
--����޴�4122 -- MENU027
INSERT INTO AUTH_MENUS VALUES('AM00012','AUTH003','MENU027','Y','Y','Y','Y','Y','Y');


--����޴�4201 -- MENU020
INSERT INTO AUTH_MENUS VALUES('AM00013','AUTH003','MENU020','Y','Y','Y','Y','Y','Y');


--����޴�4301 -- MENU021
INSERT INTO AUTH_MENUS VALUES('AM00014','AUTH003','MENU021','Y','Y','Y','Y','Y','Y');
--����޴�4302 -- MENU022
INSERT INTO AUTH_MENUS VALUES('AM00015','AUTH003','MENU022','Y','Y','Y','Y','Y','Y');
/*********************************************************************************************************/


/*********************************************************************************************************/
--��ȸ���� -- AUTH004

--����޴�1101 -- MENU012
INSERT INTO AUTH_MENUS VALUES('AM00001','AUTH004','MENU012','Y','N','N','N','N','N');
--����޴�1102 -- MENU013
INSERT INTO AUTH_MENUS VALUES('AM00002','AUTH004','MENU013','Y','N','N','N','N','N');


--����޴�1201 -- MENU014
INSERT INTO AUTH_MENUS VALUES('AM00003','AUTH004','MENU014','Y','N','N','N','N','N');
--����޴�1202 -- MENU015
INSERT INTO AUTH_MENUS VALUES('AM00004','AUTH004','MENU015','Y','N','N','N','N','N');
--����޴�1203 -- MENU016
INSERT INTO AUTH_MENUS VALUES('AM00005','AUTH004','MENU016','Y','N','N','N','N','N');


--����޴�2001 -- MENU007
INSERT INTO AUTH_MENUS VALUES('AM00006','AUTH004','MENU007','Y','N','N','N','N','N');

--����޴�3101 -- MENU017
INSERT INTO AUTH_MENUS VALUES('AM00007','AUTH004','MENU017','Y','N','N','N','N','N');


--����޴�4111 -- MENU023
INSERT INTO AUTH_MENUS VALUES('AM00008','AUTH004','MENU023','Y','N','N','N','N','N');
--����޴�4112 -- MENU024
INSERT INTO AUTH_MENUS VALUES('AM00009','AUTH004','MENU024','Y','N','N','N','N','N');


--����޴�4121 -- MENU025
INSERT INTO AUTH_MENUS VALUES('AM00010','AUTH004','MENU025','Y','N','N','N','N','N');
--����޴�4122 -- MENU026
INSERT INTO AUTH_MENUS VALUES('AM00011','AUTH004','MENU026','Y','N','N','N','N','N');
--����޴�4122 -- MENU027
INSERT INTO AUTH_MENUS VALUES('AM00012','AUTH004','MENU027','Y','N','N','N','N','N');


--����޴�4201 -- MENU020
INSERT INTO AUTH_MENUS VALUES('AM00013','AUTH004','MENU020','Y','N','N','N','N','N');


--����޴�4301 -- MENU021
INSERT INTO AUTH_MENUS VALUES('AM00014','AUTH004','MENU021','Y','N','N','N','N','N');
--����޴�4302 -- MENU022
INSERT INTO AUTH_MENUS VALUES('AM00015','AUTH004','MENU022','Y','N','N','N','N','N');
/*********************************************************************************************************/


ROLLBACK;


