-- Comenzando practica

-- Para seleccionar todo de la tabla coche
SELECT * FROM coche;

-- Para seleccionar una columna [marca] de la tabla coche 

SELECT marca FROM coche;

-- Para seleccionar multiples columnas [modelo, precio] de la tabla coche

SELECT modelo, precio FROM coche;

-- Para seleccionar datos de una columna en la cual se utilice WHERE para tener una coincidencia
SELECT * FROM coche WHERE fecha_de_produccion = 1999; -- En este caso para cuando la fecha sea 1999 se selecciona todo

-- Es posible usar otros operadores logicos con where como < > >= <= 
SELECT * FROM coche WHERE precio > 10000;

-- Tambien se puede usar != 
SELECT * FROM coche WHERE fecha_de_produccion != 1999;

-- Practica de lo aprendido

SELECT marca,modelo, fecha_de_produccion FROM coche WHERE precio <= 11300;

-- Operador OR 

SELECT vin FROM coche WHERE fecha_de_produccion < 2005 OR precio < 10000.00;

-- Operador AND
SELECT vin FROM coche WHERE fecha_de_produccion > 1999 AND precio < 7000.00;

-- Usar BETWEEN
SELECT vin, marca, modelo FROM coche WHERE fecha_de_produccion BETWEEN 1995 AND 2005;

-- Usar la negación NOT
SELECT vin, marca, modelo FROM coche WHERE fecha_de_produccion NOT BETWEEN 1995 AND 2005;

-- Combinar aun mas condiciones
SELECT vin FROM coche WHERE (fecha_de_produccion NOT BETWEEN 1999 AND 2005) AND (precio NOT BETWEEN 4000 AND 10000);

-- Utilizar cadenas de texto para buscar equivalencias exactas
SELECT * FROM coche WHERE marca = 'Ford';

-- Utilizar cadenas de texto para buscar equivalencias exactas a la primera letra
SELECT vin, marca, modelo FROM coche WHERE marca  LIKE 'F%'; -- % Simboliza 1 o más caracteres desconocidos
                                                            -- LIKE es en lugar de  '=' pero solo con valores de texto

-- EL % se puede utilizar en distintas posiciones ej. -> %A% que sera para cualquier considencia que tenga al menos una A en el texto
-- Tambien puede ser usado para cuando quieras saber los casos que terminen con una letra %s 
SELECT vin FROM coche WHERE modelo LIKE '%s';

-- Tambien se puede buscar un pedazo de cadena de texto sin necesariamente saber una letra
-- '_'  representa un caracter desconocido

SELECT * FROM coche WHERE marca LIKE 'Volk_wagen';

-- Buscando valores que NO sean nulos
SELECT * FROM coche WHERE precio IS NOT NULL;

-- Buscando valores que sean nulos
SELECT * FROM coche WHERE precio IS NULL;

-- Se debe de recordar que NULL != 0 
SELECT * FROM coche WHERE precio >= 0;


-------------------------------------------------------------------------------------------------------------
-- Es posible hacer operaciones dentro de parentesis del where
-- +, -, *, /

SELECT * FROM coche WHERE (precio * .20) > 2000;

--------Practica de lo aprendido-------------

SELECT * FROM coche 
WHERE (fecha_de_produccion BETWEEN 1999 AND 2005) 
AND (modelo != 'Volkswagen' AND (modelo LIKE 'P%' OR modelo LIKE 'F%')) 
AND (precio IS NOT NULL);


