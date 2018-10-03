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

/* Ejercicio 01*/
select l.location_id , l.street_address , l.city , l.state_province , c.country_name from locations as l join countries as c on l.country_id = c.country_id

/* Ejercicio 02*/
select e.last_name , d.department_id , d.department_name from employees as e left join departments AS
d on e.department_id = d.department_id order by d.department_name;

/* Ejercicio 03*/
select e.last_name , e.department_id, j.job_title, d.department_name , l.city from employees AS
e left join jobs as j on e.job_id = j.job_id join departments as d on e.department_id=d.department_id join locations AS
l on d.location_id = l.location_id where l.city='Toronto';

/* Ejercicio 04*/
SELECT e.employee_id 'ID Empleado', e.last_name 'Empleado', m.employee_id 'ID Manager', m.last_name 'Manager' FROM
employees e join employees m ON (e.manager_id = m.employee_id)


/* Ejercicio 05*/
SELECT e.employee_id 'ID Empleado', e.last_name 'Empleado', m.employee_id 'ID Manager', m.last_name 'Manager' FROM
employees e left outer join employees m ON (e.manager_id = m.employee_id)


/* Ejercicio 06*/
select e.department_id 'DEPARTMENTO', e.last_name 'EMPLEADO', d.last_name 'COLEGA' from employees e join employees d
ON (e.department_id=d.department_id) and e.last_name!=d.last_name;









