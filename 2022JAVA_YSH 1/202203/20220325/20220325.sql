
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM301','진료과','root',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM302','내과','COM301',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM303','외과','COM301',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM304','신경과','COM301',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM305','피부과','COM301',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM306','흉부외과','COM301',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM307','이비인후과','COM301',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM308','산부인과','COM301',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM309','비뇨기과','COM301',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP004','COM310','졍형외과','COM301',NULL, NULL, NULL);

INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM401','약','root',NULL, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM402','타이레놀','COM401',2500, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM403','게보린','COM401',3300, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM404','펜잘','COM401',2700, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM405','베아제','COM401',2900, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM406','훼스탈','COM401',2750, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM407','판피린','COM401',3000, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM408','판콜에이','COM401',2550, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM409','화이투벤','COM401',3100, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM410','지르텍','COM401',4800, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM411','테라플루','COM401',7000, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM412','렘데시비르','COM401',100000, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM413','팍스로비드','COM401',90000, NULL, NULL);
INSERT INTO COMMONS_TBL(GRP_ID, COM_ID, COM_VAL, PARENT_ID, EXP_VAL1, EXP_VAL2, EXP_VAL3) VALUES('GRP005','COM414','라제브리오','COM401',95000, NULL, NULL);







기장군, 금정구, 동래구, 북구, 강서구, 해운대구, 연제구, 사상구,
INSERT INTO HOSPITAL_TBL(HOS_ID, HOS_NAME, HOS_ADDR_GRP, HOS_ADDR, HOS_ROOM_QTY, HOS_OPEN_DATE) VALUES('HOS001', '기장병원', 'GRP001', 'COM002', 120, TO_DATE('1980-05-01','YYYY-MM-DD'));
INSERT INTO HOSPITAL_TBL(HOS_ID, HOS_NAME, HOS_ADDR_GRP, HOS_ADDR, HOS_ROOM_QTY, HOS_OPEN_DATE) VALUES('HOS002', '금정병원', 'GRP001', 'COM003', 110, TO_DATE('1985-07-01','YYYY-MM-DD'));
INSERT INTO HOSPITAL_TBL(HOS_ID, HOS_NAME, HOS_ADDR_GRP, HOS_ADDR, HOS_ROOM_QTY, HOS_OPEN_DATE) VALUES('HOS003', '동래병원', 'GRP001', 'COM004', 150, TO_DATE('1991-01-01','YYYY-MM-DD'));
INSERT INTO HOSPITAL_TBL(HOS_ID, HOS_NAME, HOS_ADDR_GRP, HOS_ADDR, HOS_ROOM_QTY, HOS_OPEN_DATE) VALUES('HOS004', '북구병원', 'GRP001', 'COM005', 70, TO_DATE('1996-09-01','YYYY-MM-DD'));
INSERT INTO HOSPITAL_TBL(HOS_ID, HOS_NAME, HOS_ADDR_GRP, HOS_ADDR, HOS_ROOM_QTY, HOS_OPEN_DATE) VALUES('HOS005', '강서병원', 'GRP001', 'COM006', 70, TO_DATE('1997-12-01','YYYY-MM-DD'));
INSERT INTO HOSPITAL_TBL(HOS_ID, HOS_NAME, HOS_ADDR_GRP, HOS_ADDR, HOS_ROOM_QTY, HOS_OPEN_DATE) VALUES('HOS006', '해운대병원', 'GRP001', 'COM007', 170, TO_DATE('1998-03-01','YYYY-MM-DD'));
INSERT INTO HOSPITAL_TBL(HOS_ID, HOS_NAME, HOS_ADDR_GRP, HOS_ADDR, HOS_ROOM_QTY, HOS_OPEN_DATE) VALUES('HOS007', '연제병원', 'GRP001', 'COM008', 110, TO_DATE('1999-08-01','YYYY-MM-DD'));
INSERT INTO HOSPITAL_TBL(HOS_ID, HOS_NAME, HOS_ADDR_GRP, HOS_ADDR, HOS_ROOM_QTY, HOS_OPEN_DATE) VALUES('HOS008', '사상병원', 'GRP001', 'COM009', 90, TO_DATE('2002-02-01','YYYY-MM-DD'));


--------------------------------------

동구, 서구, 중구, 영도구, 사하구
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS012','VAC001',3, TO_DATE('2022-03-01 08:20:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS012','VAC002',2, TO_DATE('2022-03-01 08:30:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS012','VAC003',5, TO_DATE('2022-03-01 08:20:30','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS013','VAC001',7, TO_DATE('2022-03-01 08:10:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS013','VAC002',5, TO_DATE('2022-03-01 08:23:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS013','VAC004',1, TO_DATE('2022-03-01 08:26:30','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS014','VAC001',6, TO_DATE('2022-03-01 08:43:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS014','VAC002',1, TO_DATE('2022-03-01 08:47:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS014','VAC003',4, TO_DATE('2022-03-01 08:57:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS014','VAC005',1, TO_DATE('2022-03-01 08:24:30','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS015','VAC001',4, TO_DATE('2022-03-01 08:24:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS015','VAC002',5, TO_DATE('2022-03-01 08:25:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS015','VAC004',2, TO_DATE('2022-03-01 08:14:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS015','VAC005',1, TO_DATE('2022-03-01 08:23:30','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS016','VAC001',2, TO_DATE('2022-03-01 08:13:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS016','VAC002',4, TO_DATE('2022-03-01 08:43:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO VACCINE_IN_TBL(IDX, HOS_ID, VAC_ID, VAC_QTY, VAC_IN_DATE) VALUES(0,'HOS016','VAC003',5, TO_DATE('2022-03-01 08:00:30','YYYY-MM-DD HH24:MI:SS'));

---------------------------------------------

