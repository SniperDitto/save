CREATE USER BOARDS IDENTIFIED BY Test12345678;
SELECT * FROM DBA_USERS WHERE USERNAME = 'BOARDS';

GRANT CREATE TABLE, CREATE VIEW TO BOARDS;
GRANT CONNECT,DBA TO BOARDS;
GRANT CONNECT,RESOURCE TO BOARDS;
--COMMIT;

show user;

GRANT CREATE SESSION TO BOARDS;
ALTER USER BOARDS DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON BOARDS;
GRANT CREATE ANY TABLE TO BOARDS;