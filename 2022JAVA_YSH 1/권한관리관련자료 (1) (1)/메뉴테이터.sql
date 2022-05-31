--3. �޴�
CREATE TABLE MENUS
(
    MENUID      CHAR(7)         NOT NULL PRIMARY KEY,
    MENUNAME    VARCHAR2(50)    NOT NULL,
    MENUSEQ     NUMBER(5)       NOT NULL,
    MENULVL     NUMBER(5)       NOT NULL,
    PARENTID    CHAR(7)         NOT NULL
);

--1. �ָ޴�
INSERT INTO MENUS VALUES('MENU001', '�ָ޴�1', 1, 1, 'ROOT');
INSERT INTO MENUS VALUES('MENU002', '�ָ޴�2', 2, 1, 'ROOT');
INSERT INTO MENUS VALUES('MENU003', '�ָ޴�3', 3, 1, 'ROOT');
INSERT INTO MENUS VALUES('MENU004', '�ָ޴�4', 4, 1, 'ROOT');

--2. ����޴� - 1�ܰ�
    --MENU001 - �ָ޴�1 ����
    INSERT INTO MENUS VALUES('MENU005', '����޴�1100', 1, 2, 'MENU001');
    INSERT INTO MENUS VALUES('MENU006', '����޴�1200', 2, 2, 'MENU001');
    
    --MENU002 - �ָ޴�2 ����
    INSERT INTO MENUS VALUES('MENU007', '����޴�2001', 1, 2, 'MENU002');  -- ���� ���� �޴�
    
    --MENU003 - �ָ޴�3 ����
    INSERT INTO MENUS VALUES('MENU008', '����޴�3100', 1, 2, 'MENU003');
    
    --MENU004 - �ָ޴�4 ����
    INSERT INTO MENUS VALUES('MENU009', '����޴�4100', 1, 2, 'MENU004');
    INSERT INTO MENUS VALUES('MENU010', '����޴�4200', 2, 2, 'MENU004');
    INSERT INTO MENUS VALUES('MENU011', '����޴�4300', 3, 2, 'MENU004');
 
    
--3. ����޴� 3�ܰ�

        --MENU005 -- ����޴�1100 ����
        INSERT INTO MENUS VALUES('MENU012', '����޴�1101', 1, 3, 'MENU005'); --���� ���� �޴�
        INSERT INTO MENUS VALUES('MENU013', '����޴�1102', 2, 3, 'MENU005'); --���� ���� �޴�
        
        --MENU006 -- ����޴�1200 ����
        INSERT INTO MENUS VALUES('MENU014', '����޴�1201', 1, 3, 'MENU006'); --���� ���� �޴�
        INSERT INTO MENUS VALUES('MENU015', '����޴�1202', 2, 3, 'MENU006'); --���� ���� �޴�
        INSERT INTO MENUS VALUES('MENU016', '����޴�1203', 3, 3, 'MENU006'); --���� ���� �޴�
        
        --MENU008 -- ����޴�3100 ����
        INSERT INTO MENUS VALUES('MENU017', '����޴�3101', 1, 3, 'MENU008'); --���� ���� �޴�
        
        --MENU009 -- ����޴�4100 ����
        INSERT INTO MENUS VALUES('MENU018', '����޴�4110', 1, 3, 'MENU009');
        INSERT INTO MENUS VALUES('MENU019', '����޴�4120', 2, 3, 'MENU009');
        
        --MENU010 -- ����޴�4200 ����
        INSERT INTO MENUS VALUES('MENU020', '����޴�4201', 1, 3, 'MENU010'); --���� ���� �޴�
        
        --MENU011 -- ����޴�4300 ����
        INSERT INTO MENUS VALUES('MENU021', '����޴�4301', 1, 3, 'MENU011'); --���� ���� �޴�
        INSERT INTO MENUS VALUES('MENU022', '����޴�4302', 1, 3, 'MENU011'); --���� ���� �޴�
        
        
--3. ����޴� 4�ܰ�        
            
            --MENU018 -- ����޴� 4110 ����
            INSERT INTO MENUS VALUES('MENU023', '����޴�4111', 1, 4, 'MENU018'); --���� ���� �޴�
            INSERT INTO MENUS VALUES('MENU024', '����޴�4112', 2, 4, 'MENU018'); --���� ���� �޴�
            
            --MENU019 -- ����޴� 4120 ����
            INSERT INTO MENUS VALUES('MENU025', '����޴�4121', 1, 4, 'MENU019'); --���� ���� �޴�
            INSERT INTO MENUS VALUES('MENU026', '����޴�4122', 2, 4, 'MENU019'); --���� ���� �޴�
            INSERT INTO MENUS VALUES('MENU027', '����޴�4123', 3, 4, 'MENU019'); --���� ���� �޴�
    
    
--COMMIT;

--DELETE FROM MENUS;


SELECT 
    LPAD(' ', 2*(LEVEL-1)) || MENUNAME AS MENUNAME,
    MENUSEQ, MENULVL, MENUID
FROM MENUS
START WITH PARENTID = 'ROOT'
CONNECT BY PRIOR MENUID = PARENTID
;

    
    
    