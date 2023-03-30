-- insert data into the employee_positions table 
BEGIN  
INSERT INTO employee_positions VALUES   
        ( 1  
        , 'Director'  
        , 90   
        );  
  
INSERT INTO employee_positions VALUES 
        ( 2
        , 'Site Manager'
        , 120
        );
 
INSERT INTO employee_positions VALUES 
        ( 3
        , 'Site Engineer'
        , 60
        );
 
INSERT INTO employee_positions VALUES 
        ( 4
        , 'Welding Engineer'
        , 60
        );
 
INSERT INTO employee_positions VALUES 
        ( 5
        , 'NDT_Inspector'
        , 50
        );
 
INSERT INTO employee_positions VALUES 
        ( 6
        , 'Master Foreman'
        , 90
        );
 
INSERT INTO employee_positions VALUES 
        ( 7
        , 'Foreman'
        , 35
        );
 
INSERT INTO employee_positions VALUES 
        ( 8
        , 'Welder'
        , 30
        );
 
INSERT INTO employee_positions VALUES 
        ( 9
        , 'Fitter'
        , 15
        );
END;
/

-- insert data into the employees table 
BEGIN
INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 1
        , 'Szymon'
        , 'Kubkowski'
        , 9
        , '2024-01-02'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 2
        , 'Marcin'
        , 'Kowalski'
        , 8
        , '2024-02-01'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 3
        , 'Krzysztof'
        , 'Iksiński'
        , 1
        , '2024-01-31'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 4
        , 'Mateusz'
        , 'Czajkowski'
        , 7
        , '2024-12-31'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 5
        , 'Łukasz'
        , 'Majkowski'
        , 9
        , '2023-04-15'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 6
        , 'Eugeniusz'
        , 'Gruszka'
        , 8
        , '2023-05-01'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 7
        , 'Adam'
        , 'Rumuński'
        , 7
        , '2023-05-06'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 8
        , 'Ireneusz'
        , 'Polski'
        , 6
        , '2023-01-22'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 9
        , 'Dawid'
        , 'Kwiatkowski'
        , 3
        , '2023-04-06'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 10
        , 'Jacek'
        , 'Ziobrowski'
        , 8
        ,
        ' 2024-02-02'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 11
        , 'Pior'
        , 'Zdun'
        , 9
        , '2024-03-01'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 12
        , 'Pior'
        , 'Zdun'
        , 9
        , '2024-04-30'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 13
        , 'Dariusz'
        , 'Królikowski'
        , 2
        , '2024-11-30'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 14
        , 'Roman'
        , 'Romanowski'
        , 4
        , '2023-04-16'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 15
        , 'Damian'
        , 'Mieczyk'
        , 9
        , '2023-04-01'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 16
        , 'Damian'
        , 'Mieczyk'
        , 8
        , '2025-05-06'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 17
        , 'Adrian'
        , 'Krzyczkowski'
        , 5
        , '2025-01-22'
        );

INSERT INTO employees (employee_id, first_name, last_name, position_id,  expire_date) VALUES 
        ( 18
        , 'Dawid'
        , 'Rutynowski'
        , 5
        , '2025-04-06'
        );
END;
/

-- insert data into the materials table 
BEGIN  
INSERT INTO materials VALUES 
        ( 1
        , 'Pipe'
        , 8
        , 168
        , 1200
        , 304
        , 'mat-pipe-klyfg-1234/2021'
        , 'I'
        );

INSERT INTO materials VALUES 
        ( 2 
        , 'Tee-90°'
        , 8
        , 168
        , 96
        , 304
        , 'mat-pipe-klozg-7890/2021'
        , 'I'
        );

INSERT INTO materials VALUES 
        ( 3
        , 'Tee-90°'
        , 8
        , 168
        , 96
        , 304
        , 'mat-pipe-klihg-8000/2021'
        , 'I'
        );

INSERT INTO materials VALUES 
        ( 4
        , 'Pipe'
        , 12.5
        , 114
        , 2400
        , 'S355'
        , 'cert-trav-6789/2021'
        , 'II'
        );

INSERT INTO materials VALUES 
        ( 5
        , 'Tee-45°'
        , 12.5
        , 114
        , 106
        , 'S355'
        , 'cert-trav-8789/2021'
        , 'II'
        );

INSERT INTO materials VALUES 
        ( 6
        , 'Tee-90°'
        , 12.5
        , 114
        , 102
        , 'S355'
        , 'cert-trav-6549/2021'
        , 'II'
        );

INSERT INTO materials VALUES 
        ( 7
        , 'Valve'
        , 8
        , 168
        , 230
        , 304
        , 'mcertificate-opytr-2020'
        , 'I'
        );

INSERT INTO materials VALUES 
        ( 8
        , 'Valve'
        , 12.5
        , 114
        , 232
        , 'S355'
        , 'protoc-jklop-34562020'
        , 'II'
        );
END;
/

-- insert data into the welding_methods table 
BEGIN
INSERT INTO welding_methods VALUES 
        ( 111
        , 'manual metal arc welding'
        );

INSERT INTO welding_methods VALUES 
        ( 141
        , 'TIG welding with tungsten electrode'
        );

INSERT INTO welding_methods VALUES 
        ( 136
        , 'arc welding with a wire with a powder filling'
        );

INSERT INTO welding_methods VALUES 
        ( 135
        , 'metal active gas welding (MAG welding)'
        );
END;
/

-- insert data into the ndt_inspectors table 
BEGIN 
INSERT INTO ndt_inspectors VALUES 
       (1,17, 'NO');

INSERT INTO ndt_inspectors VALUES 
       (2,18, 'NO');
END;
/

-- insert data into the ndt_certificates table 
BEGIN
INSERT INTO ndt_certificates VALUES 
        ( 1
        , 'VT-2'
        , 'VT2/8328/2019/1'
        , '2024-05-21'
        );

INSERT INTO ndt_certificates VALUES 
        ( 1
        , 'PT-2'
        , 'PT2/8328/2020/3'
        , '2026-05-21'
        );

INSERT INTO ndt_certificates VALUES 
        ( 2
        , 'VT-2','VT2/3456/2018/2'
        , '2024-04-21'
        );

INSERT INTO ndt_certificates VALUES 
        ( 2
        , 'PT-2'
        , 'PT2/7656/2019/122'
        , '2023-05-24'
        );

INSERT INTO ndt_certificates VALUES 
        ( 2
        , 'RT-2'
        , 'RT2/a345/2018/aw3'
        , '2025-11-22'
        );
END;

-- insert data into the reports table 
BEGIN  
INSERT INTO reports VALUES 
        ( 1
        , 'VT'
        , '01/VT/IPE/2020'
        , 1
        );

INSERT INTO reports VALUES 
        ( 2
        , 'PT'
        , '01/PT/IPT/2020'
        , 1
        );

INSERT INTO reports VALUES 
        ( 3
        , 'RT'
        , 'RT67/IPE/2020'
        , 2
        );

INSERT INTO reports VALUES 
        ( 4
        , 'VT'
        , '02/VT/IPE/2020'
        , 2
        );

INSERT INTO reports VALUES 
        ( 5
        , 'PT'
        , '02/PT/IPE/2020'
        , 2
        );

INSERT INTO reports VALUES 
        ( 6
        , 'RT'
        , 'RT68/IPE/2020'
        , 2
        );
END;
/

-- insert data into the weld_types table 
BEGIN
INSERT INTO weld_types VALUES 
        ( 'BE'
        , 'butt weld erection'
        );

INSERT INTO weld_types VALUES 
        ( 'FE'
        , 'fillet weld erection'
        );

INSERT INTO weld_types VALUES 
        ( 'SE'
        , 'socket weld erection'
        );

INSERT INTO weld_types VALUES 
        ( 'EWE'
        , 'external weld erection'
        );
END;
/
-- insert data into the welders table 
BEGIN
INSERT INTO welders VALUES 
        ( 1
        , 'KBR-1'
        , 2
        );

INSERT INTO welders VALUES 
        ( 2
        , 'KBR-7'
        , 6
        );

INSERT INTO welders VALUES 
        ( 3
        , 'KBR-17'
        , 10
        );

INSERT INTO welders VALUES 
        ( 4
        , 'KBR-98'
        , 16
        );
END;
/

-- insert data into the welders_certificates table 
BEGIN
INSERT INTO welders_certificates VALUES 
        ( 'KBR-1'
        , 'TDT/08/141/2020'
        , '141 T BW 8.1 S t8.7 D60.3 H-L045 ss nb'
        , '2023-08-09'
        );

INSERT INTO welders_certificates VALUES 
        ( 'KBR-7'
        , 'UDT/987/136/2020'
        , '136 T BW 8.1 S t8.7 D60.3 H-L045 ss nb','2024-09-08'
        );

INSERT INTO welders_certificates VALUES 
        ( 'KBR-17'
        , 'TUVR/AD23/ew45/19'
        , '111 T BW 5.1 S t12.5 D60.3 H-L045 ss nb'
        , '2024-09-08'
        );

INSERT INTO welders_certificates VALUES 
        ( 'KBR-98'
        , 'UDT/123/141/2020'
        , '141 T BW 5.1 S t8.0 D60.3 H-L045 ss nb'
        , '2023-11-08'
        );

INSERT INTO welders_certificates VALUES 
        ( 'KBR-98'
        , 'TDT/765/111/2020'
        , '111 P FW 1.2 S t12.5 D60.3 H-L045 ss nb'
        , '2024-06-30'
        );

INSERT INTO welders_certificates VALUES
        ( 'KBR-7'
        , 'TUV/asd2/141/2020'
        , '141 T BW 8.1 S t12.5 D60.3 H-L045 ss nb'
        , '2024-09-08'
        );
END;
/

-- insert data into the list_of_wps table 
BEGIN 
INSERT INTO list_of_wps VALUES 
        ( 1
        , 'WPS02/141/8/15'
        , '141'
        , 'BE','WPQR/98/141'
        , 'OK TIGROD 308 LSi'
        );

INSERT INTO list_of_wps VALUES 
        ( 2
        , 'WPS04/136/8/15'
        , '136'
        , 'BE','WPQR/101/136'
        , 'OK Bohler 412 Mn'
        );

INSERT INTO list_of_wps VALUES 
        ( 3
        , 'WPS08/111/1/2','111'
        , 'BE'
        , 'WPQR/111/111'
        , 'OK Bohler Mg Fe'
        );

INSERT INTO list_of_wps VALUES 
        ( 4
        , 'WPS18/141/1/2'
        , '141'
        , 'FE','WPQR/98/111'
        , 'OK TIGROD 308 LSi'
        );

INSERT INTO list_of_wps VALUES 
        ( 5
        , 'WPS22/141/1/2'
        , '136'
        , 'FE'
        , 'WPQR/101/136'
        , 'OK Bohler 412 Mn'
        );
END;

-- insert data into the joints table 
BEGIN  
INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 1
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-28'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 2
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 1
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/29'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 2
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'HYD-002'
        , 1
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-29'
        , 'WPS18/141/1/2'
        , 'KBR-7'
        , 2
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 2
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-29'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 2
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 2
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/29'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 2
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 4
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/01'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 5
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 5
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/03'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 5
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 6
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/05'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 5
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 25
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/08'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 6
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 7
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/09'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 6
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 8
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/11'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 5
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 9
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/12'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 5
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 24
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/12'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 6
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 10
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/16'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 5
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 11
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/16'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 12
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/17'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 13
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/18'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 14
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/19'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 15
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/22'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 16
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/22'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 17
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/22'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 18
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/22'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 5
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 19
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/22'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 4
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 20
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/22'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 4
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 21
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '22/08/22'
        , 'WPS02/141/8/15'
        , 'KBR-98'
        , 4
        , 4
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 22
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-01'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 23
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-02'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 24
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-03'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 25
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-03'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 26
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-08'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 27
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-08'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 2
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 28
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-08'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 2
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 29
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-12'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 2
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 30
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-16'
        , 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 3
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-899'
        , 31
        , 'WERTY-KLOPU-PROJECT08-WARSAW-8943'
        , '2022-08-18', 'WPS02/141/8/15'
        , 'KBR-1'
        , 1
        , 2
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'HYD-002'
        , 2
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-12'
        , 'WPS18/141/1/2'
        , 'KBR-7'
        , 1
        , 2
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'HYD-002'
        , 3
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-10'
        , 'WPS18/141/1/2'
        , 'KBR-7'
        , 1
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'HYD-002'
        , 4
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-09','WPS18/141/1/2'
        , 'KBR-7'
        , 1
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'HYD-002'
        , 5
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-03'
        , 'WPS18/141/1/2'
        , 'KBR-7'
        , 1
        , 1
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'HYD-002'
        , 6
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-04'
        , 'WPS18/141/1/2'
        , 'KBR-7'
        , 2
        , 3
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'HYD-002'
        , 7
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-05'
        , 'WPS18/141/1/2'
        , 'KBR-7'
        , 2
        , 3
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 22
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-01','WPS18/141/1/2'
        , 'KBR-17'
        , 4
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 23
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-02'
        , 'WPS18/141/1/2'
        , 'KBR-17'
        , 5
        , 8
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 27
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-02'
        , 'WPS18/141/1/2'
        , 'KBR-17'
        , 4
        , 4
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 29
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-12'
        , 'WPS18/141/1/2'
        , 'KBR-17'
        , 4
        , 4
        );

INSERT INTO joints (pipe_id, weld_no, drawing_no, date_of_welded, wps_no, welder_id, material_1_id, material_2_id) VALUES 
        ( 'WAT-89'
        , 26
        , 'WERTY-KLOPU-PROJECT09-WARSAW-2143'
        , '2022-08-22'
        , 'WPS18/141/1/2'
        , 'KBR-17'
        , 4
        , 4
        );
END;
/


-- insert data into the ndt_results table 
BEGIN  
INSERT INTO ndt_results (pipe_id, weld_no, vt_report_no, vt_acceptance, pt_report_no, pt_acceptance, rt_report_no, rt_acceptance) VALUES 
        ( 'WAT-899'
        , 1
        , '01/VT/IPE/2020'
        , 'A'
        , '01/PT/IPT/2020'
        , 'A'
        , 'RT67/IPE/2020'
        , 'A'
        );

INSERT INTO ndt_results (pipe_id, weld_no, vt_report_no, vt_acceptance, pt_report_no, pt_acceptance, rt_report_no, rt_acceptance) VALUES 
        ( 'WAT-89'
        , 1
        , '01/VT/IPE/2020'
        , 'A'
        , '01/PT/IPT/2020'
        , 'A'
        , 'RT67/IPE/2020'
        , 'A'
        );

INSERT INTO ndt_results (pipe_id, weld_no, vt_report_no, vt_acceptance, pt_report_no, pt_acceptance, rt_report_no, rt_acceptance) VALUES 
        ( 'HYD-002'
        , 1
        , '01/VT/IPE/2020'
        , 'A'
        , '01/PT/IPT/2020'
        , 'A'
        , 'RT67/IPE/2020'
        , 'A'
        );

INSERT INTO  ndt_results (pipe_id, weld_no, vt_report_no, vt_acceptance, pt_report_no, pt_acceptance, rt_report_no, rt_acceptance) VALUES 
        ( 'WAT-899'
        , 2
        , '02/VT/IPE/2020'
        , 'A'
        , '02/PT/IPE/2020'
        , 'A'
        , 'RT68/IPE/2020'
        , 'A'
        );

INSERT INTO  ndt_results (pipe_id, weld_no, vt_report_no, vt_acceptance, pt_report_no, pt_acceptance, rt_report_no, rt_acceptance) VALUES 
        ( 'WAT-89'
        , 2
        , '02/VT/IPE/2020'
        , 'A'
        , '02/PT/IPE/2020'
        , 'A'
        , 'RT68/IPE/2020'
        , 'A'
        );

INSERT INTO ndt_results (pipe_id, weld_no, vt_report_no, vt_acceptance, pt_report_no, pt_acceptance, rt_report_no, rt_acceptance) VALUES 
        ( 'WAT-89'
        , 4
        , '02/VT/IPE/2020'
        , 'A'
        , '02/PT/IPE/2020'
        , 'A'
        , 'RT68/IPE/2020'
        , 'NA'
        );
END;











