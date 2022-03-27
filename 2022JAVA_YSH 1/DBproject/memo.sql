SELECT T2.RES_ID, T1.PER_ID
FROM RESERVATION_TBL T1, INJECTION_TBL T2
WHERE T1.RES_ID=T2.RES_ID;


SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')-TO_CHAR(TO_DATE('19950929','YYYYMMDD'),'YYYYMMDDHH24MISS')
FROM DUAL;



    --병원별 ADM_ID
            --방문환자+진료+입원+병실
            --병원별 사용병상
            SELECT T1.HOS_ID, T4.ADM_ROOM_DATE
            FROM PATIENT_TBL T1, TREAT_TBL T2, ADMISSION_TBL T3, ADMISSION_ROOMS_TBL T4
            WHERE T1.PAT_ID=T2.PAT_ID 
                AND T2.TRE_ID=T3.TRE_ID
                AND T3.ADM_ID=T4.ADM_ID
                ;
            --방문환자+진료+입원+병실+퇴원
            --병원별 비워지는병상
            SELECT T1.HOS_ID, T4.ADM_ROOM_DATE
            FROM PATIENT_TBL T1, TREAT_TBL T2, ADMISSION_TBL T3, ADMISSION_ROOMS_TBL T4, DISCHARGE_TBL T5
            WHERE T1.PAT_ID=T2.PAT_ID
                AND T2.TRE_ID=T3.TRE_ID
                AND T3.ADM_ID=T4.ADM_ID
                AND T3.ADM_ID=T5.ADM_ID
                ;
            
            --COM_ID에 인원수별로 체크까지 해야 하는데 거기까지는 불가능할 듯
                