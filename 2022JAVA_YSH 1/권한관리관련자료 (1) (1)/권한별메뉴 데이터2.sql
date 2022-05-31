--권한별 메뉴 데이터 2
SELECT LPAD(' ', 2*(LEVEL-1)) || MENUID AS MENUID --레벨별 들여쓰기
,MENUNAME, MENUSEQ, MENULVL, PARENTID
FROM MENUS
START WITH PARENTID = 'ROOT'
CONNECT BY PRIOR MENUID = PARENTID
;

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
    
    CONSTRAINT AUTH_MENUS_PK PRIMARY KEY (AMID, AUTHID, MENUID)
);

/*********************************************************************************************************/
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

--COMMIT;