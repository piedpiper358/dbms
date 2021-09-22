SET SQLBLANKLINES ON;



--7. ������������ � ���������� � ������������ SYSDBA:
CONNECT / AS SYSDBA;


--������� ���������� ������ �� 
--SHUTDOWN;
--DROP DATABASE;

--CONNECT SYS AS SYSDBA; ��� CONN / AS SYSDBA;
--8. ������� �������� ���� ���������� ������������� ������� �� ��������� ���������� ����� ����������:
CREATE SPFILE FROM PFILE;
--9. ��������� ��������� Oracle ��� ������������ ��:
STARTUP NOMOUNT;


--��� ��
CREATE DATABASE drymath
	USER SYS IDENTIFIED BY sys_password
	USER SYSTEM IDENTIFIED BY system_password


	--��������� ���������
	CHARACTER SET UTF8
	--�� ��� ���� � ������
	----����
	--����� ����� � ����� "����" (���������� nodeN) ���� �� M ����� (���� �������)

	--����� ���� � ������ /u01
	LOGFILE GROUP 1 ('/u01/ydc70/drymath/node01/logs/redo01.log',
					 '/u01/ydc70/drymath/node02/logs/redo01.log',
					 '/u01/ydc70/drymath/node03/logs/redo01.log', 
					 '/u01/ydc70/drymath/node04/logs/redo01.log') 
					SIZE 100M,
			GROUP 2 ('/u01/ydc70/drymath/node01/logs/redo02.log',
					 '/u01/ydc70/drymath/node02/logs/redo02.log',
					 '/u01/ydc70/drymath/node03/logs/redo02.log', 
					 '/u01/ydc70/drymath/node04/logs/redo02.log') 
					SIZE 100M,
			GROUP 3 ('/u01/ydc70/drymath/node01/logs/redo03.log',
					 '/u01/ydc70/drymath/node02/logs/redo03.log',
					 '/u01/ydc70/drymath/node03/logs/redo03.log', 
					 '/u01/ydc70/drymath/node04/logs/redo03.log') 
					SIZE 100M

	--����� ������ ���������� ������������ SYSTEM:
	--SYSTEM
		DATAFILE	'/u01/ydc70/drymath/node04/uwisa84.dbf' SIZE 100M,
					'/u01/ydc70/drymath/node01/aweke11.dbf' SIZE 100M


	--����� ������ ���������� ������������ SYSAUX:
	SYSAUX 
		DATAFILE	'/u01/ydc70/drymath/node04/sot18.dbf' SIZE 100M,
					'/u01/ydc70/drymath/node04/qap12.dbf' SIZE 100M


	--����� ������ ���������� ������������ USERS:
	DEFAULT TABLESPACE USERS
		DATAFILE 	'/u01/ydc70/drymath/node01/ayocofa665.dbf' SIZE 100M,
					'/u01/ydc70/drymath/node04/onehika504.dbf' SIZE 100M


	--����� ������ ���������� ������������ UNDOTBS1:
	UNDO TABLESPACE UNDOTBS1
		DATAFILE 	'/u01/ydc70/drymath/undotbs01.dbf'
		SIZE 200M REUSE;


--ALTER DATABASE OPEN;
--ALTER DATABASE MOUNT;


	--�������� ������ ������ �������������� ��������� �����������
CREATE TABLESPACE BEST_GRAY_MATH
	DATAFILE 	'/u01/ydc70/drymath/node02/bestgraymath01.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node01/bestgraymath02.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node03/bestgraymath03.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node01/bestgraymath04.dbf' SIZE 100M;
CREATE TABLESPACE LONG_BLUE_DISK
	DATAFILE 	'/u01/ydc70/drymath/node02/longbluedisk01.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node03/longbluedisk02.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node04/longbluedisk03.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node02/longbluedisk04.dbf' SIZE 100M;
CREATE TABLESPACE SICK_RED_MATH
	DATAFILE 	'/u01/ydc70/drymath/node04/sickredmath01.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node04/sickredmath02.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node02/sickredmath03.dbf' SIZE 100M;
CREATE TABLESPACE BIG_GREEN_BIRD
	DATAFILE 	'/u01/ydc70/drymath/node03/biggreenbird01.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node01/biggreenbird02.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node03/biggreenbird03.dbf' SIZE 100M,
				'/u01/ydc70/drymath/node01/biggreenbird04.dbf' SIZE 100M;

--SET SERVEROUTPUT OFF;
SET TERMOUT OFF;
-- CREATES ALL THE DATA DICTIONARY VIEWS
@?/rdbms/admin/catalog.sql;
--CREATES SYSTEM SPECIFIED STORED PROCEDURES
@?/rdbms/admin/catproc.sql;
--GRANT AND REVOKE (PRODUCT_USER_PROFILE)
--CREATES DEFAULT ROLES AND PROFILES
@?/sqlplus/admin/pupbld.sql;
SET TERMOUT ON;
--SET SERVEROUTPUT ON;

/