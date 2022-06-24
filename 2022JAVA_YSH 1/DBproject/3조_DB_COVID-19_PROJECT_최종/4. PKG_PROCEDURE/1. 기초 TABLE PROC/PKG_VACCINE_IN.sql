create or replace NONEDITIONABLE PACKAGE PKG_VACCINE_IN AS

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 김정희
-- 업무설명 : VACCINE_IN_TBL CRUD, 백신 입고 

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    
*/
------------------------------------------

-------------------------------------------------------------------------------------
  PROCEDURE PROC_INS_VACCINE_IN
(
    IN_HOS_ID       IN      VARCHAR2,
    IN_VAC_ID       IN      VARCHAR2,
    IN_VAC_QTY      IN      VARCHAR2,
    IN_VAC_IN_DATE   IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
);
-------------------------------------------------------------------------------------
  PROCEDURE PROC_SEL_VACCINE_IN
(
    IN_HOS_ID      IN    VARCHAR2,
    O_CUR         OUT   SYS_REFCURSOR,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2 
);
  
-------------------------------------------------------------------------------------
  PROCEDURE PROC_UP_VACCINE_IN
(
    IN_HOS_ID       IN      VARCHAR2,
    IN_VAC_ID       IN      VARCHAR2,
    IN_VAC_QTY      IN      VARCHAR2,
    IN_VAC_IN_DATE  IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
);
-------------------------------------------------------------------------------------
  PROCEDURE PROC_DEL_VACCINE_IN
(
    
    IN_HOS_ID      IN    VARCHAR2,
    IN_VAC_ID      IN    VARCHAR2,
    IN_VAC_IN_DATE IN    VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2
);




END PKG_VACCINE_IN;