create or replace PROCEDURE disable_not_null_constraint(schema_name VARCHAR) IS
  not_null_number NUMBER DEFAULT 0;
  c_name VARCHAR(32);
  c_constraint VARCHAR(32);
  c_sql VARCHAR(100);
  search_cond VARCHAR(50);

  cursor not_null_constraints IS
    SELECT table_name, constraint_name, search_condition
      FROM all_constraints
        WHERE owner=upper(schema_name) and
              constraint_type='C' and 
              status = 'ENABLED';
  BEGIN 

SET SERVEROUTPUT ON;
    open not_null_constraints;

    LOOP
      BEGIN
        fetch not_null_constraints
          into c_name, c_constraint, search_cond;


        exit when not_null_constraints%NOTFOUND;
		exit when UPPER(search_cond) NOT LIKE '%IS NOT NULL%';
        c_sql := 'alter table '||c_name||' disable constraint '||c_constraint;

        EXECUTE IMMEDIATE c_sql;
		
	not_null_number := not_null_number + 1;

        EXCEPTION
        when OTHERS THEN
	  NULL;
      END;
    END LOOP;

    close not_null_constraints;
    DBMS_OUTPUT.put_line('Schema name: '||schema_name);
    DBMS_OUTPUT.put_line('NOT NULL constraints: '||not_null_number);

  END disable_not_null_constraint;
  /

