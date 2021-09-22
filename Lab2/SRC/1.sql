SET SQLBLANKLINES ON;
CONNECT / AS SYSDBA;


--1.


--2.

--3. 
select instance from v$thread;


--4.
--select username, password from dba_users;
select value from v$parameter where name = 'remote_login_passwordfile';

--5. 
select name from v$database;

--6.
select distinct bytes/blocks from user_segments;
--select distinct bytes/blocks from dba_segments;

--7.
--select name,display_value  from v$parameter 
--where name like 'mem%target' or name like 'pga%' 
--or name like 'sga%';
select name,display_value  from v$parameter 
where name='sga_max_size';




--8. 
SELECT value FROM nls_database_parameters where PARAMETER='NLS_CHARACTERSET';



--9.
select name from v$tablespace;


SELECT NAME FROM V$DATAFILE; 
SELECT NAME FROM V$CONTROLFILE; 
SELECT MEMBER FROM V$LOGFILE;

select FILE_NAME, tablespace_name, bytes from dba_data_files;


selct 
exit;
/