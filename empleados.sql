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


