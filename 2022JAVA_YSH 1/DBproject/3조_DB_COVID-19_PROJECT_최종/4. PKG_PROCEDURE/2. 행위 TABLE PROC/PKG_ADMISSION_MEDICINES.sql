create or replace NONEDITIONABLE PACKAGE PKG_ADMISSION_MEDICINES AS 

-- 최초작성일 2022-03-29
-- 최초작성자 김정희
-- 업무설명 ADMISSION_MEDICINES_TBL CRUD, 입원 환자 처방 약품 목록 

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  20220329      김정희     ERR 수정
  20220329      정성균     ERR 수정
*/
------------------------------------------

PROCEDURE PROC_INS_ADMISSION_MEDICINES
    (
        IN_ADM_ID           IN     VARCHAR2
        ,IN_ADM_MED_GRP     IN     VARCHAR2
        ,IN_ADM_MED         IN     VARCHAR2
        ,IN_ADM_MED_QTY     IN     VARCHAR2
        ,IN_ADM_MED_DATE    IN     VARCHAR2 
        ,O_ERRCODE          OUT     VARCHAR2
        ,O_ERRMSG           OUT     VARCHAR2 
    ) 
    ;
    
    
    
    PROCEDURE PROC_SEL_ADMISSION_MEDICINES
    (
             IN_ADM_ID           IN     VARCHAR2
            ,IN_ADM_MED_GRP      IN     VARCHAR2
            ,IN_ADM_MED          IN     VARCHAR2
            ,IN_ADM_MED_QTY      IN     VARCHAR2
            ,IN_ADM_MED_DATE     IN     VARCHAR2
            ,O_CUR              OUT     SYS_REFCURSOR
            ,O_ERRCODE           OUT     VARCHAR2
            ,O_ERRMSG            OUT     VARCHAR2
           
    )
   ;
    
    PROCEDURE PROC_UP_ADMISSION_MEDICINES
    (
        IN_ADM_ID             IN      VARCHAR2
        ,IN_ADM_MED_GRP       IN      VARCHAR2
        ,IN_ADM_MED           IN      VARCHAR2
        ,IN_ADM_MED_QTY       IN      VARCHAR2
        ,IN_ADM_MED_DATE      IN      VARCHAR2
        ,O_ERRCODE           OUT      VARCHAR2
        ,O_ERRMSG            OUT      VARCHAR2  
    )
    ;
    
    PROCEDURE PROC_DEL_ADMISSION_MEDICINES
    (
         IN_ADM_ID          IN VARCHAR2
        ,IN_ADM_MED         IN VARCHAR2
        ,IN_ADM_MED_QTY     IN VARCHAR2
        ,IN_ADM_MED_DATE    IN VARCHAR2
        ,O_ERRCODE       OUT     VARCHAR2
        ,O_ERRMSG        OUT     VARCHAR2
    )
   ;

END PKG_ADMISSION_MEDICINES;