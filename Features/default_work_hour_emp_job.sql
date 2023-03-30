--this job inserts the default working hours from Monday to Friday at 17:00 for each employee in the project

BEGIN
  DBMS_SCHEDULER.create_program (program_name   => 'populate_work_hour',
                                 program_type   => 'PLSQL_BLOCK',
                                 program_action => 'work_hours_manipulation_pkg.p_add_work_hours (SYSDATE);',
                                 enabled        => TRUE,
                                 comments       => 'inserts the default working hours (7:00-17:00) 
                                                    of each employee into the work_hours table');
END;
/

BEGIN 
DBMS_SCHEDULER.create_schedule(schedule_name   =>'schedule_work_hour',
                               start_date      => systimestamp,
                               repeat_interval => 'FREQ=DAILY; BYDAY=MON,TUE,WED,THU,FRI; BYHOUR=17', 
                               end_date        => NULL,
                               comments        => 'starts from Monday to Friday at 17.00');
END;
/

BEGIN
  DBMS_SCHEDULER.create_job (job_name          => 'default_work_hour_emp',
                             program_name      => 'populate_work_hour',
                             schedule_name     =>'schedule_work_hour',
                             enabled           => TRUE,
                             comments          => 'inserts the default working hours from Monday to Friday at 17.00');
END;






BEGIN
DBMS_SCHEDULER.drop_job (job_name => 'default_work_hour_emp');
END;
/
BEGIN
DBMS_SCHEDULER.drop_program(program_name => 'populate_work_hour');
END;
/
BEGIN
    DBMS_SCHEDULER.drop_schedule (schedule_name => 'schedule_work_hour');
END;
/