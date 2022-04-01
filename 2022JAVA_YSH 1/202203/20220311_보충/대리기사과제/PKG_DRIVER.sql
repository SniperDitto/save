CREATE OR REPLACE 
PACKAGE PKG_DRIVER AS 

  --1. 대리운전의 업무를 위한 패키지를 하나 만들어주세요 패키지 이름 : PKG_DRIVER 
  
  
  
  
  
  --2. 위의 패키지에 첫번째 프로시저를 하나 만들어주세요 - 
        --새로운 대리운전 기사를 등록하는 프로시저를 만들어주세요
        --대리기사 아이디는 따로 함수로 만들지 말고 프로시저 내부에 로직을 포함시켜주세요
  PROCEDURE PROC_INS_DRIVER
  (
        IN_DR_NAME          IN          VARCHAR2,
        IN_DR_TEL            IN          VARCHAR2,
        IN_DR_GENDER        IN          VARCHAR2,
        O_ERR_CODE          OUT         VARCHAR2,
        O_ERR_MSG           OUT         VARCHAR2
  );
  
  
  
  
  --3. 위의 패키지에 두번째 프로시저를 만들어주세요
       --현재 불특정 회원의 POINT가 모두 0원입니다.
       --프로시저를 사용하여 POINT가 모두 계산 되도록 해주세요
   PROCEDURE PROC_SET_MEMBER_POINT
   (
        IN_MEMBER_TEL       IN          VARCHAR2,
        O_ERR_CODE          OUT         VARCHAR2,
        O_ERR_MSG           OUT         VARCHAR2
   );
   
   
   
   
   
   --4. 위의 패키지에 세번째 프로시저를 만들어주세요
      -- 이용자가 대리운전을 요청하는 전화를 하면
      -- 입력하는 직원은 해당 프로시저에 이용자 연락처만 입력하고 저장하면
      -- 새로운 이용자이면 DR_MEMBER_TBL에 새롭게 추가하고
      -- 이미 등록된 이용자이면 사용자 예외처리를 활용하여 에러처리를 해 주세요
      
      
  -- NO DATA FOUND 를 예외 처리로 사용할 경우
   PROCEDURE PROC_INS_MEMBER_1
   (
        IN_MEMBER_TEL       IN          VARCHAR2,
        O_ERR_CODE          OUT         VARCHAR2,
        O_ERR_MSG           OUT         VARCHAR2
   );
   
    -- USER DEFINED EXCEPTION 를 예외 처리로 사용할 경우
   PROCEDURE PROC_INS_MEMBER_2
   (
        IN_MEMBER_TEL       IN          VARCHAR2,
        O_ERR_CODE          OUT         VARCHAR2,
        O_ERR_MSG           OUT         VARCHAR2
   );
   
   
   
   
--5   위의 패키지에 네번째 프로시저를 만들어주세요
      -- 각 요일별로 대리운전 총 매출액을 계산해서 보여주는 프로시저를 만들어 주세요
      PROCEDURE PROC_SEL_PERWEEK
      (
            O_CUR           OUT     SYS_REFCURSOR,
            O_ERR_CODE          OUT         VARCHAR2,
            O_ERR_MSG           OUT         VARCHAR2
      );
   
   

END PKG_DRIVER;