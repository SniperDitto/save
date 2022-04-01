DECLARE

    IN_GRP_ID   VARCHAR2(6);
    IN_COM_ID   VARCHAR2(7);
    IN_COM_VAL  VARCHAR2(30);
    IN_COM_LVL  NUMBER(5);
    IN_PARENT_ID    VARCHAR2(7);
    --------------
    V_CNT   NUMBER(4);
    V_NEW_PARENT_ID CHAR(7);
    V_NEW_COM_ID    CHAR(7);

BEGIN
    --입력받는 값 가정
    IN_GRP_ID:='';
    IN_COM_ID:='GRP003';
    IN_COM_VAL:='총장실';
    IN_COM_LVL:=1;
    IN_PARENT_ID:='';
    ------------------

    --COMMONS_TBL
    --조직도를 추가
    
    --ROOT 없음
    --GRP_ID 없음
    
    --새로운 GRP_ID를 입력하게 되면 새로운 ROOT도 필요하다
    --들어오는 데이터의 GRP_ID가 새로운 값인지 아닌지 어떻게 아는가
        --COUNT(*)로 갯수를 세서 0이면 새로운 값이다
    

    
    SELECT COUNT(*)
    INTO V_CNT
    FROM COMMONS_TBL
    WHERE GRP_ID=:IN_GRP_ID
    ;
    
    IF V_CNT=0 THEN
        --새로운 GRP_ID인 경우
        --새로운 ROOT 생성
            --새 COM_ID를 만들기
            SELECT 'COM'||TO_CHAR(NVL(TO_NUMBER(SUBSTR(MAX(COM_ID),4,1)),-1)+1)||'000'
            INTO V_NEW_PARENT_ID
            FROM COMMONS_TBL
            WHERE PARENT_ID='ROOT'
            ;
            --새 COM_ID와 새 PARENT_ID('ROOT')로 ROOT를 만들어준다
            INSERT INTO COMMONS_TBL(COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID)
            VALUES(V_NEW_PARENT_ID,IN_GRP_ID,'ROOT',0,'ROOT')
            ;
            
        
        --두 개의 INSERT 사이에 오류가 생기면 먼저 실행된 INSERT도 ROLLBACK 필요
            --ALL OR NOTHING : TRANSACTION
            --예외 처리 필요
            --PROCEDURE 중 한 부분이라도 오류 생기면 전체 롤백
            
            
        --다음 COM_ID 만들기
        SELECT 'GRP'||TO_CHAR(NVL(TO_NUMBER(SUBSTR(MAX(COM_ID),4,4)),0)+1,'FM0000')
        INTO V_NEW_COM_ID
        FROM COMMONS_TBL
        WHERE GRP_ID=IN_GRP_ID
            AND PARENT_ID!='ROOT'
        ;
            
        --만든 COM_ID와 함께 입력된 값을 INSERT한다
        INSERT INTO COMMONS_TBL(COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID)
        VALUES(V_NEW_COM_ID,IN_GRP_ID,IN_COM_VAL,IN_COM_LVL,V_NEW_PARENT_ID)
        ;
        
    ELSE
        --이미 존재하는 GRP_ID인 경우(ROOT 생성할 필요 없음)
        --다음 COM_ID 만들기
            SELECT 'GRP'||TO_CHAR(NVL(TO_NUMBER(SUBSTR(MAX(COM_ID),4,4)),0)+1,'FM0000')
            INTO V_NEW_COM_ID
            FROM COMMONS_TBL
            WHERE GRP_ID=IN_GRP_ID
                AND PARENT_ID!='ROOT'
            ;
            
        --만든 COM_ID와 함께 입력된 값을 INSERT한다
        INSERT INTO COMMONS_TBL(COM_ID, GRP_ID, COM_VAL, COM_LVL, PARENT_ID)
        VALUES(V_NEW_COM_ID,IN_GRP_ID,IN_COM_VAL,IN_COM_LVL,V_NEW_PARENT_ID)
        ;
    END IF;
    
    
    
    
    
    
    

END;











