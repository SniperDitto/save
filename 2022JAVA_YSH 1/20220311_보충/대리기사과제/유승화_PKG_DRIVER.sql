create or replace NONEDITIONABLE PACKAGE PKG_DRIVER AS 

    --��������߰�
    PROCEDURE PROC_INS_DRIVER
    (
        IN_DR_NAME  IN  VARCHAR2
        ,IN_DR_TEL  IN  VARCHAR2
        ,IN_DR_GENDER   IN  VARCHAR2
    );
    
    --����Ʈ���
    PROCEDURE PROC_UP_POINTS
    (
        IN_R_TEL   IN  VARCHAR2
        ,IN_R_ID    IN  VARCHAR2
        --����
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );
    
    --ȸ����ȣ�߰�
    PROCEDURE PROC_INS_MEMBER
    (
        IN_R_TEL    IN  VARCHAR2
        --����
        ,O_ERRCODE      OUT VARCHAR2
        ,O_ERRMSG       OUT VARCHAR2
    );
    
    --���Ϻ�����
    PROCEDURE PROC_SEL_DAY_SALES
    (
        O_CUR   OUT SYS_REFCURSOR
    );
    
    --ȸ��/��� �� ��
    PROCEDURE PROC_SEL_MONEY
    (
        O_CUR   OUT SYS_REFCURSOR
    );

END PKG_DRIVER;