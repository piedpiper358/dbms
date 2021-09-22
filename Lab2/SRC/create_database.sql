SET SQLBLANKLINES ON;
CONNECT / AS SYSDBA;


--Имя БД
CREATE DATABASE drymath
	USER SYS IDENTIFIED BY sys_password
	USER SYSTEM IDENTIFIED BY system_password


	--Установка кодировки
	CHARACTER SET UTF8
	--По два лога в группе
	----субд
	--нужно чтобы в кажой "ноде" (директории nodeN) было по M логов (типа надежно)

	--может логи в разных /u01
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

	--Файлы данных табличного пространства SYSTEM:
	--SYSTEM
		DATAFILE	'/u01/ydc70/drymath/node04/uwisa84.dbf' SIZE 100M,
					'/u01/ydc70/drymath/node01/aweke11.dbf' SIZE 100M


	--Файлы данных табличного пространства SYSAUX:
	SYSAUX 
		DATAFILE	'/u01/ydc70/drymath/node04/sot18.dbf' SIZE 100M,
					'/u01/ydc70/drymath/node04/qap12.dbf' SIZE 100M


	--Файлы данных табличного пространства USERS:
	DEFAULT TABLESPACE USERS
		DATAFILE 	'/u01/ydc70/drymath/node01/ayocofa665.dbf' SIZE 100M,
					'/u01/ydc70/drymath/node04/onehika504.dbf' SIZE 100M



	UNDO TABLESPACE UNDOTBS1
		DATAFILE 	'/u01/ydc70/drymath/undotbs01.dbf'
		SIZE 200M REUSE;





	--Создание файлов данных дополнительных табличных пространств
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

/






rm '/u01/app/oracle/product/11.2.0/dbhome_1/dbs/cntrlSapozhnikovBorisP3400.dbf'
rm '/u01/ydc70/drymath/node01/logs/redo01.log'
rm '/u01/ydc70/drymath/node02/logs/redo01.log'
rm '/u01/ydc70/drymath/node03/logs/redo01.log'
rm '/u01/ydc70/drymath/node04/logs/redo01.log'
rm '/u01/ydc70/drymath/node01/logs/redo02.log'
rm '/u01/ydc70/drymath/node02/logs/redo02.log'
rm '/u01/ydc70/drymath/node03/logs/redo02.log'
rm '/u01/ydc70/drymath/node04/logs/redo02.log'
rm '/u01/ydc70/drymath/node01/logs/redo03.log'
rm '/u01/ydc70/drymath/node02/logs/redo03.log'
rm '/u01/ydc70/drymath/node03/logs/redo03.log'
rm '/u01/ydc70/drymath/node04/logs/redo03.log'


rm '/u01/ydc70/drymath/node04/uwisa84.dbf'
rm '/u01/ydc70/drymath/node01/aweke11.dbf'
rm '/u01/ydc70/drymath/node04/sot18.dbf'
rm '/u01/ydc70/drymath/node04/qap12.dbf'
rm '/u01/ydc70/drymath/node01/ayocofa665.dbf' 
rm '/u01/ydc70/drymath/node04/onehika504.dbf'
rm '/u01/ydc70/drymath/undotbs01.dbf'



rm '/u01/ydc70/drymath/node02/bestgraymath01.dbf' 
rm '/u01/ydc70/drymath/node01/bestgraymath02.dbf' 
rm '/u01/ydc70/drymath/node03/bestgraymath03.dbf' 
rm '/u01/ydc70/drymath/node01/bestgraymath04.dbf' 
rm '/u01/ydc70/drymath/node02/longbluedisk01.dbf' 
rm '/u01/ydc70/drymath/node03/longbluedisk02.dbf' 
rm '/u01/ydc70/drymath/node04/longbluedisk03.dbf' 
rm '/u01/ydc70/drymath/node02/longbluedisk04.dbf' 
rm '/u01/ydc70/drymath/node04/sickredmath01.dbf' 
rm '/u01/ydc70/drymath/node04/sickredmath02.dbf' 
rm '/u01/ydc70/drymath/node02/sickredmath03.dbf' 
rm '/u01/ydc70/drymath/node03/biggreenbird01.dbf' 
rm '/u01/ydc70/drymath/node01/biggreenbird02.dbf' 
rm '/u01/ydc70/drymath/node03/biggreenbird03.dbf' 
rm '/u01/ydc70/drymath/node01/biggreenbird04.dbf' 



DB_CREATE_FILE_DEST='/u01/app/oracle/oradata'





ORAPWD FILE=orapwd​SapozhnikovBorisP3400 ENTRIES=10 FORCE=Y [IGNORECASE={Y|N}]

--orapwd​ ​ file=orapwdShkarubaNikitaP3418​ ​ password=***​ ​ -- ​ ​ replace​ ​ ***​ ​ with​ ​ password


/u01/ydc70/drymath
db120:upwTgFwT






