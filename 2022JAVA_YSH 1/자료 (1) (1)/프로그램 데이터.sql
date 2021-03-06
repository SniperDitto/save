--4. 프로그램

CREATE TABLE PROGRAMS
(
    PID         CHAR(7)         NOT NULL,
    MENUID      CHAR(7)         NOT NULL,
    PNAME       VARCHAR2(50)    NOT NULL,
    PFILENAME   VARCHAR2(50)    NOT NULL,
    
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
    
    
    
    --COMMIT;
    
    