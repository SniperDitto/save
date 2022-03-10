CREATE OR REPLACE FUNCTION FUNC_MAKE_STUID 
(
  IN_STR_ID IN VARCHAR2 
) RETURN VARCHAR2 
AS 

    V_NEW_STU_ID            CHAR(6);

BEGIN

   SELECT 'STU' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID), 'STU000'), 4, 3)) + 1, 'FM000')
   INTO V_NEW_STU_ID
   FROM STUDENTS_TBL
   ; 

  RETURN V_NEW_STU_ID;
END FUNC_MAKE_STUID;