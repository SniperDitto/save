

CREATE TABLE ADMIN_MEMBER
(
    USERID  VARCHAR2(20)    PRIMARY KEY
    ,USERNAME   VARCHAR2(30)    NOT NULL
    ,USERPASS   VARCHAR2(1000)  NOT NULL
);

INSERT INTO ADMIN_MEMBER(USERID, USERNAME, USERPASS)
VALUES('ADMIN', '최밥창문', '1234');

---------------

interceptor 로그인 처리


