# Pipelines_Construction_Database
First database for construction site

![lang](https://img.shields.io/static/v1?label=lang&message=PL/SQL&color=blue)
![lang](https://img.shields.io/static/v1?label=lang&message=SQL&color=yellow)
![engine](https://img.shields.io/static/v1?label=engine&message=Oracle&color=green)
![engine-ver](https://img.shields.io/static/v1?label=version&message=18c&color=green)  

## Table of Contents
1. [About](https://github.com/marcinpopielec/Pipelines_Construction_Database#about)
2. [Built With](https://github.com/marcinpopielec/Pipelines_Construction_Database#built-with)
	* [Tools](https://github.com/marcinpopielec/Pipelines_Construction_Database#tools)
3. [Getting started](https://github.com/marcinpopielec/Pipelines_Construction_Database#getting-started)
	* [Prerequisites](https://github.com/marcinpopielec/Pipelines_Construction_Database#prerequisites)
	* [Installing SQL Developer on Windows](https://github.com/marcinpopielec/Pipelines_Construction_Database#Installing-SQL-Developer-on-Windows)
	* [Installing Oracle Database 18c on Windows](https://github.com/marcinpopielec/Pipelines_Construction_Database#Installing-Oracle-Database-18c-on-Windows)
	* [Creating a database user](https://github.com/marcinpopielec/Pipelines_Construction_Database#Creating-a-database-user)
4. [Designing database](https://github.com/marcinpopielec/Pipelines_Construction_Database#Designing-database)
5. [Generating database](https://github.com/marcinpopielec/Pipelines_Construction_Database#Generating-database)
6. [Populating database](https://github.com/marcinpopielec/Pipelines_Construction_Database#Populating-database)



---

## About
The project is based on my experiences from a previous job. As a member of the construction site quality team, we had to gather a lot of information about the object we were building. We stored this data in Excel in the form of tables. So we had dozens of tables with thousands of records in them. In my opinion, using a relational database would solve many of the problems we encountered and would significantly speed up the work.

Let's imagine we want to build a pipeline. We must prove that every connection between elements has been made strictly in accordance with standards, specifications and customer requirements. To do this, we need to document:
- welder's certificate (proving that he has the appropriate qualifications)
- certificate of the company's welding technology (to check whether the company can perform this type of weld)
- material certificate (to check whether the material from which we build the pipeline is appropriate)
- what types of post-weld examinations have been used and reports containing test results...  
and much much more other issues.  
I decided to store all this information in a database.  

The main goals of this project are:

1. Learning how to design a database.
2. Learning how to code and solve problems in Oracle database environment using PL/SQL.
3. After completing the project and designing a user-friendly application, it will probably be the first tool in the world to significantly facilitate and speed up the work of engineers on the construction site.  

## Built with
    
Oracle technology is used to design, populate and deploy main features.
    
### Tools:

* `Oracle Database 18c Express Edition`
* `PL/SQL`
* `SQL`
* `Data Modeler`
* `SQL Developer`  

## Getting started

### Prerequisites  
In order to use the project, you should install the database and the necessary software (in our case, it will be SQL Developer) on your computer. If you already have the above-mentioned software, go straight to creating a database user.

### Installing SQL Developer on Windows

After creation of free `Oracle Account` [click here](https://profile.oracle.com/myprofile/account/create-account.jspx), You can download SQL Developer from official Oracle's website [click here](https://www.oracle.com/database/sqldeveloper/technologies/download/) .  
Process of instalation is quite simple, but if You would have a problem [here](https://docs.oracle.com/en/database/oracle/sql-developer/22.2/rptug/sql-developer-concepts-usage.html#GUID-156BEBA3-2F9B-4CE0-8E91-728581FF46AB) is documentation on the subject.   

### Installing Oracle Database 18c on Windows 
In addition to SQL Developer you need to install the Oracle database. Here you have good tutorial how to install this software [click here](https://www.youtube.com/watch?v=oFKzUUOVX-I)  

### Creating a database user  
 
- Run SQL Developer
- Log in as the SYSTEM user
- Copy the code from [here](https://github.com/marcinpopielec/Pipelines_Construction_Database/blob/main/Generate%20Pipelines_Construction_Database/creating%20user%20'CONSTRUCTION'.sql) , paste and execute.  
  
![1](https://user-images.githubusercontent.com/44368998/228774309-0032ea76-f739-4c70-a7f9-3cea653f4ac7.png)  
We have created a user CONSTRUCTION with restricted privileges and with access password: 123 in the database.  
 
 - Click on the green cross in the "Connections" tab:  
 
 ![2](https://user-images.githubusercontent.com/44368998/228776242-49e0494b-0867-409b-bdec-5a783454084f.png)
 - enter the name as: "CONSTRUCTION@XEPDB1",
 - user name: "CONSTRUCTION",
 - password: 123,
 - set connection type as: TNS,
 - set Network alias as: XEPDB1,
 - click test,
 - in the lower left corner you should see Status: Success,
 - click Connect.  
   
 You can change the password using the command: ALTER USER CONSTRUCTION IDENTIFIED BY new_password;  
 
 ## Designing database   
I used `Data Modeler` to create a logical and physical database model. You can see [here](https://github.com/marcinpopielec/Pipelines_Construction_Database/blob/main/Model%20of%20Pipelines_Construction_Database.png).  
The database has been designed in accordance with the best practices. In most cases it meets requirements of the third normal form.  
It contains  defined relations between tables to keep consistency and integrity of data. The entire structure is designed so that all data from construction site can be easily stored and used for reporting and create as-built documentation.  
 
 ## Generating database 
To implement the database structure, please use the script I created: [script: generate_construction.sql](https://github.com/marcinpopielec/Pipelines_Construction_Database/blob/main/Generate%20Pipelines_Construction_Database/generate_construction.sql.sql), paste it in    worksheet of your created user and run this sript.  
You should already have the entire database created.  
To see a list of tables, find CONSTRUCTION@XEPDB1 on the left sidebar and then tables: 

![3](https://user-images.githubusercontent.com/44368998/228776865-bf3ca7be-3c56-4591-bd9b-cdb6e9e69dcb.jpg) 

## Populating database
I have prepared a script with sample data that can be loaded into the database.
You can find out [here](https://github.com/marcinpopielec/Pipelines_Construction_Database/blob/main/Populating%20Pipelines_Construction_Database/populate_CONSTRUCTION_Database.sql).  
Copy, paste it in worksheet and run.


 
 





