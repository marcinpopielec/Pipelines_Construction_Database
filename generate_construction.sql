CREATE TABLE employee_positions (
    position_id   SMALLINT NOT NULL,
    position_name VARCHAR2(40 CHAR) NOT NULL,
    job_limits    SMALLINT
);

COMMENT ON COLUMN employee_positions.position_id IS
    'Unique number that shows current job title of the employee';

COMMENT ON COLUMN employee_positions.position_name IS
    'A column that shows job title, e.g. Welder';

COMMENT ON COLUMN employee_positions.job_limits IS
    'Number of days until the end of the contract, if this number is less, counting from today, you should talk to the employee about extending the contract'
    ;

ALTER TABLE employee_positions ADD CONSTRAINT employee_positions_pk PRIMARY KEY ( position_id );

CREATE TABLE employees (
    employee_id SMALLINT NOT NULL,
    first_name  VARCHAR2(50 CHAR) NOT NULL,
    last_name   VARCHAR2(50 CHAR) NOT NULL,
    position_id SMALLINT NOT NULL,
    expire_date DATE
);

COMMENT ON COLUMN employees.employee_id IS
    'A unique employee number on a construction project';

COMMENT ON COLUMN employees.first_name IS
    'First Name of the employee';

COMMENT ON COLUMN employees.last_name IS
    'Last Name of the employee';

COMMENT ON COLUMN employees.position_id IS
    'Unique number that shows current job title of the employee';

COMMENT ON COLUMN employees.expire_date IS
    'Date of expiry of the employment contract';

ALTER TABLE employees ADD CONSTRAINT employees_pk PRIMARY KEY ( employee_id );

CREATE TABLE joints (
    pipe_id        VARCHAR2(7 CHAR) NOT NULL,
    weld_no        INTEGER
        CONSTRAINT "Not Null" NOT NULL,
    drawing_no     VARCHAR2(50 CHAR) NOT NULL,
    date_of_welded DATE,
    wps_no         VARCHAR2(30 CHAR) NOT NULL,
    welder_id      VARCHAR2(6 CHAR),
    material_1_id  INTEGER NOT NULL,
    material_2_id  INTEGER NOT NULL,
    ndt_acceptance VARCHAR2(3 CHAR)
);

ALTER TABLE joints
    ADD CHECK ( ndt_acceptance IN ( 'NO', 'YES' ) );

COMMENT ON COLUMN joints.pipe_id IS
    'Each pipeline on the construction site has its own unique number';

COMMENT ON COLUMN joints.weld_no IS
    'Each pipeline has a separate numbering of welds. This numbering always starts with number 1, then 2, 3, 4, etc';

COMMENT ON COLUMN joints.drawing_no IS
    'The number of the drawing in which the connection is located';

COMMENT ON COLUMN joints.date_of_welded IS
    'The date the weld was completed';

COMMENT ON COLUMN joints.wps_no IS
    'WPS -Welding Procedure Specification Record. Technical instruction for the execution of a given joint for the welder';

COMMENT ON COLUMN joints.welder_id IS
    'Each welder on one construction project has his own unique number';

COMMENT ON COLUMN joints.material_1_id IS
    'Each connection exists between two different parts of the pipeline, and each part has its own unique number';

COMMENT ON COLUMN joints.material_2_id IS
    'Each connection exists between two different parts of the pipeline, and each part has its own unique number';

COMMENT ON COLUMN joints.ndt_acceptance IS
    'Whether NDT results are acceptable or not';

ALTER TABLE joints ADD CONSTRAINT joints_pk PRIMARY KEY ( pipe_id,
                                                          weld_no );

CREATE TABLE list_of_wps (
    id                 SMALLINT NOT NULL,
    wps_no             VARCHAR2(30 CHAR) NOT NULL,
    welding_method     VARCHAR2(12 CHAR) NOT NULL,
    weld_type          VARCHAR2(3 CHAR) NOT NULL,
    wpqr_no            VARCHAR2(30 CHAR) NOT NULL,
    welding_consumable VARCHAR2(60 CHAR) NOT NULL
);

COMMENT ON COLUMN list_of_wps.id IS
    'Helps to determine how many WPS instructions used in the project';

COMMENT ON COLUMN list_of_wps.wps_no IS
    'WPS - Welding Procedure Specification Record. Technical instruction for the execution of a given joint for the welder';

COMMENT ON COLUMN list_of_wps.welding_method IS
    'Each welding proces has its own unique number';

COMMENT ON COLUMN list_of_wps.weld_type IS
    'Type of welded joint';

COMMENT ON COLUMN list_of_wps.wpqr_no IS
    'WPQR - Number of Welding Procedure Qualification Record. Third party approval of the welding technology that the company may use'
    ;

COMMENT ON COLUMN list_of_wps.welding_consumable IS
    'The name of the filler material necessary for welding';

ALTER TABLE list_of_wps ADD CONSTRAINT "List of WPS_PK" PRIMARY KEY ( wps_no );

ALTER TABLE list_of_wps ADD CONSTRAINT list_of_wps__un UNIQUE ( id );

CREATE TABLE materials (
    material_id          INTEGER NOT NULL,
    name_of_the_part     VARCHAR2(200 CHAR) NOT NULL,
    thickness            NUMBER(5, 2),
    diameter             NUMBER(5, 2),
    length               INTEGER,
    material_type        VARCHAR2(20 CHAR),
    material_certificate VARCHAR2(60 CHAR) NOT NULL,
    ped_category         VARCHAR2(2 CHAR) NOT NULL
);

ALTER TABLE materials
    ADD CHECK ( ped_category IN ( '0', 'I', 'II', 'III', 'IV' ) );

COMMENT ON COLUMN materials.material_id IS
    'Each part of pipeline has its own unique number';

COMMENT ON COLUMN materials.name_of_the_part IS
    'For example: tube, tee, valve';

COMMENT ON COLUMN materials.thickness IS
    'The wall thickness of the part';

COMMENT ON COLUMN materials.diameter IS
    'The diameter of the part';

COMMENT ON COLUMN materials.length IS
    'The length of the part';

COMMENT ON COLUMN materials.material_type IS
    'The type of material the part is made of';

COMMENT ON COLUMN materials.material_certificate IS
    'Each part has a certificate with a heat number';

COMMENT ON COLUMN materials.ped_category IS
    'The pressure category is determined by the Pressure Equipment Directive (PED) 2014/68/EU. There are 0,I,II,III,IV pressure category'
    ;

ALTER TABLE materials ADD CONSTRAINT materials_pk PRIMARY KEY ( material_id );

CREATE TABLE ndt_certificates (
    inspector_id   VARCHAR2(10 CHAR) NOT NULL,
    qualification  VARCHAR2(4 CHAR) NOT NULL,
    certificate_no VARCHAR2(50 CHAR) NOT NULL,
    valid_till     DATE NOT NULL
);

ALTER TABLE ndt_certificates
    ADD CHECK ( qualification IN ( 'PT-1', 'PT-2', 'PT-3', 'RT-1', 'RT-2',
                                   'RT-3', 'VT-1', 'VT-2', 'VT-3' ) );

COMMENT ON COLUMN ndt_certificates.inspector_id IS
    'Each NDT inspector on the building site has his own unique number';

COMMENT ON COLUMN ndt_certificates.qualification IS
    'It defines the level and method in which the inspector is certified and can perform non-destructive testing. VT - visual testing, PT - penetrant testing, RT - radiographic testing'
    ;

COMMENT ON COLUMN ndt_certificates.certificate_no IS
    'Non-destructive testing certificate number';

COMMENT ON COLUMN ndt_certificates.valid_till IS
    'NDT certificate validity';

ALTER TABLE ndt_certificates ADD CONSTRAINT ndt_certificates_pk PRIMARY KEY ( certificate_no );

CREATE TABLE ndt_inspectors (
    inspector_id     VARCHAR2(10 CHAR) NOT NULL,
    employee_id      SMALLINT NOT NULL,
    external_company VARCHAR2(2 CHAR)
);

ALTER TABLE ndt_inspectors
    ADD CHECK ( external_company IN ( 'NO', 'YES' ) );

COMMENT ON COLUMN ndt_inspectors.inspector_id IS
    'Each NDT inspector on the building site has his own unique number';

COMMENT ON COLUMN ndt_inspectors.employee_id IS
    'A unique employee number on a construction project';

COMMENT ON COLUMN ndt_inspectors.external_company IS
    'Specifies whether the inspector is from an external company';

ALTER TABLE ndt_inspectors ADD CONSTRAINT ndt_inspectors_pk PRIMARY KEY ( inspector_id );

CREATE TABLE ndt_results (
    pipe_id       VARCHAR2(7 CHAR) NOT NULL,
    weld_no       INTEGER NOT NULL,
    vt_report_no  VARCHAR2(20 CHAR) NOT NULL,
    vt_acceptance VARCHAR2(2 CHAR) NOT NULL,
    pt_report_no  VARCHAR2(20 CHAR),
    pt_acceptance VARCHAR2(2 CHAR),
    rt_report_no  VARCHAR2(20 CHAR),
    rt_acceptance VARCHAR2(2 CHAR)
);

ALTER TABLE ndt_results
    ADD CHECK ( vt_acceptance IN ( 'A', 'NA' ) );

ALTER TABLE ndt_results
    ADD CHECK ( pt_acceptance IN ( 'A', 'NA' ) );

ALTER TABLE ndt_results
    ADD CHECK ( rt_acceptance IN ( 'A', 'NA' ) );

COMMENT ON COLUMN ndt_results.pipe_id IS
    'Each pipeline on the construction site has its own unique number';

COMMENT ON COLUMN ndt_results.weld_no IS
    'Each pipeline has a separate numbering of welds. This numbering always starts with number 1, then 2, 3, 4, etc';

COMMENT ON COLUMN ndt_results.vt_report_no IS
    'Visual testing report number';

COMMENT ON COLUMN ndt_results.vt_acceptance IS
    'Whether the result of the visual testing of the weld is positive (A) or not (NA)';

COMMENT ON COLUMN ndt_results.pt_report_no IS
    'Penetrant testing report number';

COMMENT ON COLUMN ndt_results.pt_acceptance IS
    'Whether the result of the radiographic testing of the weld is positive (A) or not (NA)';

COMMENT ON COLUMN ndt_results.rt_report_no IS
    'Radiographic testing report number';

COMMENT ON COLUMN ndt_results.rt_acceptance IS
    'Whether the result of the radiographic testing of the weld is positive (A) or not (NA)';

ALTER TABLE ndt_results ADD CONSTRAINT ndt_results_pk PRIMARY KEY ( weld_no,
                                                                    pipe_id );

CREATE TABLE reports (
    id           INTEGER NOT NULL,
    type_of_ndt  VARCHAR2(2 CHAR) NOT NULL,
    report_no    VARCHAR2(20 CHAR) NOT NULL,
    inspector_id VARCHAR2(10 CHAR) NOT NULL
);

ALTER TABLE reports
    ADD CHECK ( type_of_ndt IN ( 'PT', 'RT', 'VT' ) );

COMMENT ON COLUMN reports.id IS
    'How many reports have been created on the project';

COMMENT ON COLUMN reports.type_of_ndt IS
    'What type of testing was used to check the welds. VT - visual testing, PT - penetrant testing, RT - radiographic testing';

COMMENT ON COLUMN reports.report_no IS
    'Each report has its own unique number';

COMMENT ON COLUMN reports.inspector_id IS
    'Each NDT inspector on the building site has his own unique number';

ALTER TABLE reports ADD CONSTRAINT "NDT Reports_PK" PRIMARY KEY ( report_no );

ALTER TABLE reports ADD CONSTRAINT reports__un UNIQUE ( id );

CREATE TABLE weld_types (
    weld_type      VARCHAR2(3 CHAR) NOT NULL,
    name_weld_type VARCHAR2(50 CHAR) NOT NULL
);

COMMENT ON COLUMN weld_types.weld_type IS
    'Type of welded joint';

COMMENT ON COLUMN weld_types.name_weld_type IS
    'Weld joint type name';

ALTER TABLE weld_types ADD CONSTRAINT weld_types_pk PRIMARY KEY ( weld_type );

CREATE TABLE welders (
    id          SMALLINT NOT NULL,
    welder_id   VARCHAR2(7 CHAR) NOT NULL,
    employee_id SMALLINT NOT NULL
);

COMMENT ON COLUMN welders.id IS
    'Helps to determine how many welders were involved in the project';

COMMENT ON COLUMN welders.welder_id IS
    'Each welder on one construction project has his own unique number';

COMMENT ON COLUMN welders.employee_id IS
    'A unique employee number on a construction project';

ALTER TABLE welders ADD CONSTRAINT welders_pk PRIMARY KEY ( welder_id );

ALTER TABLE welders ADD CONSTRAINT welders__un UNIQUE ( id );

CREATE TABLE welders_certificates (
    welder_id            VARCHAR2(6 CHAR) NOT NULL,
    certificate_no       VARCHAR2(50 CHAR) NOT NULL,
    welder_qualification VARCHAR2(70 CHAR),
    valid_till           DATE
);

COMMENT ON COLUMN welders_certificates.welder_id IS
    'Each welder on one construction project has his own unique number';

COMMENT ON COLUMN welders_certificates.certificate_no IS
    ' It is required that the welder has the appropriate certificates. The certificate specifies very precisely the type of joint that the welder can perform: type of connection, wall thickness, type of material, etc'
    ;

COMMENT ON COLUMN welders_certificates.welder_qualification IS
    'Welder qualification is a code included on the welder''s certificate. It is used to read details about the scope of the welder''s qualifications'
    ;

COMMENT ON COLUMN welders_certificates.valid_till IS
    'This date specifies the expiry date of the certificate';

ALTER TABLE welders_certificates ADD CONSTRAINT welders_certificates_pk PRIMARY KEY ( certificate_no );

CREATE TABLE welding_methods (
    welding_method      VARCHAR2(12 CHAR) NOT NULL,
    name_welding_method VARCHAR2(150 CHAR) NOT NULL
);

COMMENT ON COLUMN welding_methods.welding_method IS
    'Each welding proces has its own unique number';

COMMENT ON COLUMN welding_methods.name_welding_method IS
    'The name of the welding method';

ALTER TABLE welding_methods ADD CONSTRAINT welding_methods_pk PRIMARY KEY ( welding_method );

CREATE TABLE work_hours (
    id              INTEGER NOT NULL,
    employee_id     SMALLINT NOT NULL,
    work_date       DATE NOT NULL,
    start_work_hour TIMESTAMP,
    end_work_hour   TIMESTAMP,
    type_of_weekday VARCHAR2(10 CHAR)
);

ALTER TABLE work_hours
    ADD CHECK ( type_of_weekday IN ( 'Holiday', 'Saturday', 'Weekday' ) );

COMMENT ON COLUMN work_hours.id IS
    'The primary key for the work_hours table';

COMMENT ON COLUMN work_hours.employee_id IS
    'A unique employee number on a construction project';

COMMENT ON COLUMN work_hours.work_date IS
    'The date of the workday';

COMMENT ON COLUMN work_hours.start_work_hour IS
    'The time the employee started work';

COMMENT ON COLUMN work_hours.end_work_hour IS
    'The time the employee ended work';

COMMENT ON COLUMN work_hours.type_of_weekday IS
    'Specifies the type of day: working day, Saturday or holiday. Every Sunday is treated as a holiday';

ALTER TABLE work_hours ADD CONSTRAINT work_hours_pk PRIMARY KEY ( id );

ALTER TABLE employees
    ADD CONSTRAINT employee_positions_fk01 FOREIGN KEY ( position_id )
        REFERENCES employee_positions ( position_id );

ALTER TABLE ndt_inspectors
    ADD CONSTRAINT employees_fk01 FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id );

ALTER TABLE welders
    ADD CONSTRAINT employees_fk02 FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id );

ALTER TABLE work_hours
    ADD CONSTRAINT employees_fk03 FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id );

ALTER TABLE joints
    ADD CONSTRAINT list_of_wps_fk01 FOREIGN KEY ( wps_no )
        REFERENCES list_of_wps ( wps_no );

ALTER TABLE joints
    ADD CONSTRAINT materials_fk01 FOREIGN KEY ( material_1_id )
        REFERENCES materials ( material_id );

ALTER TABLE joints
    ADD CONSTRAINT materials_fk02 FOREIGN KEY ( material_2_id )
        REFERENCES materials ( material_id );

ALTER TABLE ndt_certificates
    ADD CONSTRAINT ndt_inspectors_fk01 FOREIGN KEY ( inspector_id )
        REFERENCES ndt_inspectors ( inspector_id );

ALTER TABLE reports
    ADD CONSTRAINT ndt_inspectors_fk02 FOREIGN KEY ( inspector_id )
        REFERENCES ndt_inspectors ( inspector_id );

ALTER TABLE ndt_results
    ADD CONSTRAINT ndt_results_joints_fk FOREIGN KEY ( pipe_id,
                                                       weld_no )
        REFERENCES joints ( pipe_id,
                            weld_no );

ALTER TABLE ndt_results
    ADD CONSTRAINT reports_fk01 FOREIGN KEY ( vt_report_no )
        REFERENCES reports ( report_no );

ALTER TABLE ndt_results
    ADD CONSTRAINT reports_fk02 FOREIGN KEY ( pt_report_no )
        REFERENCES reports ( report_no );

ALTER TABLE ndt_results
    ADD CONSTRAINT reports_fk03 FOREIGN KEY ( rt_report_no )
        REFERENCES reports ( report_no );

ALTER TABLE list_of_wps
    ADD CONSTRAINT weld_types_fk FOREIGN KEY ( weld_type )
        REFERENCES weld_types ( weld_type );

ALTER TABLE welders_certificates
    ADD CONSTRAINT welders_fk01 FOREIGN KEY ( welder_id )
        REFERENCES welders ( welder_id );

ALTER TABLE joints
    ADD CONSTRAINT welders_fk02 FOREIGN KEY ( welder_id )
        REFERENCES welders ( welder_id );

ALTER TABLE list_of_wps
    ADD CONSTRAINT welding_methods_fk01 FOREIGN KEY ( welding_method )
        REFERENCES welding_methods ( welding_method );