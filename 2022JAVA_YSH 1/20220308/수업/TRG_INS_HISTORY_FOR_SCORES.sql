create or replace NONEDITIONABLE TRIGGER TRG_INS_HISTORY_FOR_SCORES 
BEFORE UPDATE OF SCORE,STU_ID,SUB_ID ON SCORES_TBL 
REFERENCING OLD AS O NEW AS N 
FOR EACH ROW
BEGIN
  
    INSERT INTO SCORES_HISTORY(STU_ID, SUB_ID, BEFORE_SCORE, UPDATE_SCORE)
    VALUES(:O.STU_ID, :O.SUB_ID, :O.SCORE, :N.SCORE);
  
END;