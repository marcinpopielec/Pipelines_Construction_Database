/* 
    File contains the package for manipulation of employee's work hours in the table work_hours.

    file ver.: 1.0 
    author: Marcin Popielec
    contact: marcin.popielec@gmail.com

*/


CREATE OR REPLACE PACKAGE work_hours_manipulation_pkg
IS 
 --Function returns the type of day: WEEKDAY, SATURDAY, HOLIDAY depending on given date:
    FUNCTION f_get_type_of_day  (v_date DATE) RETURN VARCHAR2;
    
 --The procedure populates the work_hours table with the default working hours (monday - friday, 7:00-17:00) 
 --for all employees based on the start day and end day:
    PROCEDURE p_fill_work_hours (in_date_start IN DATE
                               , in_date_end IN DATE
                                );
                               
 --Procedure adds default working hours (7:00 - 17:00) depending on the date for all employees in work_hours table:
    PROCEDURE p_add_work_hours  (in_work_date IN DATE);
    
 --Procedure inserts or changes the working hours of a given employee depending on the given date:
    PROCEDURE p_add_emp_hours   (in_emp_id IN work_hours.employee_id%TYPE 
                               , in_work_date IN DATE 
                               , in_start_work VARCHAR2
                               , in_end_work VARCHAR2
                                );
                            
 --Procedure deletes the working day of a given employee depending on the given date:
    PROCEDURE p_delete_workday  (in_emp_id IN work_hours.employee_id%TYPE 
                               , in_vacation_day IN DATE 
                                );
   
END work_hours_manipulation_pkg;
/


CREATE OR REPLACE PACKAGE BODY work_hours_manipulation_pkg
IS

FUNCTION f_get_type_of_day (v_date DATE) RETURN VARCHAR2
IS
    v_type_day VARCHAR2(10);
BEGIN  
    CASE 
    --Moveable feasts in Poland for the years 2022, 2023, 2024:
        WHEN TO_NUMBER(TO_CHAR(v_date, 'YYYY')) =2022 
            AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=4  
            AND TO_NUMBER(TO_CHAR(v_date, 'DD')) =18  THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'YYYY')) =2023 
            AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=4  
            AND (TO_NUMBER(TO_CHAR(v_date, 'DD'))) =10  THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'YYYY')) =2024 
            AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=4  
            AND (TO_NUMBER(TO_CHAR(v_date, 'DD'))) =1  THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'YYYY')) =2022 
            AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=6  
            AND (TO_NUMBER(TO_CHAR(v_date, 'DD'))) =16  THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'YYYY')) =2023 
            AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=6  
            AND (TO_NUMBER(TO_CHAR(v_date, 'DD'))) =8  THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'YYYY')) =2024 
            AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=5  
            AND (TO_NUMBER(TO_CHAR(v_date, 'DD'))) =30  THEN
            v_type_day := 'HOLIDAY';
             --Holidays:
        WHEN TO_NUMBER(TO_CHAR(v_date, 'DD')) =1 AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=1 THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'DD')) =6 AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=1 THEN
            v_type_day := 'HOLIDAY'; 
        WHEN TO_NUMBER(TO_CHAR(v_date, 'DD')) =1 AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=5 THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'DD')) =3 AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=5 THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'DD')) =15 AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=8 THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'DD')) =1 AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=11 THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'DD')) =11 AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=11 THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'DD')) =25 AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=12 THEN
            v_type_day := 'HOLIDAY';
        WHEN TO_NUMBER(TO_CHAR(v_date, 'DD')) =26 AND TO_NUMBER(TO_CHAR(v_date, 'MM'))=12 THEN
            v_type_day := 'HOLIDAY'; 
             --Sundays:
        WHEN TO_NUMBER(TO_CHAR(v_date, 'D')) =7 THEN
            v_type_day := 'HOLIDAY';
             --Saturdays:
        WHEN TO_NUMBER(TO_CHAR(v_date, 'D')) =6 THEN
            v_type_day := 'SATURDAY';
        ELSE  v_type_day := 'WEEKDAY';
        
        END CASE;
    
    RETURN v_type_day;
    
END f_get_type_of_day;


PROCEDURE p_fill_work_hours (in_date_start IN DATE
                           , in_date_end IN DATE)
IS
    v_date DATE := in_date_start;
BEGIN
    LOOP
        p_add_work_hours(v_date);
        v_date := v_date+1;
    EXIT WHEN v_date=in_date_end+1;
    END LOOP;
END;


PROCEDURE p_add_work_hours (in_work_date IN DATE)
IS
    v_emp_id employees.employee_id%TYPE;
    CURSOR cur_employees 
    IS
    SELECT employee_id
    FROM employees;
BEGIN
    IF f_get_type_of_day(in_work_date) != 'WEEKDAY' THEN NULL;
    ELSE
        OPEN cur_employees;
        LOOP
            FETCH cur_employees INTO v_emp_id;
            EXIT WHEN cur_employees%NOTFOUND;
            INSERT INTO work_hours (employee_id
                                  , work_date
                                  , start_work_hour
                                  , end_work_hour
                                  , type_of_weekday
                                   )
            VALUES (v_emp_id
                  , in_work_date
                  , TO_DATE(in_work_date||' 07:00:00','YYYY/MM/DD HH24:MI:SS')
                  , TO_DATE(in_work_date|| ' 17:00:00','YYYY-MM-DD HH24:MI:SS')
                  , 'WEEKDAY'
                   ); 
        END LOOP;                                     
        CLOSE cur_employees; 
    END IF;
END p_add_work_hours;


PROCEDURE p_add_emp_hours (in_emp_id IN work_hours.employee_id%TYPE 
                         , in_work_date IN DATE 
                         , in_start_work IN VARCHAR2
                         , in_end_work IN VARCHAR2
                         )
IS 
    v_rec_num NUMBER;
    v_start_work_hour TIMESTAMP := TO_TIMESTAMP(in_work_date||' '||in_start_work,'YYYY-MM-DD HH24:MI:SS');
    v_end_work_hour TIMESTAMP := TO_TIMESTAMP(in_work_date||' '||in_end_work,'YYYY-MM-DD HH24:MI:SS');

BEGIN

    SELECT COUNT (*)
    INTO v_rec_num
    FROM work_hours
    WHERE employee_id=in_emp_id
    AND work_date=in_work_date;

    IF v_rec_num!=0 THEN 
        UPDATE work_hours
        SET start_work_hour=v_start_work_hour
        , end_work_hour=v_end_work_hour
        WHERE employee_id=in_emp_id
        AND work_date=in_work_date;
     
    ELSE 
        INSERT INTO work_hours (employee_id
                              , work_date
                              , start_work_hour
                              , end_work_hour
                              , type_of_weekday
                               )
        VALUES (in_emp_id
              , in_work_date
              , v_start_work_hour
              , v_end_work_hour
              , f_get_type_of_day(in_work_date)
               ); 
        
    END IF;
    
END p_add_emp_hours;


PROCEDURE p_delete_workday (in_emp_id IN work_hours.employee_id%TYPE 
                          , in_vacation_day IN DATE 
                           )
IS 
    v_rec_num NUMBER;
BEGIN

    SELECT COUNT (*)
    INTO v_rec_num
    FROM work_hours
    WHERE employee_id=in_emp_id
    AND work_date=in_vacation_day;

    IF v_rec_num =0 THEN NULL;
     
    ELSE 
        DELETE FROM work_hours
        WHERE employee_id = in_emp_id
        AND work_date = in_vacation_day;
        
    END IF;
    
END p_delete_workday;

END work_hours_manipulation_pkg;



BEGIN
    work_hours_manipulation_pkg.p_fill_work_hours (in_date_start => '2022/08/01'
                                                 , in_date_end   => '2022/08/31'
                                                  );
END;
/

BEGIN
    work_hours_manipulation_pkg.p_add_work_hours  ('2022/09/01');
END;
/

BEGIN
    work_hours_manipulation_pkg.p_add_emp_hours   (in_emp_id     => 2
                                                 , in_work_date  => '2022/08/15'
                                                 , in_start_work => '07:00'
                                                 , in_end_work   => '15:00'
                                                  );
END;
/

BEGIN
    work_hours_manipulation_pkg.p_delete_workday (in_emp_id => 10 
                                                , in_vacation_day => '2022/08/12'
                                                 );
END;