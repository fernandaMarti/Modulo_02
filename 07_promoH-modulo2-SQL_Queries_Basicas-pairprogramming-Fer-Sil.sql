-- Pair programming Queries Básicas
/* Durante la ejecución de estas sesiones de pair programming vamos a trabajar sobre la base de datos Northwind. 
Esta base de datos se basa en una empresa ficticia: Northwind Traders. Contiene información acerca de las transacciones 
de ventas entre la empresa y sus clientes así como detalles acerca de compras de la empresa a sus proveedores. 
Los datos que incluye la base de datos son: tablas de inventario, pedidos, clientes, información de las empleadas, etc. 
Historicamente ha sido la base de muchos tutoriales y libros sobre el aprendizaje y el uso de SQL.

1. Descarga la base de datos Northwind.

2. 
Crea el schema con nombre northwind en MySQL Workbench para importar la base de datos:

Abre MySql Workbench y accede al servidor de Adalab Server que creamos durante la instalación de MySQL - MySQL Workbench.

Ve a la pestaña de archivo, selecciona abrir script de SQL y abre el archivo NorthwindMySQL.sql que hemos descargado en el paso 2. 
Tras esto dale al icono del rayo para ejecutarlo. Al finalizar la ejecución se habrán creado las tablas necesarias para los 
ejercicios de pair programming.
*/

CREATE SCHEMA northwind;
USE northwind;

-- Ejecutamos el script northwindMySQL.sql

/* 3. Explora la estructura de la base de datos:

- La base de datos Northwind está compuesta por múltiples tablas con relaciones entre ellas. 
En este momento del curso lo más probable es que no dispongáis de los conocimientos necesarios 
para inspeccionar el script de creación de la base de datos y entenderlo. Aún así, os invito a que 
lo leais tranquilamente intentado haceros una idea de qué hace cada una de las instrucciones. 
Este ejercicio es interesante, porque al finalizar el curso podréis volver a hacerlo y os daréis 
cuenta de lo mucho que habéis avanzado.

- Una vez importada la base de datos, podéis utilizar MySQL Workbench para ir viendo qué tablas componen 
la base de datos y qué columnas/atributos tiene cada una de ellas. Así podréis interiorizar la estructura 
de Northwind y más adelante tendréis más facilidad a la hora de diseñar las consultas SQL sobre la base de datos.


4. Conociendo a las empleadas:

El objetivo de cualquier buena jefa (o trabajadora) en una empresa debería ser conocer bien a sus compañeras. 
Para lograrlo, vamos a diseñar una consulta SQL para obtener una lista con los datos de las empleadas y empleados 
de la empresa Northwind. Esta consulta incluirá los campos employee_id, last_name y first_name. */

SELECT id,last_name,first_name FROM employees;

/* 
5. Conociendo los productos más baratos:

Supongamos que en nuestro primer día en la empresa nos informan que están llevando a cabo una reestructuración del negocio. 
Nuestras compañeras nos comentan que, en estos momentos, Northwind tiene una amplia gama de productos en venta, algunos de 
los cuales tienen un éxito limitado entre las clientas.

Nuestra primera tarea consiste en identificar aquellos productos (tabla products) cuyos precios por unidad oscilen entre 0 y 5 dólares,
es decir, los productos más asequibles. */
 
 SELECT id, product_name,list_price 
 FROM products
 WHERE list_price <=5;
 
 SELECT id, product_name,list_price
 FROM products
 WHERE list_price BETWEEN 0 AND 5;
 
 
 /* 6. Conociendo los productos que no tienen precio:

Para comprobar si los datos en la tabla products están correctos, nos interesa seleccionar aquellos productos 
que no tengan precio, porque lo hayan dejado vacio al introducir los datos (NULL). */

SELECT id, product_name,list_price
FROM products
WHERE list_price IS NULL;

/* 7. Comparando productos:

Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, pero sólo aquellos que tienen un ID 
menor que 10 (para tener una muestra significativa pero no tener que ver todos los productos existentes).

💡 Pista 💡 Recuerda que podemos incluir varias condiciones en el WHERE. */

SELECT id, product_name, list_price
FROM products
WHERE list_price <15 AND id <10;


/* 8. Cambiando de operadores:

Ahora vamos a hacer la misma consulta que en ejercicio anterior, pero haciendo invirtiendo el uso de los operadores 
y queremos saber aquellos que tengan un precio superior a 15 dólares y un ID superior a 10..

💡 Pista 💡 Podemos usar NOT */


SELECT id, product_name, list_price
FROM products
WHERE list_price >15 AND id >10;

SELECT id, product_name, list_price
FROM products
WHERE list_price >15 AND NOT id <10;

/* 9. Conociendo los paises a los que vendemos:

A Northwind le interesa conocer los datos de los países que hacen pedidos (orders) para focalizar el negocio en esas regiones 
y al mismo tiempo crear campañas de marketing para conseguir mejorar en las otras regiones. 
Realiza una consulta para obtener ese dato. */

SELECT id, ship_country_region FROM orders;


/* 10. Conociendo el tipo de productos que vendemos en Northwind:

Crea una consulta que muestre los primeros 10 productos según su ID y que nos indique el nombre de dichos productos 
y sus precios. */

SELECT id, product_name,list_price
FROM products
ORDER BY id ASC
LIMIT 10;

/* 11. Ordenando los resultados:

Ahora realiza la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente.*/

SELECT id, product_name,list_price
FROM products
ORDER BY id DESC
LIMIT 10;


/* 12. Que pedidos tenemos en nuestra BBDD:

Últimamente ha habido algo de descontrol en la empresa a la hora de controlar los pedidos. Nos interesa conocer los distintos 
pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details). */

SELECT DISTINCT id, order_id,product_id
FROM order_details;

/* 13. Qué pedidos han gastado más:

Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa, desde la dirección nos piden conocer los 3 pedidos 
que han supuesto un mayor ingreso para la empresa. Crea una columna en esta consulta con el alias ImporteTotal. 
Nota: Utiliza unit_price y quantity para calcular el importe total. */

SELECT unit_price, quantity, unit_price*quantity AS importe_total
FROM order_details;


/* 14. Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking:

Ahora, no sabemos bien por qué razón, desde el departamento de Ventas nos piden seleccionar el 
ID de los pedidos situados entre la 5 y la 10 mejor posición en cuanto al coste económico total ImporteTotal.

💡 Pista 💡 Usa LIMIT y OFFSET para mostrar los resultados. */

SELECT order_id, unit_price*quantity AS importe_total
FROM order_details
ORDER BY importe_total ASC
LIMIT 5
OFFSET 4;

/* 15. Qué categorías tenemos en nuestra BBDD:

De cara a ver cómo de diversificado está el negocio, se nos solicita una lista de las categorías que componen 
los tipos de pedido de la empresa. Queremos que la lista de resultado sea renombrada como "NombreDeCategoria".*/

SELECT 





/* 16. Selecciona envios con retraso:

Nos hacen llegar desde la dirección la preocupación acerca del cumplimiento de las fechas de envío. 
Últimamente se están dando retrasos en muchas entregas y por ello se busca realizar la acción preventiva 
de enviar los paquetes con varios días adicionales de antelacion. Para comenzar a planear esos envíos anticipados, 
nos piden conocer cuál sería la fecha de envío (ShippedDate) de los pedidos almacenados en la base de datos, 
si estos sufrieran un retraso de 5 días. Nos piden mostrar la nueva fecha renombrada como FechaRetrasada.

💡 Pista 💡 Para realizar lo anterior, busca documentación de la función DATE_ADD para MySQL. */





/* 17. Selecciona los productos más rentables:

Gracias a un análisis realizado en los últimos meses en la empresa, se ha comprobado que el rango de productos que 
puede dar más beneficios parece ser el de aquellos con un precio mayor o igual a 15 dólares, pero menor o igual que 50 dólares. 
Selecciona los datos de ese rango de productos usando el operador BETWEEN. */







/* 18. Selecciona los productos con unos precios dados:

Queremos conocer los datos de los productos que tengan exactamente un precio de 18, 19 o 20 dólares 
(un rango muy concreto de precios del que la empresa quiere maximizar sus ventas en un futuro). 
Usa IN para conseguirlo de manera eficiente. */



