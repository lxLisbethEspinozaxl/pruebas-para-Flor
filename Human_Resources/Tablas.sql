USE master
GO
IF DB_ID('Human_Resources') IS NOT NULL
	DROP DATABASE [Human_Resources]
GO
CREATE DATABASE [Human_Resources]
 CONTAINMENT = NONE
 ON  PRIMARY ( 
	NAME = N'HumanRerources', 
	FILENAME = N'D:\BDII\HumanRerources.mdf',
	SIZE = 20480KB, 
	FILEGROWTH = 5120KB)
 LOG ON ( 
	NAME = N'HumanRerources_log', 
	FILENAME = N'D:\BDII\HumanRerources_log.Ldf', 
	SIZE = 5120KB, 
	FILEGROWTH = 2048KB)

GO
USE [Human_Resources]
GO

--PAISES
CREATE TABLE regions ( 
	region_id		INT -- CONSTRAINT  region_id_nn NOT NULL 
    , region_name	VARCHAR(25) 
	, CONSTRAINT reg_id_pk PRIMARY KEY (region_id)
)

CREATE TABLE countries ( 
	country_id		CHAR(2) -- CONSTRAINT	country_id_nn NOT NULL 
    , country_name	VARCHAR(40) 
    , region_id		INT
    , CONSTRAINT	country_c_id_pk PRIMARY KEY (country_id) 
	, CONSTRAINT	countr_reg_fk FOREIGN KEY (region_id) REFERENCES regions(region_id) 
) 

CREATE TABLE locations
    ( location_id    INT
    , street_address VARCHAR(40)
    , postal_code    VARCHAR(12)
    , city	VARCHAR(30)--	CONSTRAINT     loc_city_nn  NOT NULL
    , state_province VARCHAR(25)
    , country_id     CHAR(2)
	, CONSTRAINT loc_id_pk PRIMARY KEY (location_id)
    , CONSTRAINT loc_c_id_fk FOREIGN KEY (country_id) REFERENCES countries(country_id) 
)

CREATE TABLE departments
    ( department_id    INT
    , department_name  VARCHAR(30) --CONSTRAINT  dept_name_nn  NOT NULL
    , manager_id       INT
    , location_id      INT
	, CONSTRAINT dept_id_pk PRIMARY KEY (department_id)
    , CONSTRAINT dept_loc_fk FOREIGN KEY (location_id) REFERENCES locations (location_id)
)

CREATE TABLE jobs
    ( job_id         VARCHAR(10)
    , job_title      VARCHAR(35) --CONSTRAINT     job_title_nn  NOT NULL
    , min_salary     INT
    , max_salary     INT
	, CONSTRAINT job_id_pk PRIMARY KEY(job_id)
)

CREATE TABLE employees
    ( employee_id    INT
    , first_name     VARCHAR(20)
    , last_name      VARCHAR(25) --CONSTRAINT     emp_last_name_nn  NOT NULL
    , email          VARCHAR(25) --CONSTRAINT     emp_email_nn  NOT NULL
    , phone_number   VARCHAR(20)
    , hire_date      DATE --	CONSTRAINT     emp_hire_date_nn  NOT NULL
    , job_id         VARCHAR(10) --	CONSTRAINT     emp_job_nn  NOT NULL
    , salary         DECIMAL(8,2)
    , commission_pct DECIMAL(2,2)
    , manager_id     INT
    , department_id  INT
    , CONSTRAINT     emp_salary_min CHECK (salary > 0) 
    , CONSTRAINT     emp_email_uk UNIQUE (email)
	, CONSTRAINT     emp_emp_id_pk PRIMARY KEY (employee_id)
    , CONSTRAINT     emp_dept_fk FOREIGN KEY (department_id) REFERENCES departments
    , CONSTRAINT     emp_job_fk FOREIGN KEY (job_id) REFERENCES jobs (job_id)
    , CONSTRAINT     emp_manager_fk FOREIGN KEY (manager_id) REFERENCES employees
)

CREATE TABLE job_history
    ( employee_id   INT -- CONSTRAINT    jhist_employee_nn  NOT NULL
    , start_date    DATE -- CONSTRAINT    jhist_start_date_nn  NOT NULL
    , end_date      DATE --	CONSTRAINT    jhist_end_date_nn  NOT NULL
    , job_id        VARCHAR(10) --	CONSTRAINT    jhist_job_nn  NOT NULL
    , department_id INT
    , CONSTRAINT    jhist_date_interval CHECK (end_date > start_date)
	, CONSTRAINT	jhist_emp_id_st_date_pk PRIMARY KEY (employee_id, start_date)
    , CONSTRAINT	jhist_job_fk FOREIGN KEY (job_id) REFERENCES jobs
    , CONSTRAINT    jhist_emp_fk FOREIGN KEY (employee_id) REFERENCES employees
    , CONSTRAINT    jhist_dept_fk FOREIGN KEY (department_id) REFERENCES departments
    ) ;