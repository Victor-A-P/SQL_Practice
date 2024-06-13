-- Utilizando ORDER BY para ordenar por una columna determinada del menor al mayor
SELECT * FROM empleados ORDER BY salarios;

-- ORDER BY se puede combinar con WHERE sin problemas
SELECT * FROM empleados WHERE fecha =2011 ORDER BY salario;

-- Ascendente y descendente
SELECT * FROM empleados WHERE fecha =2011 ORDER BY salario ASC; -- Ascendente

SELECT * FROM empleados ORDER BY apellido DESC; --Descendente

-- Ordenando en base a varias columnas

SELECT * FROM empleados ORDER BY departamento ASC, salario DESC;


SELECT fecha FROM empleados; -- -> Esto hará que se muestren todas las veces que aparece la fecha

-- Pero si queremos que aparezca una sola vez
SELECT DISTINCT fecha FROM empleados;

-- Evitando repeticiones en varias columnas
SELECT DISTINCT departamento, puesto FROM empleados;


-- ==================================================== ESTADÍSTICAS ==================================================== --

-- Funciones  -------> funcion()

-- COUNT() Calcula el número de filas especificado en el parentesis
-- Es decir que cuenta el numero de filas en lugar de mostrar los datos com tal
SELECT COUNT(*) FROM empleados; -- > Todas las filas que hay

SELECT COUNT(DISTINCT puesto) AS puestos_distintos FROM empleados; -- >solo el numero de filas que son diferentes

-- MIN y MAX
SELECT MIN(salario) FROM empleados;
SELECT MAX(salario) FROM empleados;

--Promedio de la columna AVG()
SELECT AVG(salario) FROM empleados WHERE fecha =2013;

-- Suma de valores(total) SUM()
SELECT SUM(salario) FROM empleados WHERE (departamento = 'Marketing') AND (fecha = 2014);

-- Agrupandolos con GROUP BY

SELECT departamento, COUNT(DISTINCT nombre) AS numero_de_empleados 
FROM empleados WHERE fecha = 2013 GROUP BY departamento;

-- MIN y MAX de Grupos

-- Es posible combinar GROUP BY con otras funciones

SELECT departamento, MAX(salario), MIN(salario) 
FROM empleados WHERE fecha = 2014 GROUP BY departamento; 

SELECT departamento, AVG(salario) FROM empleados WHERE fecha = 2015 GROUP BY departamento;


-- Agrupar por varias columnas
SELECT nombre, apellido, AVG(salario) FROM empleados GROUP BY apellido, nombre;

-- Filtrar Grupos


-- ! Las Clausulas de SQL tiene una jerarquía u orden correcto --

-- ! 1.- FROM
-- ! 2.- WHERE
-- ! 3.- GROUP BY
-- ! 4.- HAVING
-- ! 5.- SELECT
-- ! 6.- ORDER BY
-- ! 7.- LIMIT


SELECT nombre, apellido, COUNT(DISTINCT fecha) AS fechas 
FROM empleados 
GROUP BY apellido,nombre 
HAVING COUNT(DISTINCT fecha) > 2;


SELECT departamento, AVG(salario) 
FROM empleados
WHERE fecha = 2012 
GROUP BY departamento
HAVING AVG(salario) > 3000;

-- Es posible ordenar los grupos
SELECT nombre, apellido, SUM(salario) FROM empleados GROUP BY apellido, nombre ORDER BY SUM(salario) DESC;

SELECT apellido, nombre, AVG(salario) AS salario_medio, COUNT(DISTINCT fecha) AS fechas_trabajados
FROM empleados
GROUP BY apellido, nombre
HAVING COUNT(DISTINCT fecha) > 2
ORDER BY AVG(salario) DESC;
