-- ======================================= Subconsultas Independientes ======================================= --

-- Básicamente son consultas dentro de otras consultas, con el propósito de  evitar 
-- tener que hacer dos consultas por separados
ej. 

SELECT nombre
FROM ciudad
WHERE puntuacion = (
  SELECT
    puntuacion
  FROM ciudad
  WHERE nombre = 'París'
);
-- Se puede observar que la primera consulta sería la de entre parentesis para saber ña puntuacion de Paris
-- y la segunda para buscar otras ciudades donde la coincidencia de la puntuacion sea igual a la de paris

SELECT *
FROM ciudad
WHERE superficie = (
  SELECT
    superficie
  FROM ciudad
  WHERE nombre = 'París'
);

-- Tambien se pueden usar con operadores logicos

SELECT nombre
FROM ciudad
WHERE poblacion < (
  SELECT
    poblacion
  FROM ciudad
  WHERE nombre = 'Madrid'
);

-- Tambien se puede usar funciones en las subconsultas


SELECT *
FROM viaje
WHERE precio > (
  SELECT
    AVG(precio)
  FROM viaje);

-- Operador IN es equivalente a 1 OR 2 OR 3
SELECT *
FROM viaje_de_senderismo
WHERE dificultad IN (1, 2, 3);

--Ahora utilizando IN con subconsultas

SELECT * FROM viaje WHERE id_ciudad IN
(
  SELECT id
  FROM ciudad
  WHERE superficie > 100
);


-- Operador ALL  -> ej. > ALL quiere decir que sea mayor a todo lo que le sigue generalmente
-- la subconsulta en parentesis; tambien se puede usar con los otros operadores logicos

SELECT * FROM ciudad
WHERE poblacion < ALL 
(
  SELECT poblacion
  FROM pais
);


-- Operador ANY

SELECT * FROM viaje
WHERE precio = ANY
(
  SELECT precio
  FROM viaje_de_senderismo
);

-- ====================================== Subconsultas correlacionadas ================================= --

-- ! Las subconsultas pueden usar tablas de la consulta principal pero no inversamente, 
-- ! es decir que las consulta principal no puede usar tablas de la subconsulta

SELECT * FROM pais 
WHERE poblacion <= 
(
  SELECT MIN(poblacion) FROM ciudad WHERE ciudad.id_pais = pais.id 
);

-- Ahora con el operador ALL 
SELECT *
FROM viaje_de_senderismo viaje_principal
WHERE distancia >= ALL (
  SELECT distancia
  FROM viaje_de_senderismo viaje_secundario
  WHERE viaje_principal.id_montana = viaje_secundario.id_montana
); -- Para saber el viaje con mayor distancia para cada montaña

-- Ahora usando ANY

SELECT * FROM viaje
WHERE dias < ANY
(
  SELECT dias FROM viaje_de_senderismo
  WHERE viaje.precio = viaje_de_senderismo.precio
); -- Para seleccionar todos los viajes que duran lo menos que un viaje de senderismo y el precio sea el mismo

-- ======================================== Alias de Tablas =========================================== --
-- Normalmente usado cuando la consulta principal y la subconsulta utilizan la misma tabla

SELECT * FROM ciudad ciudad_principal
WHERE puntuacion > ( SELECT AVG(puntuacion) FROM ciudad media_ciudades
WHERE media_ciudades.id_pais = ciudad_principal.id_pais);


-- IN con subconsultas relacionadas
-- Nos permite especificar valores en la clausula WHERE
SELECT *
FROM viaje
WHERE id_ciudad IN (
  SELECT id FROM ciudad
  WHERE puntuacion < 4
);

-- ========================================== Operador EXISTS ========================================== --
-- Verifica si alguna fila cumple la condición


SELECT * FROM pais 
WHERE EXISTS
(
  SELECT *
  FROM montana
  WHERE montana.id_pais = pais.id
);

-- ========================================== EXISTS junto con NOT ========================================== --  

SELECT * FROM montana
WHERE NOT EXISTS 
(
  SELECT * FROM viaje_de_senderismo
  WHERE id_montana = montana.id
);

-- ============================================ Usando subconsultas en FROM =================================== --

SELECT * 
FROM montana, (SELECT * FROM pais WHERE poblacion >= 50000) AS pais_montanoso
WHERE montana.id_pais = pais_montanoso.id;-- Muestra las montañas junto con su país en donde al menos el pais tenga 50000 habitantes 

-- Ahora eligiendo columnas en especifico
SELECT distancia, altura FROM viaje_de_senderismo, (SELECT * FROM montana WHERE altura >=3000) AS altura_montana
WHERE viaje_de_senderismo.id_montana = altura_montana.id; -- Seleccionando la distancia y altura de viajes de senderismo donde
                                                          -- la montaña al menos tiene 3000 metros de altura

-- Ahora usando dentro de SELECT de las columnas a seleccionar

SELECT nombre, (SELECT COUNT(*) FROM viaje_de_senderismo WHERE id_montana = montana.id) AS numero
FROM montana; -- Se esta seleccionando e numero de viajes por montaña junto al nombre de la montaña
