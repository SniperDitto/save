
--1. ȸ��회원
CREATE TABLE AMEMBERS
(
    MID         CHAR(7)         NOT NULL PRIMARY KEY,
    MNAME       VARCHAR2(30)    NOT NULL
);

INSERT INTO AMEMBERS VALUES('M000001','최밥창문');
INSERT INTO AMEMBERS VALUES('M000002','완짱');
INSERT INTO AMEMBERS VALUES('M000003','몽짱');
INSERT INTO AMEMBERS VALUES('M000004','마쉬');
INSERT INTO AMEMBERS VALUES('M000005','낙지짱');


--2. ����권한
CREATE TABLE AUTHES
(
    AUTHID      CHAR(7)         NOT NULL PRIMARY KEY,
    AUTHNAME    VARCHAR2(30)    NOT NULL
    
);

INSERT INTO AUTHES VALUES('AUTH001','전체권한-관리자권한');
INSERT INTO AUTHES VALUES('AUTH002','일부권한01');
INSERT INTO AUTHES VALUES('AUTH003','일부권한02');
INSERT INTO AUTHES VALUES('AUTH004','SELECT권한');

--3 �޴�메뉴
CREATE TABLE MENUS
(
    MENUID      CHAR(7)         NOT NULL PRIMARY KEY,
    MENUNAME    VARCHAR2(50)    NOT NULL,
    MENUSEQ     NUMBER(5)       NOT NULL,
    MENULVL     NUMBER(5)       NOT NULL,
    PARENTID    CHAR(7)         NOT NULL
);

--3-1. 주메뉴
INSERT INTO MENUS VALUES('MENU001', '주메뉴1', 1, 1, 'ROOT');
INSERT INTO MENUS VALUES('MENU002', '주메뉴2', 2, 1, 'ROOT');
INSERT INTO MENUS VALUES('MENU003', '주메뉴3', 3, 1, 'ROOT');
INSERT INTO MENUS VALUES('MENU004', '주메뉴4', 4, 1, 'ROOT');

--3-2. 서브메뉴 - 1단계
    --MENU001 - 주메뉴1 하위
    INSERT INTO MENUS VALUES('MENU005', '서브메뉴1100', 1, 2, 'MENU001');
    INSERT INTO MENUS VALUES('MENU006', '서브메뉴1200', 2, 2, 'MENU001');
    
    --MENU002 - 주메뉴2 하위
    INSERT INTO MENUS VALUES('MENU007', '서브메뉴2001', 1, 2, 'MENU002');  -- 실제 동작 메뉴
    
    --MENU003 - 주메뉴3 하위
    INSERT INTO MENUS VALUES('MENU008', '서브메뉴3100', 1, 2, 'MENU003');
    
    --MENU004 - 주메뉴4 하위
    INSERT INTO MENUS VALUES('MENU009', '서브메뉴4100', 1, 2, 'MENU004');
    INSERT INTO MENUS VALUES('MENU010', '서브메뉴4200', 2, 2, 'MENU004');
    INSERT INTO MENUS VALUES('MENU011', '서브메뉴4300', 3, 2, 'MENU004');
 
    
--3-3. 서브메뉴 3단계

        --MENU005 -- 서브메뉴1100 하위
        INSERT INTO MENUS VALUES('MENU012', '서브메뉴1101', 1, 3, 'MENU005'); --실제 동작 메뉴
        INSERT INTO MENUS VALUES('MENU013', '서브메뉴1102', 2, 3, 'MENU005'); --실제 동작 메뉴
        
        --MENU006 -- 서브메뉴1200 하위
        INSERT INTO MENUS VALUES('MENU014', '서브메뉴1201', 1, 3, 'MENU006'); --실제 동작 메뉴
        INSERT INTO MENUS VALUES('MENU015', '서브메뉴1202', 2, 3, 'MENU006'); --실제 동작 메뉴
        INSERT INTO MENUS VALUES('MENU016', '서브메뉴1203', 3, 3, 'MENU006'); --실제 동작 메뉴
        
        --MENU008 -- 서브메뉴3100 하위
        INSERT INTO MENUS VALUES('MENU017', '서브메뉴3101', 1, 3, 'MENU008'); --실제 동작 메뉴
        
        --MENU009 -- 서브메뉴4100 하위
        INSERT INTO MENUS VALUES('MENU018', '서브메뉴4110', 1, 3, 'MENU009');
        INSERT INTO MENUS VALUES('MENU019', '서브메뉴4120', 2, 3, 'MENU009');
        
        --MENU010 -- 서브메뉴4200 하위
        INSERT INTO MENUS VALUES('MENU020', '서브메뉴4201', 1, 3, 'MENU010'); --실제 동작 메뉴
        
        --MENU011 -- 서브메뉴4300 하위
        INSERT INTO MENUS VALUES('MENU021', '서브메뉴4301', 1, 3, 'MENU011'); --실제 동작 메뉴
        INSERT INTO MENUS VALUES('MENU022', '서브메뉴4302', 1, 3, 'MENU011'); --실제 동작 메뉴
        
        
--3-4. 서브메뉴 4단계        
            
            --MENU018 -- 서브메뉴 4110 하위
            INSERT INTO MENUS VALUES('MENU023', '서브메뉴4111', 1, 4, 'MENU018'); --실제 동작 메뉴
            INSERT INTO MENUS VALUES('MENU024', '서브메뉴4112', 2, 4, 'MENU018'); --실제 동작 메뉴
            
            --MENU019 -- 서브메뉴 4120 하위
            INSERT INTO MENUS VALUES('MENU025', '서브메뉴4121', 1, 4, 'MENU019'); --실제 동작 메뉴
            INSERT INTO MENUS VALUES('MENU026', '서브메뉴4122', 2, 4, 'MENU019'); --실제 동작 메뉴
            INSERT INTO MENUS VALUES('MENU027', '서브메뉴4123', 3, 4, 'MENU019'); --실제 동작 메뉴

    SELECT 
        LPAD(' ', 2*(LEVEL-1)) || MENUNAME AS MENUNAME,
        MENUSEQ, MENULVL, MENUID
    FROM MENUS
    START WITH PARENTID = 'ROOT'
    CONNECT BY PRIOR MENUID = PARENTID
    ;

--4.프로그램
CREATE TABLE PROGRAMS
(
    PID         CHAR(7)         NOT NULL,
    MENUID      CHAR(7)         NOT NULL,
    PNAME       VARCHAR2(50)    NOT NULL,
    PFILENAME   VARCHAR2(50)    NOT NULL,
    ------------------------------------------------------------------REQUESTMAPPTING담을값필요
    
    CONSTRAINT PROGRAMS_PK PRIMARY KEY(PID, MENUID)
);

    --서브메뉴1101 -- MENU012 
    INSERT INTO PROGRAMS VALUES('P000001','MENU012','서브메뉴1101 프로그램','SUB1101.JSP');
    --서브메뉴1102 -- MENU013
    INSERT INTO PROGRAMS VALUES('P000002','MENU013','서브메뉴1102 프로그램','SUB1102.JSP');
    
    
    --서브메뉴1201 -- MENU014
    INSERT INTO PROGRAMS VALUES('P000003','MENU014','서브메뉴1201 프로그램','SUB1201.JSP');
    --서브메뉴1202 -- MENU015
    INSERT INTO PROGRAMS VALUES('P000004','MENU015','서브메뉴1202 프로그램','SUB1202.JSP');
    --서브메뉴1203 -- MENU016
    INSERT INTO PROGRAMS VALUES('P000005','MENU016','서브메뉴1203 프로그램','SUB1203.JSP');
    
    
    --서브메뉴2001 -- MENU007
    INSERT INTO PROGRAMS VALUES('P000006','MENU007','서브메뉴2001 프로그램','SUB2001.JSP');
    
    
    --서브메뉴3101 -- MENU017
    INSERT INTO PROGRAMS VALUES('P000007','MENU017','서브메뉴3101 프로그램','SUB3101.JSP');
    
    
    --서브메뉴4111 -- MENU023
    INSERT INTO PROGRAMS VALUES('P000008','MENU023','서브메뉴4111 프로그램','SUB4111.JSP');
    --서브메뉴4112 -- MENU024
    INSERT INTO PROGRAMS VALUES('P000009','MENU024','서브메뉴4112 프로그램','SUB4112.JSP');
    
    
    --서브메뉴4121 -- MENU025
    INSERT INTO PROGRAMS VALUES('P000010','MENU025','서브메뉴4121 프로그램','SUB4121.JSP');
    --서브메뉴4122 -- MENU025
    INSERT INTO PROGRAMS VALUES('P000011','MENU026','서브메뉴4122 프로그램','SUB4122.JSP');
    --서브메뉴4123 -- MENU025
    INSERT INTO PROGRAMS VALUES('P000012','MENU027','서브메뉴4123 프로그램','SUB4123.JSP');
    
    
    --서브메뉴4201 -- MENU020
    INSERT INTO PROGRAMS VALUES('P000013','MENU020','서브메뉴4201 프로그램','SUB4201.JSP');
    
    
    --서브메뉴4301 -- MENU021
    INSERT INTO PROGRAMS VALUES('P000014','MENU021','서브메뉴4301 프로그램','SUB4301.JSP');
    --서브메뉴4302 -- MENU022
    INSERT INTO PROGRAMS VALUES('P000015','MENU022','서브메뉴4302 프로그램','SUB4302.JSP');
    

--5.회원별 권한
CREATE TABLE MEMBER_AUTH
(
    MTHID       CHAR(7)         NOT NULL,
    MID         CHAR(7)         NOT NULL,
    AUTHID      CHAR(7)         NOT NULL,
    
    CONSTRAINT MEMBER_AUTH_PK PRIMARY KEY (MTHID, MID, AUTHID)
);

    -- 최밥창문(M000001) -- 전체권한 - 관리자 권한(AUTH001)
    INSERT INTO MEMBER_AUTH VALUES('MTH0001','M000001','AUTH001');
    -- 완짱(M000002) -- 일부권한01(AUTH002)
    INSERT INTO MEMBER_AUTH VALUES('MTH0002','M000002','AUTH002');
    -- 몽짱(M000003) -- 일부권한02(AUTH003)
    INSERT INTO MEMBER_AUTH VALUES('MTH0003','M000003','AUTH003');
    -- 마쉬(M000004) -- SELECT권한(AUTH004)
    INSERT INTO MEMBER_AUTH VALUES('MTH0004','M000004','AUTH004');


--6.권한별 메뉴
CREATE TABLE AUTH_MENUS
(
    AMID            CHAR(7)         NOT NULL,
    AUTHID          CHAR(7)         NOT NULL,
    MENUID          CHAR(7)         NOT NULL,
    
    --역정규화
    AUTH_SEL        CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_INS        CHAR(1)     DEFAULT 'N'   NOT NULL, 
    AUTH_UP         CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_DEL        CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_FILEUP     CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_FILEDN     CHAR(1)     DEFAULT 'N'   NOT NULL,
    
    CONSTRAINT AUTH_MENUS_PK  PRIMARY KEY (AMID, AUTHID, MENUID)
);

--전체메뉴 모든 권한 -- AUTH001

--주메뉴1
INSERT INTO AUTH_MENUS VALUES('AM00001','AUTH001','MENU001','Y','Y','Y','Y','Y','Y');
    
    --서브메뉴1100
    INSERT INTO AUTH_MENUS VALUES('AM00002','AUTH001','MENU005','Y','Y','Y','Y','Y','Y');
    
        --서브메뉴1101
        INSERT INTO AUTH_MENUS VALUES('AM00003','AUTH001','MENU012','Y','Y','Y','Y','Y','Y');
        --서브메뉴1102
        INSERT INTO AUTH_MENUS VALUES('AM00004','AUTH001','MENU013','Y','Y','Y','Y','Y','Y');
        
    --서브메뉴1200
    INSERT INTO AUTH_MENUS VALUES('AM00005','AUTH001','MENU006','Y','Y','Y','Y','Y','Y');
        
        --서브메뉴1201
        INSERT INTO AUTH_MENUS VALUES('AM00006','AUTH001','MENU014','Y','Y','Y','Y','Y','Y');
        --서브메뉴1202
        INSERT INTO AUTH_MENUS VALUES('AM00007','AUTH001','MENU015','Y','Y','Y','Y','Y','Y');
        --서브메뉴1203
        INSERT INTO AUTH_MENUS VALUES('AM00008','AUTH001','MENU016','Y','Y','Y','Y','Y','Y');
        
        
--주메뉴2        
INSERT INTO AUTH_MENUS VALUES('AM00009','AUTH001','MENU002','Y','Y','Y','Y','Y','Y');

        --서브메뉴2001
        INSERT INTO AUTH_MENUS VALUES('AM00010','AUTH001','MENU007','Y','Y','Y','Y','Y','Y');
    
    
--주메뉴3
INSERT INTO AUTH_MENUS VALUES('AM00011','AUTH001','MENU003','Y','Y','Y','Y','Y','Y');

    --서브메뉴3100
    INSERT INTO AUTH_MENUS VALUES('AM00012','AUTH001','MENU008','Y','Y','Y','Y','Y','Y');
    
        --서브메뉴3101
        INSERT INTO AUTH_MENUS VALUES('AM00013','AUTH001','MENU017','Y','Y','Y','Y','Y','Y');
        
        
--주메뉴4 
INSERT INTO AUTH_MENUS VALUES('AM00014','AUTH001','MENU004','Y','Y','Y','Y','Y','Y');

    --서브메뉴4100
    INSERT INTO AUTH_MENUS VALUES('AM00015','AUTH001','MENU009','Y','Y','Y','Y','Y','Y');
    
        --서브메뉴4110
        INSERT INTO AUTH_MENUS VALUES('AM00016','AUTH001','MENU018','Y','Y','Y','Y','Y','Y');
        
            --서브메뉴4111
            INSERT INTO AUTH_MENUS VALUES('AM00017','AUTH001','MENU023','Y','Y','Y','Y','Y','Y');
            --서브메뉴4112
            INSERT INTO AUTH_MENUS VALUES('AM00018','AUTH001','MENU024','Y','Y','Y','Y','Y','Y');
            
        --서브메뉴4120
        INSERT INTO AUTH_MENUS VALUES('AM00019','AUTH001','MENU019','Y','Y','Y','Y','Y','Y');
        
            --서브메뉴4121
            INSERT INTO AUTH_MENUS VALUES('AM00020','AUTH001','MENU025','Y','Y','Y','Y','Y','Y');
            --서브메뉴4122
            INSERT INTO AUTH_MENUS VALUES('AM00021','AUTH001','MENU026','Y','Y','Y','Y','Y','Y');
            --서브메뉴4123
            INSERT INTO AUTH_MENUS VALUES('AM00022','AUTH001','MENU027','Y','Y','Y','Y','Y','Y');
            
   --서브메뉴4200
    INSERT INTO AUTH_MENUS VALUES('AM00023','AUTH001','MENU010','Y','Y','Y','Y','Y','Y');  
        
            --서브메뉴4201
            INSERT INTO AUTH_MENUS VALUES('AM00024','AUTH001','MENU020','Y','Y','Y','Y','Y','Y');
            
    --서브메뉴4300
    INSERT INTO AUTH_MENUS VALUES('AM00025','AUTH001','MENU011','Y','Y','Y','Y','Y','Y');        
    
            --서브메뉴4301
            INSERT INTO AUTH_MENUS VALUES('AM00026','AUTH001','MENU021','Y','Y','Y','Y','Y','Y');
            --서브메뉴4302
            INSERT INTO AUTH_MENUS VALUES('AM00027','AUTH001','MENU022','Y','Y','Y','Y','Y','Y');
/*********************************************************************************************************/

/*********************************************************************************************************/
--일부권한01 -- AUTH002

--주메뉴1
INSERT INTO AUTH_MENUS VALUES('AM00028','AUTH002','MENU001','Y','Y','Y','Y','N','N');
    
    --서브메뉴1100
    INSERT INTO AUTH_MENUS VALUES('AM00029','AUTH002','MENU005','Y','Y','Y','Y','N','N');

        --서브메뉴1101 -- MENU012
        INSERT INTO AUTH_MENUS VALUES('AM00030','AUTH002','MENU012','Y','Y','Y','Y','N','N');
        --서브메뉴1102 -- MENU013
        INSERT INTO AUTH_MENUS VALUES('AM00031','AUTH002','MENU013','Y','Y','Y','Y','N','N');

    --서브메뉴1200
    INSERT INTO AUTH_MENUS VALUES('AM00032','AUTH002','MENU006','Y','Y','Y','N','N','N');
    
        --서브메뉴1201 -- MENU014
        INSERT INTO AUTH_MENUS VALUES('AM00033','AUTH002','MENU014','Y','Y','N','N','N','N');
        --서브메뉴1202 -- MENU015
        INSERT INTO AUTH_MENUS VALUES('AM00034','AUTH002','MENU015','Y','Y','Y','N','N','N');
        --서브메뉴1203 -- MENU016
        INSERT INTO AUTH_MENUS VALUES('AM00035','AUTH002','MENU016','Y','Y','Y','N','N','N');


--주메뉴2        
INSERT INTO AUTH_MENUS VALUES('AM00036','AUTH002','MENU002','Y','Y','Y','Y','Y','Y');

    --서브메뉴2001 -- MENU007
    INSERT INTO AUTH_MENUS VALUES('AM00037','AUTH002','MENU007','Y','Y','Y','Y','Y','Y');


--주메뉴3
INSERT INTO AUTH_MENUS VALUES('AM00038','AUTH002','MENU003','N','N','N','N','N','N');

    --서브메뉴3100
    INSERT INTO AUTH_MENUS VALUES('AM00039','AUTH002','MENU008','N','N','N','N','N','N');
    
        --서브메뉴3101 -- MENU017
        INSERT INTO AUTH_MENUS VALUES('AM00040','AUTH002','MENU017','N','N','N','N','N','N');


--주메뉴4 
INSERT INTO AUTH_MENUS VALUES('AM00041','AUTH002','MENU004','Y','Y','Y','Y','Y','Y');

    --서브메뉴4100
    INSERT INTO AUTH_MENUS VALUES('AM00042','AUTH002','MENU009','Y','Y','Y','Y','Y','Y');
    
        --서브메뉴4110
        INSERT INTO AUTH_MENUS VALUES('AM00043','AUTH002','MENU018','Y','N','N','N','N','N');
        
            --서브메뉴4111 -- MENU023
            INSERT INTO AUTH_MENUS VALUES('AM00044','AUTH002','MENU023','N','N','N','N','N','N');
            --서브메뉴4112 -- MENU024
            INSERT INTO AUTH_MENUS VALUES('AM00045','AUTH002','MENU024','Y','N','N','N','N','N');

        --서브메뉴4120
        INSERT INTO AUTH_MENUS VALUES('AM00046','AUTH002','MENU019','Y','Y','Y','Y','Y','Y');
        
            --서브메뉴4121 -- MENU025
            INSERT INTO AUTH_MENUS VALUES('AM00047','AUTH002','MENU025','Y','Y','Y','Y','Y','Y');
            --서브메뉴4122 -- MENU026
            INSERT INTO AUTH_MENUS VALUES('AM00048','AUTH002','MENU026','Y','Y','Y','Y','Y','Y');
            --서브메뉴4122 -- MENU027
            INSERT INTO AUTH_MENUS VALUES('AM00049','AUTH002','MENU027','Y','Y','Y','Y','Y','Y');

   --서브메뉴4200
    INSERT INTO AUTH_MENUS VALUES('AM00050','AUTH002','MENU010','Y','N','N','N','N','N');
    
        --서브메뉴4201 -- MENU020
        INSERT INTO AUTH_MENUS VALUES('AM00051','AUTH002','MENU020','Y','N','N','N','N','N');

    --서브메뉴4300
        INSERT INTO AUTH_MENUS VALUES('AM00052','AUTH002','MENU011','Y','Y','Y','N','Y','Y');
        
        --서브메뉴4301 -- MENU021
        INSERT INTO AUTH_MENUS VALUES('AM00053','AUTH002','MENU021','Y','Y','Y','N','N','N');
        --서브메뉴4302 -- MENU022
        INSERT INTO AUTH_MENUS VALUES('AM00054','AUTH002','MENU022','Y','Y','Y','N','Y','Y');
/*********************************************************************************************************/



/*********************************************************************************************************/
--조회권한 -- AUTH004

--주메뉴1
INSERT INTO AUTH_MENUS VALUES('AM00061','AUTH004','MENU001','Y','N','N','N','N','N');
    
    --서브메뉴1100
    INSERT INTO AUTH_MENUS VALUES('AM00062','AUTH004','MENU005','Y','N','N','N','N','N');

        --서브메뉴1101 -- MENU012
        INSERT INTO AUTH_MENUS VALUES('AM00063','AUTH004','MENU012','Y','N','N','N','N','N');
        --서브메뉴1102 -- MENU013
        INSERT INTO AUTH_MENUS VALUES('AM00064','AUTH004','MENU013','Y','N','N','N','N','N');

    --서브메뉴1200
    INSERT INTO AUTH_MENUS VALUES('AM00065','AUTH004','MENU006','Y','N','N','N','N','N');
    
        --서브메뉴1201 -- MENU014
        INSERT INTO AUTH_MENUS VALUES('AM00066','AUTH004','MENU014','Y','N','N','N','N','N');
        --서브메뉴1202 -- MENU015
        INSERT INTO AUTH_MENUS VALUES('AM00067','AUTH004','MENU015','Y','N','N','N','N','N');
        --서브메뉴1203 -- MENU016
        INSERT INTO AUTH_MENUS VALUES('AM00068','AUTH004','MENU016','Y','N','N','N','N','N');


--주메뉴2        
INSERT INTO AUTH_MENUS VALUES('AM00069','AUTH004','MENU002','Y','N','N','N','N','N');

    --서브메뉴2001 -- MENU007
    INSERT INTO AUTH_MENUS VALUES('AM00070','AUTH004','MENU007','Y','N','N','N','N','N');


--주메뉴3
INSERT INTO AUTH_MENUS VALUES('AM00071','AUTH004','MENU003','Y','N','N','N','N','N');

    --서브메뉴3100
    INSERT INTO AUTH_MENUS VALUES('AM00072','AUTH004','MENU008','Y','N','N','N','N','N');
    
        --서브메뉴3101 -- MENU017
        INSERT INTO AUTH_MENUS VALUES('AM00073','AUTH004','MENU017','Y','N','N','N','N','N');


--주메뉴4 
INSERT INTO AUTH_MENUS VALUES('AM00074','AUTH004','MENU004','Y','N','N','N','N','N');

    --서브메뉴4100
    INSERT INTO AUTH_MENUS VALUES('AM00075','AUTH004','MENU009','Y','N','N','N','N','N');
    
        --서브메뉴4110
        INSERT INTO AUTH_MENUS VALUES('AM00076','AUTH004','MENU018','Y','N','N','N','N','N');
        
            --서브메뉴4111 -- MENU023
            INSERT INTO AUTH_MENUS VALUES('AM00077','AUTH004','MENU023','Y','N','N','N','N','N');
            --서브메뉴4112 -- MENU024
            INSERT INTO AUTH_MENUS VALUES('AM00078','AUTH004','MENU024','Y','N','N','N','N','N');

        --서브메뉴4120
        INSERT INTO AUTH_MENUS VALUES('AM00079','AUTH004','MENU019','Y','N','N','N','N','N');
        
            --서브메뉴4121 -- MENU025
            INSERT INTO AUTH_MENUS VALUES('AM00080','AUTH004','MENU025','Y','N','N','N','N','N');
            --서브메뉴4122 -- MENU026
            INSERT INTO AUTH_MENUS VALUES('AM00081','AUTH004','MENU026','Y','N','N','N','N','N');
            --서브메뉴4122 -- MENU027
            INSERT INTO AUTH_MENUS VALUES('AM00082','AUTH004','MENU027','Y','N','N','N','N','N');

   --서브메뉴4200
    INSERT INTO AUTH_MENUS VALUES('AM00083','AUTH004','MENU010','Y','N','N','N','N','N');
    
        --서브메뉴4201 -- MENU020
        INSERT INTO AUTH_MENUS VALUES('AM00084','AUTH004','MENU020','Y','N','N','N','N','N');

    --서브메뉴4300
        INSERT INTO AUTH_MENUS VALUES('AM00085','AUTH004','MENU011','Y','N','N','N','N','N');
        
        --서브메뉴4301 -- MENU021
        INSERT INTO AUTH_MENUS VALUES('AM00086','AUTH004','MENU021','Y','N','N','N','N','N');
        --서브메뉴4302 -- MENU022
        INSERT INTO AUTH_MENUS VALUES('AM00087','AUTH004','MENU022','Y','N','N','N','N','N');
/*********************************************************************************************************/

