-- Comenzando practica

-- Para seleccionar todo de la tabla coche
SELECT * FROM coche;

-- Para seleccionar una columna [marca] de la tabla coche 

SELECT marca FROM coche;

-- Para seleccionar multiples columnas [modelo, precio] de la tabla coche

SELECT modelo, precio FROM coche;

-- Para seleccionar datos de una columna en la cual se utilice WHERE para tener una coincidencia
SELECT * FROM coche WHERE fecha_de_produccion = 1999; -- En este caso para cuando la fecha sea 1999 se selecciona todo