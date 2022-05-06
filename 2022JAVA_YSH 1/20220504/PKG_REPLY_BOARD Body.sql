create or replace NONEDITIONABLE PACKAGE BODY PKG_REPLY_BOARD AS

  PROCEDURE PROC_INS_BOARDS
    (
        IN_IDX      IN  VARCHAR2,
        IN_TITLE    IN  VARCHAR2,
        IN_CONTENT  IN  VARCHAR2,
        IN_USERID   IN  VARCHAR2,
        IN_REGNUM   IN  VARCHAR2,
        IN_LVL      IN  VARCHAR2,
        IN_COMBINE  IN  VARCHAR2,
        IN_LMENUID  IN  VARCHAR2,
        IN_ORD      IN  VARCHAR2
    ) AS
        V_NEW_IDX   INT;
        V_NEW_LVL   INT;
        V_NEW_COMBINE   INT;
        V_NEW_REGNUM    INT;
        V_NEW_ORDER     INT;
        V_NEW_DELNUM    INT;
        V_CHK_ORDER     INT;

  BEGIN
    
    IF IN_IDX='null' THEN
    --새글쓰기(LVL:1, ORD:1)
        --IDX만들기
        SELECT TO_NUMBER(NVL(MAX(IDX),0))+1
        INTO V_NEW_IDX
        FROM BOARDS
        ;
        --LVL만들기
        V_NEW_LVL := 1;
        --COMBINE만들기
        SELECT TO_NUMBER(NVL(MAX(COMBINE),0))+1
        INTO V_NEW_COMBINE
        FROM BOARDS
        ;
        --REGNUM(나중에 삭제 시 수정되는것까지 처리)
        V_NEW_REGNUM := V_NEW_IDX;
        --ORDER만들기
        V_NEW_ORDER := 1;
        --DELNUM만들기
        V_NEW_DELNUM := 0;
    ELSE
    --답글쓰기
        --IDX만들기
        SELECT TO_NUMBER(NVL(MAX(IDX),0))+1
        INTO V_NEW_IDX
        FROM BOARDS
        ;
        --LVL만들기
        V_NEW_LVL := IN_LVL+1;
        --COMBINE만들기
        V_NEW_COMBINE := IN_COMBINE;
        --REGNUM(나중에 삭제 시 수정되는것까지 처리예정)
        V_NEW_REGNUM := V_NEW_IDX;
        --ORDER만들기
        V_NEW_ORDER := IN_ORD + 1;
                
        UPDATE BOARDS
        SET ORD=ORD+1
        WHERE COMBINE=IN_COMBINE
            AND ORD>=V_NEW_ORDER
        ;

        --DELNUM만들기
        V_NEW_DELNUM := 0;
    END IF;

    INSERT INTO BOARDS(IDX, TITLE, CONTENT, USERID, REGNUM, LVL, COMBINE, VISITED, REGDATE, LMENUID, ORD, DELNUM)
    VALUES(V_NEW_IDX, IN_TITLE, IN_CONTENT, IN_USERID, V_NEW_REGNUM, V_NEW_LVL, V_NEW_COMBINE, 0, SYSDATE, IN_LMENUID, V_NEW_ORDER, V_NEW_DELNUM)
    ;

    
  END PROC_INS_BOARDS;
  
  
  
  

  PROCEDURE PROC_SEL_BOARDS
    (
        IN_IDX  IN  VARCHAR2,
        O_CUR   OUT SYS_REFCURSOR
    ) AS
  BEGIN
    
    OPEN O_CUR FOR
    SELECT IDX, TITLE, CONTENT, USERID, REGNUM, LVL, COMBINE, VISITED, REGDATE, LMENUID, ORD, DELNUM
    FROM BOARDS
    ORDER BY COMBINE ASC, ORD ASC
    ;
    
    
    NULL;
  END PROC_SEL_BOARDS;

END PKG_REPLY_BOARD;