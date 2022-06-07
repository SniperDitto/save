CREATE TABLE MAINMENUS
(
    MMENUID      CHAR(7)         NOT NULL PRIMARY KEY,
    MMENUNAME    VARCHAR2(50)    NOT NULL,
    MMENUSEQ     NUMBER(5)       NOT NULL,
    MMENULVL     NUMBER(5)       NOT NULL
);

--1. 주메뉴
INSERT INTO MAINMENUS VALUES('MMENU01', '주메뉴1', 1, 1);
INSERT INTO MAINMENUS VALUES('MMENU02', '주메뉴2', 2, 1);
INSERT INTO MAINMENUS VALUES('MMENU03', '주메뉴3', 3, 1);
INSERT INTO MAINMENUS VALUES('MMENU04', '주메뉴4', 4, 1);


CREATE TABLE SUBMENUS
(
    MENUID      CHAR(7)         NOT NULL,
    MMENUID     CHAR(7)         NOT NULL, 
    MENUNAME    VARCHAR2(50)    NOT NULL,
    MENUSEQ     NUMBER(5)       NOT NULL,
    MENULVL     NUMBER(5)       NOT NULL,
    PARENTID    CHAR(7)         NOT NULL,
    CONSTRAINT  SUBMENUS_PK PRIMARY KEY (MENUID, MMENUID)
);



--2. 서브메뉴 - 1단계
    --MENU001 - 주메뉴1 하위
    INSERT INTO SUBMENUS VALUES('MENU005', 'MMENU01', '서브메뉴1100', 1, 2, 'MENU001');
    INSERT INTO SUBMENUS VALUES('MENU006', 'MMENU01', '서브메뉴1200', 2, 2, 'MENU001');
    
    --MENU002 - 주메뉴2 하위
    INSERT INTO SUBMENUS VALUES('MENU007', 'MMENU02', '서브메뉴2001', 1, 2, 'MENU002');  -- 실제 동작 메뉴
    
    --MENU003 - 주메뉴3 하위
    INSERT INTO SUBMENUS VALUES('MENU008', 'MMENU03', '서브메뉴3100', 1, 2, 'MENU003');
    
    --MENU004 - 주메뉴4 하위
    INSERT INTO SUBMENUS VALUES('MENU009', 'MMENU04', '서브메뉴4100', 1, 2, 'MENU004');
    INSERT INTO SUBMENUS VALUES('MENU010', 'MMENU04', '서브메뉴4200', 2, 2, 'MENU004');
    INSERT INTO SUBMENUS VALUES('MENU011', 'MMENU04', '서브메뉴4300', 3, 2, 'MENU004');
 
    
--3. 서브메뉴 3단계

        --MENU005 -- 서브메뉴1100 하위
        INSERT INTO SUBMENUS VALUES('MENU012', 'MMENU01', '서브메뉴1101', 1, 3, 'MENU005'); --실제 동작 메뉴
        INSERT INTO SUBMENUS VALUES('MENU013', 'MMENU01', '서브메뉴1102', 2, 3, 'MENU005'); --실제 동작 메뉴
        
        --MENU006 -- 서브메뉴1200 하위
        INSERT INTO SUBMENUS VALUES('MENU014', 'MMENU01', '서브메뉴1201', 1, 3, 'MENU006'); --실제 동작 메뉴
        INSERT INTO SUBMENUS VALUES('MENU015', 'MMENU01', '서브메뉴1202', 2, 3, 'MENU006'); --실제 동작 메뉴
        INSERT INTO SUBMENUS VALUES('MENU016', 'MMENU01', '서브메뉴1203', 3, 3, 'MENU006'); --실제 동작 메뉴
        
        --MENU008 -- 서브메뉴3100 하위
        INSERT INTO SUBMENUS VALUES('MENU017', 'MMENU03', '서브메뉴3101', 1, 3, 'MENU008'); --실제 동작 메뉴
        
        --MENU009 -- 서브메뉴4100 하위
        INSERT INTO SUBMENUS VALUES('MENU018', 'MMENU04', '서브메뉴4110', 1, 3, 'MENU009');
        INSERT INTO SUBMENUS VALUES('MENU019', 'MMENU04', '서브메뉴4120', 2, 3, 'MENU009');
        
        --MENU010 -- 서브메뉴4200 하위
        INSERT INTO SUBMENUS VALUES('MENU020', 'MMENU04', '서브메뉴4201', 1, 3, 'MENU010'); --실제 동작 메뉴
        
        --MENU011 -- 서브메뉴4300 하위
        INSERT INTO SUBMENUS VALUES('MENU021', 'MMENU04', '서브메뉴4301', 1, 3, 'MENU011'); --실제 동작 메뉴
        INSERT INTO SUBMENUS VALUES('MENU022', 'MMENU04', '서브메뉴4302', 1, 3, 'MENU011'); --실제 동작 메뉴
        
        
--3. 서브메뉴 4단계        
            
            --MENU018 -- 서브메뉴 4110 하위
            INSERT INTO SUBMENUS VALUES('MENU023', 'MMENU04', '서브메뉴4111', 1, 4, 'MENU018'); --실제 동작 메뉴
            INSERT INTO SUBMENUS VALUES('MENU024', 'MMENU04', '서브메뉴4112', 2, 4, 'MENU018'); --실제 동작 메뉴
            
            --MENU019 -- 서브메뉴 4120 하위
            INSERT INTO SUBMENUS VALUES('MENU025', 'MMENU04', '서브메뉴4121', 1, 4, 'MENU019'); --실제 동작 메뉴
            INSERT INTO SUBMENUS VALUES('MENU026', 'MMENU04', '서브메뉴4122', 2, 4, 'MENU019'); --실제 동작 메뉴
            INSERT INTO SUBMENUS VALUES('MENU027', 'MMENU04', '서브메뉴4123', 3, 4, 'MENU019'); --실제 동작 메뉴
            
            
--COMMIT;
    