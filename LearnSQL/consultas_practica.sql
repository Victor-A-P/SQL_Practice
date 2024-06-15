-- Trabajando con tabla de  Horoscopos
-- ? 1.- Seleccione todas las columnas de los horóscopos de Piscis y Acuario del 2010 al 2014.

SELECT * FROM horoscopo WHERE signo LIKE 'Piscis' AND (fecha BETWEEN 2010 AND 2014)
UNION
SELECT * FROM horoscopo WHERE signo LIKE 'Acuario' AND (fecha BETWEEN 2010 AND 2014);

SELECT * FROM horoscopo WHERE (signo LIKE 'Acuario' OR signo LIKE 'Piscis') AND (fecha BETWEEN 2010 AND 2014);


-- Trabajando con tablas de mascotas y dueños

SELECT 
mascota.nombre,
mascota.tipo,
mascota.fecha_de_nacimiento AS fecha_de_nacimiento_de_la_mascota,  
propietario.nombre,
propietario.fecha_de_nacimiento AS fecha_de_nacimiento_del_propietario 
FROM mascota
JOIN propietario
ON mascota.id_del_propietario = propietario.id
WHERE mascota.nombre LIKE 'M%';

-- Trabajando con tabla de ensayos

SELECT persona, COUNT(id) AS numero_de_ensayos, AVG(puntos) AS media_puntos
FROM ensayo
GROUP BY persona
HAVING  AVG(puntos) > 80;

-- Trabajando con tablas de entrenador y jugador
-- 4.- Muestre todos los entrenadores junto con los jugadores a los que entrenan, muestre todas las
-- columnas de las tablas de entrenadores y jugadores. Muestre los entrenadores que están desempleados y, 
-- para ellos, ponga NULL en lugar de los datos de los jugadores. 

SELECT *
FROM entrenador
LEFT JOIN jugador
ON id_jugador = jugador.id;

-- Trbajando con tablas de prision
-- Muestre todas las columnas de las prisiones en las que haya, 
-- al menos, un presidiario mayor de 50 años.
SELECT * 
FROM prision 
WHERE EXISTS
(SELECT * FROM presidiario WHERE edad > 50 AND (prision.id = presidiario.id_prision));


-- Trabajando con tablas de dieta

SELECT * FROM producto_sin_gluten
INTERSECT
SELECT * From producto_vegetariano; 


--Final de articulos de tienda

SELECT 
cliente.id AS id_cli,
cliente.nombre AS nombre_de_cli,
(SELECT MAX(compra.id) FROM compra WHERE compra.id_cliente = cliente.id) AS ultimo_id_de_compra,
(SELECT SUM(cantidad) FROM articulo_comprado 
WHERE id_compra IN(SELECT id FROM compra WHERE id_cliente = cliente.id)) AS todos_los_articulos_comprados
FROM cliente ;
