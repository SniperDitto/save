create or replace NONEDITIONABLE PACKAGE PKG_ADMISSION_MEDICINES AS 

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