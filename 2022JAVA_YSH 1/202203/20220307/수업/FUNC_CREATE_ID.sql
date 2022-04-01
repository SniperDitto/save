CREATE OR REPLACE FUNCTION FUNC_CREATE_ID 
(
  IN_HEAD_ID        IN VARCHAR2 
, IN_FIELD_NAME     IN VARCHAR2 
, IN_BASIC_VAL      IN VARCHAR2 
, IN_BEGIN_NUM      IN VARCHAR2 
, IN_END_NUM        IN VARCHAR2 
, IN_CHAR_VAL       IN VARCHAR2 
, IN_TBL_NAME       IN VARCHAR2
) RETURN VARCHAR2 
AS
    V_RESULT            VARCHAR2(15);
    V_SQL               VARCHAR2(1000);

BEGIN

    /*
  SELECT 'STU' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID), 'STU000'), 4, 3)) + 1, 'FM000')
  FROM STUDENTS_TBL
  ;
  */
  
    V_SQL := 'SELECT ''' || IN_HEAD_ID || '''';
    V_SQL := V_SQL || '|| TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(';
    V_SQL := V_SQL || IN_FIELD_NAME || '), ';
    V_SQL := V_SQL || '''' || IN_BASIC_VAL  || '''), ';
    V_SQL := V_SQL || IN_BEGIN_NUM  || ', ';
    V_SQL := V_SQL || IN_END_NUM    || ')) + 1, ';
    V_SQL := V_SQL || '''' || IN_CHAR_VAL   || ''') ';
    V_SQL := V_SQL || 'FROM ' || IN_TBL_NAME;
    
    IF IN_TBL_NAME = 'COMMONS_TBL' THEN
        V_SQL := V_SQL || ' WHERE GRP_ID=''GRP001''';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(V_SQL);
    
  RETURN V_RESULT;

  
END FUNC_CREATE_ID;