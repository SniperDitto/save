--3. 메뉴
CREATE TABLE MENUS
(
    MENUID      CHAR(7)         NOT NULL PRIMARY KEY,
    MENUNAME    VARCHAR2(50)    NOT NULL,
    MENUSEQ     NUMBER(5)       NOT NULL,
    MENULVL     NUMBER(5)       NOT NULL,
    PARENTID    CHAR(7)         NOT NULL
);

--1. 주메뉴
INSERT INTO MENUS VALUES('MENU001', '주메뉴1', 1, 1, 'ROOT');
INSERT INTO MENUS VALUES('MENU002', '주메뉴2', 2, 1, 'ROOT');
INSERT INTO MENUS VALUES('MENU003', '주메뉴3', 3, 1, 'ROOT');
INSERT INTO MENUS VALUES('MENU004', '주메뉴4', 4, 1, 'ROOT');

--2. 서브메뉴 - 1단계
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
 
    
--3. 서브메뉴 3단계

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
        
        
--3. 서브메뉴 4단계        
            
            --MENU018 -- 서브메뉴 4110 하위
            INSERT INTO MENUS VALUES('MENU023', '서브메뉴4111', 1, 4, 'MENU018'); --실제 동작 메뉴
            INSERT INTO MENUS VALUES('MENU024', '서브메뉴4112', 2, 4, 'MENU018'); --실제 동작 메뉴
            
            --MENU019 -- 서브메뉴 4120 하위
            INSERT INTO MENUS VALUES('MENU025', '서브메뉴4121', 1, 4, 'MENU019'); --실제 동작 메뉴
            INSERT INTO MENUS VALUES('MENU026', '서브메뉴4122', 2, 4, 'MENU019'); --실제 동작 메뉴
            INSERT INTO MENUS VALUES('MENU027', '서브메뉴4123', 3, 4, 'MENU019'); --실제 동작 메뉴
    
    
--COMMIT;

--DELETE FROM MENUS;


SELECT 
    LPAD(' ', 2*(LEVEL-1)) || MENUNAME AS MENUNAME,
    MENUSEQ, MENULVL, MENUID
FROM MENUS
START WITH PARENTID = 'ROOT'
CONNECT BY PRIOR MENUID = PARENTID
;

    
    
    