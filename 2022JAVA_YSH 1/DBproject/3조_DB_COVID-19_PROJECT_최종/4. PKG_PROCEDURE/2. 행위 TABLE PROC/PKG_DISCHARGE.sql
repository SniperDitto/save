create or replace NONEDITIONABLE PACKAGE PKG_DISCHARGE AS 

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 최문준
-- 업무설명 : DISCHARGE_TBL CRUD, 퇴원 환자 리스트  

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

-- INSERT
  PROCEDURE PROC_INS_DISCHARGE
(
    IN_DIS_IDX      IN      VARCHAR2,
    IN_DIS_ADM_ID   IN      VARCHAR2,
    IN_DIS_PER_ID   IN      VARCHAR2,
    IN_DIS_DOC_ID   IN      VARCHAR2,
    IN_DIS_DATE     IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
);

-- SELECT
  PROCEDURE PROC_SEL_DISCHARGE
(
    IN_DIS_IDX      IN      VARCHAR2,
    IN_DIS_ADM_ID   IN      VARCHAR2,
    IN_DIS_PER_ID   IN      VARCHAR2,
    IN_DIS_DOC_ID   IN      VARCHAR2,
    IN_DIS_DATE     IN      VARCHAR2,
    O_CUR           OUT     SYS_REFCURSOR,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
);

-- UPDATE
 PROCEDURE PROC_UP_DISCHARGE
(
    IN_DIS_IDX      IN      VARCHAR2,
    IN_DIS_ADM_ID   IN      VARCHAR2,
    IN_DIS_PER_ID   IN      VARCHAR2,
    IN_DIS_DOC_ID   IN      VARCHAR2,
    IN_DIS_DATE     IN      VARCHAR2,
    O_ERRCODE       OUT     VARCHAR2,
    O_ERRMSG        OUT     VARCHAR2  
);

-- DELETE
PROCEDURE PROC_DEL_DISCHARGE
    (
        IN_DIS_ADM_ID       IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

END PKG_DISCHARGE;