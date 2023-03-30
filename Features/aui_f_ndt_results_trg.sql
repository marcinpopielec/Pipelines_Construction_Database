/* trigger populates  'ndt_acceptance' column from the 'joints' table based on the results
from the 'ndt_results' table (we will get "A" (acceptance) in 'ndt_acceptance' column in the 'joints' table only 
if we mark 'vt_acceptance', 'pt_acceptance' and 'rt_acceptance' as 'A' in the 'ndt_results' table) */

CREATE OR REPLACE TRIGGER aui_f_ndt_results_trg
AFTER INSERT OR UPDATE ON ndt_results
FOR EACH ROW 
DECLARE
BEGIN
    IF 
        :NEW.vt_acceptance = 'A' AND :NEW.pt_acceptance = 'A'  AND :NEW.rt_acceptance = 'A' THEN

        UPDATE joints 
        SET ndt_acceptance = 'YES'
        WHERE pipe_id = :NEW.pipe_id
        AND weld_no = :NEW.weld_no;

    ELSE
        UPDATE joints 
        SET ndt_acceptance = 'NO'
        WHERE pipe_id = :NEW.pipe_id
        AND weld_no = :NEW.weld_no; 

    END IF;
    
END aui_f_ndt_results_trg;






INSERT INTO ndt_results VALUES
        ('WAT-89'
        , 9
        , '02/VT/IPE/2020'
        , 'A'
        , '02/PT/IPE/2020'
        , 'A'
        ,'RT68/IPE/2020'
        , 'A'
        );


UPDATE ndt_results
SET rt_acceptance='A'
WHERE
pipe_id ='WAT-89' 
AND weld_no = 4;