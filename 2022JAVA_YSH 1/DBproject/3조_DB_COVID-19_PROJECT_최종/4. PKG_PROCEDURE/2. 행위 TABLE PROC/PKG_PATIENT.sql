create or replace NONEDITIONABLE PACKAGE PKG_PATIENT AS 

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 유승화
-- 업무설명 : PATIENT_TBL CRUD, 병원 방문자 리스트(접종 후 이상증상자의 병원 방문 목록)  

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  
*/
------------------------------------------

--INSERT
    PROCEDURE PROC_INS_PATIENT
    (
        IN_PER_ID   IN VARCHAR2
        ,IN_PAT_SYMP_GRP    IN VARCHAR2
        ,IN_PAT_SYMP        IN VARCHAR2
        ,IN_PAT_IN_DATE     IN VARCHAR2
        ,IN_HOS_ID          IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--SELECT
    PROCEDURE PROC_SEL_PATIENT
    (
        IN_PAT_ID   IN VARCHAR2
        ,IN_PER_ID  IN VARCHAR2
        ,O_CUR  OUT SYS_REFCURSOR
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--UPDATE
    PROCEDURE PROC_UP_PATIENT
    (
        IN_PAT_ID   IN VARCHAR2
        ,IN_PER_ID  IN VARCHAR2
        ,IN_PAT_SYMP_GRP    IN VARCHAR2
        ,IN_PAT_SYMP    IN VARCHAR2
        ,IN_PAT_IN_DATE     IN VARCHAR2
        ,IN_HOS_ID      IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

--DELETE
    PROCEDURE PROC_DEL_PATIENT
    (
        IN_PAT_ID   IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

END PKG_PATIENT;