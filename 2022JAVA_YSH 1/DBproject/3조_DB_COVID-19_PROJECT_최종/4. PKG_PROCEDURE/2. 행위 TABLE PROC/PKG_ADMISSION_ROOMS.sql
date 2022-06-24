create or replace NONEDITIONABLE PACKAGE PKG_ADMISSION_ROOMS AS 

-- 최초작성일 : 2022-03-27
-- 최초작성자 : 원재경
-- 업무설명 : ADMISSION_ROOMS_TBL CRUD, 입원 환자 사용 병실 목록(log)

--수정사항--------------------------------
/*  수정일       수정자     수정내용
  20220327     유승화      INSERT 수정 및 추가
  20220327     최문준      SELECT 수정 및 추가
  20220327     정성균      UPDATE 수정 및 추가
  20220327     원재경      DELETE 수정 및 추가
*/
------------------------------------------

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