PROCEDURE PROC_INS_TREAT
    (
        IN_PAT_ID           IN      VARCHAR2
        , IN_PER_ID         IN      VARCHAR2
        , IN_DOC_ID         IN      VARCHAR2
        , IN_TRE_PAY        IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    );
    
    PROCEDURE PROC_SEL_TREAT
    (
         IN_TRE_ID           IN      VARCHAR2
        , IN_PAT_ID         IN      VARCHAR2
        , IN_PER_ID         IN      VARCHAR2
        , IN_DOC_ID         IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
        , O_CURSOR          OUT     SYS_REFCURSOR 
    );
    
    PROCEDURE PROC_UP_TREAT
    (
        IN_TRE_ID           IN      VARCHAR2
        , IN_PAT_ID         IN      VARCHAR2
        , IN_PER_ID         IN      VARCHAR2
        , IN_DOC_ID         IN      VARCHAR2
        , IN_TRE_DATE       IN      VARCHAR2
        , IN_TRE_PAY        IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    );
    
    PROCEDURE PROC_DEL_TREAT
    (
        IN_TRE_ID           IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    );