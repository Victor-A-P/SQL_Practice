SELECT * FROM ciclismo;
SELECT * FROM patinaje;

-- ========================== FUNCIÓN UNION ==================== --
-- Sirve par combinar los resultados de dos o mas consultas

-- ! Para que se puedan combinar los resultados es necesario que ambas tablas tengan el mismo 
-- ! numero de columnas y tengan almacenado el mismo tipo de información ( int  y int || string y string)

SELECT * FROM ciclismo
WHERE fecha BETWEEN 2010 AND 2014
UNION
SELECT * FROM patinaje
WHERE fecha BETWEEN 2010 AND 2014;

-- Seleccionando toda la información de las medallas ganadas en ambas disciplinas en un periodo de tiempo

SELECT pais FROM ciclismo
UNION ALL 
SELECT pais FROM patinaje; --Esta te muestra todo los paises que han ganado alguna medalla en cualquiera de las disciplinas
                           -- incluyendo repeticiones si es que ha habido personas que ganan en ambas.


-- ========================== FUNCIÓN INTERSECT ==================== --

-- En este caso te mostrará información en la cual ambas tablas coinciden, 
-- es decir solo datos que tengan igual, ejemplo si ambos tienen el pais alemania

SELECT persona FROM ciclismo
INTERSECT
SELECT persona FROM patinaje; -- En este caso se esta pidiendo que se muestre el nombre de 
                              -- algún deportista que haya ganado en ambas disciplinas

-- ========================== FUNCIÓN EXCEPT ==================== --

SELECT pais FROM ciclismo
EXCEPT
SELECT pais FROM patinaje; -- Se esta pidiendo que se muestre los paises que tiene medallas de ciclismo solo si no 
                           -- a excepcion de los que tambien tienen medalla en patinaje

