CREATE TABLE MAINMENUS
(
    MMENUID      CHAR(7)         NOT NULL PRIMARY KEY,
    MMENUNAME    VARCHAR2(50)    NOT NULL,
    MMENUSEQ     NUMBER(5)       NOT NULL,
    MMENULVL     NUMBER(5)       NOT NULL
);

--1. �ָ޴�
INSERT INTO MAINMENUS VALUES('MMENU01', '�ָ޴�1', 1, 1);
INSERT INTO MAINMENUS VALUES('MMENU02', '�ָ޴�2', 2, 1);
INSERT INTO MAINMENUS VALUES('MMENU03', '�ָ޴�3', 3, 1);
INSERT INTO MAINMENUS VALUES('MMENU04', '�ָ޴�4', 4, 1);


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



--2. ����޴� - 1�ܰ�
    --MENU001 - �ָ޴�1 ����
    INSERT INTO SUBMENUS VALUES('MENU005', 'MMENU01', '����޴�1100', 1, 2, 'MENU001');
    INSERT INTO SUBMENUS VALUES('MENU006', 'MMENU01', '����޴�1200', 2, 2, 'MENU001');
    
    --MENU002 - �ָ޴�2 ����
    INSERT INTO SUBMENUS VALUES('MENU007', 'MMENU02', '����޴�2001', 1, 2, 'MENU002');  -- ���� ���� �޴�
    
    --MENU003 - �ָ޴�3 ����
    INSERT INTO SUBMENUS VALUES('MENU008', 'MMENU03', '����޴�3100', 1, 2, 'MENU003');
    
    --MENU004 - �ָ޴�4 ����
    INSERT INTO SUBMENUS VALUES('MENU009', 'MMENU04', '����޴�4100', 1, 2, 'MENU004');
    INSERT INTO SUBMENUS VALUES('MENU010', 'MMENU04', '����޴�4200', 2, 2, 'MENU004');
    INSERT INTO SUBMENUS VALUES('MENU011', 'MMENU04', '����޴�4300', 3, 2, 'MENU004');
 
    
--3. ����޴� 3�ܰ�

        --MENU005 -- ����޴�1100 ����
        INSERT INTO SUBMENUS VALUES('MENU012', 'MMENU01', '����޴�1101', 1, 3, 'MENU005'); --���� ���� �޴�
        INSERT INTO SUBMENUS VALUES('MENU013', 'MMENU01', '����޴�1102', 2, 3, 'MENU005'); --���� ���� �޴�
        
        --MENU006 -- ����޴�1200 ����
        INSERT INTO SUBMENUS VALUES('MENU014', 'MMENU01', '����޴�1201', 1, 3, 'MENU006'); --���� ���� �޴�
        INSERT INTO SUBMENUS VALUES('MENU015', 'MMENU01', '����޴�1202', 2, 3, 'MENU006'); --���� ���� �޴�
        INSERT INTO SUBMENUS VALUES('MENU016', 'MMENU01', '����޴�1203', 3, 3, 'MENU006'); --���� ���� �޴�
        
        --MENU008 -- ����޴�3100 ����
        INSERT INTO SUBMENUS VALUES('MENU017', 'MMENU03', '����޴�3101', 1, 3, 'MENU008'); --���� ���� �޴�
        
        --MENU009 -- ����޴�4100 ����
        INSERT INTO SUBMENUS VALUES('MENU018', 'MMENU04', '����޴�4110', 1, 3, 'MENU009');
        INSERT INTO SUBMENUS VALUES('MENU019', 'MMENU04', '����޴�4120', 2, 3, 'MENU009');
        
        --MENU010 -- ����޴�4200 ����
        INSERT INTO SUBMENUS VALUES('MENU020', 'MMENU04', '����޴�4201', 1, 3, 'MENU010'); --���� ���� �޴�
        
        --MENU011 -- ����޴�4300 ����
        INSERT INTO SUBMENUS VALUES('MENU021', 'MMENU04', '����޴�4301', 1, 3, 'MENU011'); --���� ���� �޴�
        INSERT INTO SUBMENUS VALUES('MENU022', 'MMENU04', '����޴�4302', 1, 3, 'MENU011'); --���� ���� �޴�
        
        
--3. ����޴� 4�ܰ�        
            
            --MENU018 -- ����޴� 4110 ����
            INSERT INTO SUBMENUS VALUES('MENU023', 'MMENU04', '����޴�4111', 1, 4, 'MENU018'); --���� ���� �޴�
            INSERT INTO SUBMENUS VALUES('MENU024', 'MMENU04', '����޴�4112', 2, 4, 'MENU018'); --���� ���� �޴�
            
            --MENU019 -- ����޴� 4120 ����
            INSERT INTO SUBMENUS VALUES('MENU025', 'MMENU04', '����޴�4121', 1, 4, 'MENU019'); --���� ���� �޴�
            INSERT INTO SUBMENUS VALUES('MENU026', 'MMENU04', '����޴�4122', 2, 4, 'MENU019'); --���� ���� �޴�
            INSERT INTO SUBMENUS VALUES('MENU027', 'MMENU04', '����޴�4123', 3, 4, 'MENU019'); --���� ���� �޴�
            
            
--COMMIT;
    