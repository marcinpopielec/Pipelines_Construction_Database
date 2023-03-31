--list of all welders currently on building site   
CREATE OR REPLACE VIEW v_list_of_welders
AS
    SELECT 
          w.id
        , e.first_name
        , e.last_name
        ,w.welder_id
    FROM welders w
    LEFT JOIN employees e
    ON e.employee_id=w.employee_id;




--list of all qualifications of welders used in the project
CREATE OR REPLACE VIEW v_list_of_welders_certificates
AS
    SELECT 
        e.first_name
      , e.last_name
      , wc.welder_id
      , wc.certificate_no
      , wc.welder_qualification
      , wc.valid_till
    FROM ((welders w
    LEFT JOIN employees e
    ON e.employee_id=w.employee_id)
    INNER JOIN welders_certificates wc
    ON w.welder_id=wc.welder_id);
    
