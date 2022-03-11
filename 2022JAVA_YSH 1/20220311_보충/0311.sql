
--0311
--프로시져를 기반으로 한 예외처리

--새 상품 입고
INSERT INTO PRODUCTS(PID, PNAME, PPRICE) VALUES('P00006','젤리',700);

--매번 상품을 입고할 때마다 INSERT문을 작성한다?
--실제 현장의 테이블은 매우 복잡



--2022/01/07 슈퍼 개점
--고객이 물건 구입
INSERT INTO SALES(CID, PID, SPRICE, SQTY, SDATE) 
VALUES(IN_CID, IN_PID, IN_SPRICE, IN_QTY, TO_DATE(IN_SDATE,'YYYY-MM-DD'));
--회원이 아닌 고객이 물건 구입
--상품 테이블에 아직 등록되지 않은 물건 구입




