/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
go
select 'Sueldos Soñados'=(last_name + 'gana' + Cast(salary as varchar(18)) + 'pero quisiera' + Cast((salary * 3) as varchar(18)))
from dbo.employees
go
select last_name, hire_date as Revision from employees
where hire_date between '2003-06-17' and '2005-09-21';
go
select e.last_name, e.hire_date, DateName(WEEKDAY, jh.START_DATE)as 'Dia'
from employees as e inner join job_history as jh on
e.employee_id=jh.employee_id
GO


/* Ejercicio 04*/
select last_name as 'Apellidos', 'Comision'='Sin Comision' from dbo.employees where 
commission_pct != 0 UNION select last_name as 'Apellidos', 'Comision'= Cast((salary * commission_pct) 
as varchar(20)) from dbo.employees where commission_pct >0



/* Ejercicio 06*/
select e.last_name as 'Apellidos', j.job_title, case when j.job_id = 'AD PRES' THEN 'A' 
when j.job_id = 'ST_MAN' THEN 'B' when j.job_id = 'IT_PROG' THEN 'C' when j.job_id = 'SA REP' 
THEN 'D' else '0' END as 'Grados' from dbo.employees as e inner join dbo.jobs 
as j on e.job_id=j.job_id 

