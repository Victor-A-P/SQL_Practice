-- Seleccionando varias tablas n° de filas de una tabla por las n° de la otra ej 4 id y 8 pelis = 40 fiLAS

SELECT * FROM pelicula, director;

-- Seleccionando para evitar resultados repetidos
SELECT * FROM pelicula, director WHERE pelicula.id_del_director = director.id;


-- Utilizando JOIN ... ON para especificar

SELECT * FROM pelicula JOIN director ON pelicula.id_del_director = director.id;

-- Seleccionando Columnas especificas

SELECT director.nombre, pelicula.titulo FROM pelicula JOIN director ON pelicula.id_del_director = director.id;

-- Cuando in identificador de alguna columna es unico y no se repite en ninguna otra tabla, entonces se puede
-- omitir la tabla. 
SELECT nombre, titulo FROM pelicula JOIN director ON pelicula.id_del_director = director.id;

-- Renombrando el como se muestra el nombre de las columnas en las consultas usando 'AS'

SELECT 
nombre,
titulo AS titulo_de_pelicula 
FROM pelicula 
JOIN director 
ON pelicula.id_del_director = director.id;


-- Haciendo consultas de tablas combinadas con columnas especificas con cierto criterio

SELECT * FROM pelicula JOIN director ON pelicula.id_del_director = director.id WHERE fecha_de_produccion >= 2000;

-- Ahora se utiliza LIKE

SELECT * FROM pelicula JOIN director ON pelicula.id_del_director = director.id WHERE nombre LIKE 'Steven%';

-- PRacticando lo aprendido
SELECT 
pelicula.titulo,
pelicula.fecha_de_produccion,
director.nombre,
director.fecha_de_nacimiento AS nacido_en
FROM pelicula 
JOIN director
ON pelicula.id_del_director = director.id
WHERE (pelicula.fecha_de_produccion - director.fecha_de_nacimiento) < 40;

SELECT 
pelicula.id,
titulo,
fecha_de_produccion AS producida_en,
nombre,
fecha_de_nacimiento AS nacido_en
FROM pelicula 
JOIN director
ON pelicula.id_del_director = director.id
WHERE (titulo LIKE '%a%' AND fecha_de_produccion > 2000) OR (fecha_de_nacimiento BETWEEN 1945 AND 1995);
