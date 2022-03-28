create or replace NONEDITIONABLE PACKAGE PKG_ADMISSION_ROOMS AS 

PROCEDURE PROC_INS_ADMISSION_ROOMS
    (
        IN_ADM_ID   IN VARCHAR2
        ,IN_ADM_ROOM_GRP    IN VARCHAR2
        ,IN_ADM_ROOM    IN VARCHAR2
        ,IN_ADM_ROOM_DATE   IN VARCHAR2
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );
    
    PROCEDURE PROC_SEL_ADMISSION_ROOMS
    (
        IN_ADM_ID   IN VARCHAR2
        ,O_CUR  OUT SYS_REFCURSOR
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );

    PROCEDURE PROC_UP_ADMISSION_ROOMS
    (
        IN_ADM_ID           IN      VARCHAR2,  -- 입원 ID
        IN_ADM_ROOM         IN      VARCHAR2,  -- 병실
        IN_ADM_ROOM_DATE    IN      VARCHAR2,  -- 병실 사용일
        O_ERRCODE           OUT     VARCHAR2,
        O_ERRMSG            OUT     VARCHAR2
    );
    
    PROCEDURE PROC_DEL_ADM_ROOMS
    (
        IN_ADM_ID           IN      VARCHAR2
        , O_ERRCODE         OUT     VARCHAR2
        , O_ERRMSG          OUT     VARCHAR2
    );

END PKG_ADMISSION_ROOMS;