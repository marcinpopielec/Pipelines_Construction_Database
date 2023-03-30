/*we create a table in which we can store information about the time we have until 
the expiry of contracts with individual employees */

CREATE TABLE employee_to_talk(
    employee_id INTEGER
  , first_name VARCHAR2(30)
  , last_name VARCHAR2(30)
  , position_name VARCHAR2(30)
  , days_to_end NUMBER
  )
  ;

--procedure that populates the table employee_to_talk, we use the MERGE statement here:

CREATE OR REPLACE PROCEDURE p_generate_emp_to_talk
IS
BEGIN
    MERGE INTO employee_to_talk ett
    USING (
           SELECT e.employee_id
                , e.first_name
                , e.last_name
                , ep.position_name
                , FLOOR(e.expire_date-sysdate) AS days_to_end
           FROM employees e 
           INNER JOIN employee_positions ep
           ON e.position_id=ep.position_id
           WHERE sysdate BETWEEN e.expire_date-ep.job_limits AND e.expire_date
           )
               source
           ON (
               ett.employee_id = source.employee_id
              )
    WHEN MATCHED THEN 
           UPDATE 
           SET days_to_end=source.days_to_end
    WHEN NOT MATCHED THEN
           INSERT (
                   employee_id
                 , first_name
                 , last_name
                 , position_name
                 , days_to_end
                 )
           VALUES (
                   source.employee_id
                 , source.first_name
                 , source.last_name
                 , source.position_name
                 , source.days_to_end
                 );
        
END p_generate_emp_to_talk;


BEGIN
    p_generate_emp_to_talk;
END;


SELECT * FROM employee_to_talk;