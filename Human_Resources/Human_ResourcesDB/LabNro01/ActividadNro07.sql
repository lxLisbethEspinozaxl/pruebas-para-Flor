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
 select round (max(salary),0) as "Maximo", round (min(salary),0) as
 "Minimo", round(sum(salary),0)as "Sumatoria",round (avg(salary),0)as "Promedio" from employees;


/* Ejercicio 03*/
select count (*) from employees group by job_id;


/* Ejercicio 04*/
select count (distinct manager_id) as "Numero de Administradores" from employees;

/* Ejercicio 05*/
 select (max(salary)-min(salary)) as "Diferencia" from employees;

/* Ejercicio 06*/
select salman.minimo, salman.manager_id from(select min(salary)as 'Minimo',manager_id from employees
where salary>6000 group by manager_id) as salman order by salman.minimo;









