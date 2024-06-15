SELECT * FROM alumno;
SELECT * FROM habitacion;
SELECT * FROM electrodomestico;

-- ================================== JOIN =========================================

SELECT * 
FROM alumno
JOIN habitacion
ON habitacion.id = id_de_habitacion;

SELECT nombre, numero_de_habitacion
FROM alumno
JOIN habitacion
ON habitacion.id = id_de_habitacion;

SELECT
  habitacion.id AS id_de_habitacion,
  numero_de_habitacion,
  camas,
  piso,
  electrodomestico.id AS id_de_electrodomestico,
  nombre
FROM habitacion
INNER JOIN electrodomestico
  ON electrodomestico.id_de_habitacion = habitacion.id;


  -- * LEFT JOIN te devuelve todas las filas de la 1ra tabla (La que esta antes de la instrucción JOIN)
  -- * y realiza el join, en caso de que una fila de la 1ra tabla no tenga coincidencias, devuelve null 
  -- * en la 2da tabla

SELECT *
FROM alumno
LEFT JOIN habitacion
ON habitacion.id = id_de_habitacion;

SELECT *
FROM electrodomestico
LEFT JOIN habitacion
ON habitacion.id = id_de_habitacion;

-- * RIGHT JOIN te devuelve todas las filas de la 2da tabla (La que esta después de la instrucción JOIN)
-- * y realiza el join, en caso de que una fila de la 2da tabla no tenga coincidencias, devuelve null 
-- * en la 1ra tabla

SELECT *
FROM alumno
RIGHT JOIN habitacion
ON habitacion.id = id_de_habitacion;

SELECT *
FROM habitacion
RIGHT JOIN alumno
ON habitacion.id = alumno.id_de_habitacion;

-- * FULL JOIN te devuelve todas las filas de ambas tablas regresando null cuando la fila de alguna tabla
-- * no tenga coincidencias
-- ? Por que no se puede realizar en algunas tablas?


-- Palabra OUTER es una parte que no se pone para abreviar ej. LEFT OUTER JOIN
SELECT *
FROM habitacion
RIGHT OUTER JOIN electrodomestico
ON habitacion.id = id_de_habitacion
WHERE electrodomestico.nombre = 'tetera';

-- * NATURAL JOIN te devuelve por default la combinación de las 2 tablas en base a las columnas que
-- * que tienen el mismo nombre

SELECT *
FROM alumno
NATURAL JOIN habitacion;



-- ============================= ALIAS ============================== --
-- Se hace para ahorrarse el escribir un poco definiendo el como se le llamara al momento de hacer el JOIN

SELECT
  e.id,
  e.nombre,
  h.numero_de_habitacion,
  h.camas
FROM electrodomestico AS e
INNER JOIN habitacion AS h
ON e.id_de_habitacion = h.id;

-- AUTOCOMBINACIÓN
-- También es posible aplicar un pequeño truco y combinar(JOIN) una tabla con la misma tabla
-- solo hay que poner un alias diferente ya que si no se hace de esta manera SQL no aceptara la
-- consulta

SELECT *
FROM alumno AS s1
JOIN alumno AS s2
  ON s1.id_de_habitacion = s2.id_de_habitacion
WHERE s1.nombre = 'Jack Pearson'
  AND s1.id != s2.id;


-- =========================================== COMBINANDO VARIAS TABLAS =========================================== --


SELECT *
FROM alumno AS s1
JOIN alumno AS s2
  ON s1.id_de_habitacion = s2.id_de_habitacion
JOIN habitacion
  ON s2.id_de_habitacion = habitacion.id
WHERE s1.nombre = 'Jack Pearson'
  AND s1.nombre != s2.nombre;

-- Para cada habitación con 2 camas en la que haya realmente 2 alumnos, 
-- queremos mostrar una fila que contenga las siguientes columnas:
-- 1.- El nombre del primer alumno.
-- 2.- El nombre del segundo alumno.
-- 3.- El número de la habitación.
-- No cambie ningún nombre de columna. Cada par de alumnos solo debe mostrarse una vez. 
-- El alumno cuyo nombre sea el primero en el alfabeto debe mostrarse primero.

SELECT s1.nombre, s2.nombre, numero_de_habitacion
FROM alumno AS s1
JOIN alumno AS s2
ON s1.id_de_habitacion = s2.id_de_habitacion
JOIN habitacion
ON s1.id_de_habitacion = habitacion.id
WHERE (s1.nombre < s2.nombre) AND  (camas = 2); -- Para que se muestre primero  
                                                -- "primero en el alfabeto" significa 
                                                -- "menor que" en los valores de texto.