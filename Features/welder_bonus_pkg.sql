-- The main purpose of this package is to calculate a monthly bonus for each welder based on his performance.  
DROP PACKAGE welder_bonus_pkg;
CREATE OR REPLACE PACKAGE welder_bonus_pkg 
IS
-- This function calculates how many welds (diameter in mm) the welder perform in the last month: 
    FUNCTION get_sum_diameter (in_welder_id IN welders.welder_id%TYPE
                             , in_date IN DATE
                             ) RETURN NUMBER;
                             
-- This function calculates how many hours the employee worked in the last month 
    FUNCTION get_emp_hours (in_emp_id employees.employee_id%TYPE
                          , in_date DATE
                          ) RETURN NUMBER;
                          
-- This function calculates a monthly bonus for each welder based on his performance
    FUNCTION get_welder_bonus (in_welder_id IN welders.welder_id%TYPE
                             , in_date IN DATE
                             ) RETURN NUMBER;
END welder_bonus_pkg;
/

CREATE OR REPLACE PACKAGE BODY welder_bonus_pkg
IS
    FUNCTION get_sum_diameter (in_welder_id IN welders.welder_id%TYPE
                             , in_date IN DATE) RETURN NUMBER
    IS
        v_sum_diameter NUMBER;
    BEGIN
        WITH
        dia_number AS
        (SELECT j.welder_id
              , j.date_of_welded
              , m.diameter 
        FROM joints j
        LEFT JOIN materials m
        ON j.material_1_id=m.material_id)
        SELECT SUM(diameter)
        INTO v_sum_diameter
        FROM dia_number
        WHERE welder_id=in_welder_id
        AND date_of_welded BETWEEN LAST_DAY(ADD_MONTHS(in_date, -2))+1 AND LAST_DAY(ADD_MONTHS(in_date, -1))
        ;
 
        RETURN v_sum_diameter;

    END get_sum_diameter;
    
    FUNCTION get_emp_hours (in_emp_id employees.employee_id%TYPE
                          , in_date DATE) RETURN NUMBER
    IS
        v_number_hours NUMBER;
    BEGIN
        SELECT SUM((EXTRACT(HOUR FROM end_work_hour-start_work_hour)))
        INTO v_number_hours
        FROM work_hours
        WHERE employee_id=in_emp_id
        AND work_date BETWEEN LAST_DAY(ADD_MONTHS(in_date, -2))+1 AND LAST_DAY(ADD_MONTHS(in_date, -1))
        ;

        RETURN v_number_hours;

    END get_emp_hours;

    FUNCTION get_welder_bonus (in_welder_id IN welders.welder_id%TYPE
                             , in_date IN DATE
                              ) RETURN NUMBER
    IS
        v_welder_bonus1        NUMBER := 1000;  -- the highest monthly bonus a welder can earn
        v_welder_efficiency_1  NUMBER := 10;     -- efficiency per hour for the highest bonus
        v_welder_bonus2        NUMBER := 500;   -- the lower monthly bonus a welder can earn
        v_welder_efficiency_2  NUMBER := 5;     -- efficiency per hour for the lower bonus
        v_welder_bonus3        NUMBER := 0;     -- the welder is not entitled to the monthly bonus

        v_bonus                NUMBER;
        v_efficiency           NUMBER;
        in_emp_id              employees.employee_id%TYPE;
    BEGIN
        SELECT employee_id
        INTO in_emp_id
        FROM welders
        WHERE welder_id = in_welder_id;
        
    --hourly performance calculation:
        v_efficiency := get_sum_diameter(in_welder_id, in_date) / get_emp_hours(in_emp_id, in_date);

        IF v_efficiency >= v_welder_efficiency_1 THEN 
           v_bonus := v_welder_bonus1;
        ELSIF v_efficiency < v_welder_efficiency_1 AND v_efficiency>=v_welder_efficiency_2 THEN 
            v_bonus := v_welder_bonus2;
        ELSE
            v_bonus := v_welder_bonus3;
        END IF;
    
        RETURN v_bonus;
    
    END get_welder_bonus;
              
END welder_bonus_pkg;




SELECT 
      welder_id
    , welder_bonus_pkg.get_sum_diameter(welder_id, TO_DATE('2022/09/02', 'YYYY/MM/DD')) efficiency
    , welder_bonus_pkg.get_emp_hours(employee_id, TO_DATE('2022/09/02', 'YYYY/MM/DD')) hours
    , welder_bonus_pkg.get_welder_bonus(welder_id, TO_DATE('2022/09/02', 'YYYY/MM/DD')) bonus
FROM welders;