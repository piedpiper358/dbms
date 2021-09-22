#-1. Подключение к выделенному серверу
#Подключаться через ssh С ГЕЛИОСА (!) как ssh oracle@{имя узла по заданию}
#db120:upwTgFwT

ssh oracle@db120 




/u01/app/oracle/admin/drymath/create/

#0. Создаем дерево каталогов

cd /u01/app/oracle/product/11.2.0/dbhome_1/dbs

mkdir /u01/ydc70/
mkdir /u01/ydc70/drymath/
mkdir /u01/ydc70/drymath/node01
mkdir /u01/ydc70/drymath/node01/logs
mkdir /u01/ydc70/drymath/node02
mkdir /u01/ydc70/drymath/node02/logs
mkdir /u01/ydc70/drymath/node03
mkdir /u01/ydc70/drymath/node03/logs
mkdir /u01/ydc70/drymath/node04
mkdir /u01/ydc70/drymath/node04/logs


#3. Выбираем метод аутентификации, который будет использоваться в БД:
# ● с помощью файла паролей;
# ● на уровне пользователей ОС.
orapwd file=$ORACLE_BASE/admin/drymath/create/orapwd​SapozhnikovBorisP3400 password=upwTgFwT entries=10 force=y 



#---Cоздание----------------------------------------------

cd /u01/app/oracle/admin/drymath/create/

#password: upwTgFwT


# Задаем переменные окружения
​source before_install.sh

	#!/bin/bash
	#ORACLE_BASE
	export ORACLE_BASE=/u01/app/oracle
	#ORACLE_HOME
	export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/dbhome_1
	#ORACLE_SID
	export ORACLE_SID=SapozhnikovBorisP3400
	#NLS_LANG
	#export NLS_LANG=RUSSIAN_CIS.AL32UTF8
	export NLS_LANG=AMERICAN_CIS.AL32UTF8
	#export NLS_LANG=AMERICAN_CIS.CL8MSWIN125
	export PATH=$PATH:$ORACLE_HOME/bin









REMOTE_LOGIN_PASSWORDFILE=EXCLUSIVE



db120:upwTgFwT

#6. Запускаем SQL*Plus без подключения к БД:
sqlplus /nolog @create_db.sql;


sqlplus /nolog @drop_db.sql;

#7. Подключаемся к экземпляру с привилегиями SYSDBA:
SQL> CONNECT SYS AS SYSDBA
или
SQL> CONNECT / AS SYSDBA


#6-7
sqlplus "SYS AS SYSDBA"
sqlplus "/ AS SYSDBA" 

#​ CONN / AS SYSDBA
#8. Создаём бинарный файл параметров инициализации сервера на основании созданного ранее текстового:
SQL> CREATE SPFILE FROM PFILE;
#9. Запускаем экземпляр Oracle без монтирования БД:
SQL> STARTUP NOMOUNT;
#10. Вызываем команду CREATE DATABASE. Возможны 2 варианта вызова:
# ● Перечисляем все параметры конфигурации БД в аргументах;
# ● Все параметры конфигурации БД читаются из файла.
start create_db.sql
@create_db.sql




create table my_users ( id int, Name varchar(255));

insert into my_users values (123, 'Борис');
 
select * from my_users;



