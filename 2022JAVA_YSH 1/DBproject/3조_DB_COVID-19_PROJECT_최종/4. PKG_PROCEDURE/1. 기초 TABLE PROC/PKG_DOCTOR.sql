create or replace NONEDITIONABLE PACKAGE PKG_DOCTOR AS 

-- 최초작성일 : 2022-03-25
-- 최초작성자 : 김정희
-- 업무설명 : DOCTOR_TBL CRUD

--수정사항--------------------------------
/*  수정일       수정자     수정내용
    
*/
------------------------------------------

-- CRUD(입력,조회,수정,삭제)
-- C -- INSERT
PROCEDURE PROC_INS_DOCTOR
(
    IN_DOC_NAME     IN      VARCHAR2,
    IN_DOC_GENDER   IN      VARCHAR2,
    IN_HOS_ID       IN      VARCHAR2,
    IN_DOC_DEPT_GRP IN      VARCHAR2,
    IN_DOC_DEPT     IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
)
;

-- R -- SELECT
PROCEDURE PROC_SEL_DOCTOR
(
    IN_DOC_ID     IN    VARCHAR2,
    O_CUR         OUT   SYS_REFCURSOR
)
;

-- U -- UPDATE
PROCEDURE PROC_UP_DOCTOR
(
    IN_DOC_ID       IN      VARCHAR2,
    IN_DOC_NAME     IN      VARCHAR2,
    IN_DOC_GENDER   IN      VARCHAR2,
    IN_HOS_ID       IN      VARCHAR2,
    IN_DOC_DEPT_GRP IN      VARCHAR2,
    IN_DOC_DEPT     IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2
)
;

-- D -- DELETE
PROCEDURE PROC_DEL_DOCTOR
(
    
    IN_DOC_ID       IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2
)
;

END PKG_DOCTOR;