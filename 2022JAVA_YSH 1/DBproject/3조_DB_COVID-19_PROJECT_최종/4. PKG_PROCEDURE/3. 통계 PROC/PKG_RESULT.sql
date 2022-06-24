CREATE OR REPLACE 
PACKAGE PKG_RESULT AS 

--1. 병원별 총 환자수를 구하시오.(*환자는 진료를 받은 사람이라고 가정함)
PROCEDURE PROC_TASK_1 
    (
        IN_HOS_ID        IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;

--2. 입원을 한번이라도 했던 사람들 중에서 몇번째 백신을 맞고 입원을 하였는지 구하시오.
PROCEDURE PROC_TASK_2
    (
        IN_PER_ID        IN      VARCHAR2
        ,IN_PER_NAME     IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;

--3. 사람 중에서 각 차수별 백신 접종률을 구하시오. (ex. 1차%, 2차%, 3차%)
PROCEDURE PROC_TASK_3
    (
        IN_INJ_CNT       IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;

--4. 백신 접종자 중 각 차수별 부작용으로 병원을 방문한 사람의 비율을 구하시오.
PROCEDURE PROC_TASK_4
    (
        IN_INJ_CNT       IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;

--5. 백신 접종자 연령대별 부작용이 일어날 확률을 구하시오.
PROCEDURE PROC_TASK_5
    (
        IN_AGE_GROUP     IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;
--6. 병원 방문자들의 연령대별 평균 의료비를 구하시오.
PROCEDURE PROC_TASK_6
    (
        IN_AGE_GROUP     IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;
--7. 병원 방문자들이 사는 지역별 평균 의료비를 구하시오.
PROCEDURE PROC_TASK_7
    (
        IN_COM_VAL       IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR 
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;
--8. 각 병원별 병원 방문자들의 의료비 총 합계를 구하시오.
PROCEDURE PROC_TASK_8
    (
        IN_HOS_ID        IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;
--9. 백신 접종자 중 병원을 한 번도 방문하지 않은 사람과 이들의 최종 접종 차수를 구하시오.
PROCEDURE PROC_TASK_9
    (
        IN_PER_ID        IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;
--10. 사람 중에서 자기가 사는 지역에서 백신을 예약하고 접종한 사람을 구하시오. 
PROCEDURE PROC_TASK_10
    (
        IN_PER_NAME      IN      VARCHAR2
        ,IN_COM_VAL      IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;
--11. 입원을 한 사람이 퇴원을 하기 위하여 지불하여야 하는 병원비를 구하시오.
PROCEDURE PROC_TASK_11    
    (   
        IN_PER_ID        IN      VARCHAR2
        ,IN_PER_NAME     IN      VARCHAR2
        ,IN_ADM_ID       IN      VARCHAR2
        ,O_CURSOR       OUT      SYS_REFCURSOR
        ,O_ERRCODE      OUT      VARCHAR2
        ,O_ERRMSG       OUT      VARCHAR2
    )
;
END PKG_RESULT;