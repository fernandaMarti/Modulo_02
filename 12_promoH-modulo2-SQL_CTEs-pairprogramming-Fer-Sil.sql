-- Pair programming CTE's


/* 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.

Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers.

Los resultados de esta query serán:

#   CustID  CompanyName
1   ALFKI     Alfreds Futterkiste  */

/*2. Selecciona solo los de que vengan de "Germany"

Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior, pero solo queremos los que pertezcan a "Germany".

Los resultados de esta query serán:

#   CustID  CompanyName
1   ALFKI     Alfreds Futterkiste  */

/* 3. Extraed el id de las facturas y su fecha de cada cliente.

En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.

📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).

Los resultados de esta query serán:

#   customer_id     company_name           order_id          order_date
1     ALFKI       Alfreds Futterkiste      10643		1997-08-25 00:00_00   */


/* 4. Contad el número de facturas por cliente

Mejoremos la query anterior. En este caso queremos saber el número de facturas emitidas por cada cliente.

Los resultados de esta query serán:

#   customer_id     company_name           numero_facturas
1     ALFKI       Alfreds Futterkiste           6              */

/* 5. Cuál la cantidad media pedida de todos los productos ProductID.

Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.

Los resultados de esta query serán: 

#   producto         media 
1   Alice Mutton     32.5909     */

/* BONUS: Estos ejercicios no es obligatorio realizarlos. Los podéis hacer más adelante para poder practicar las CTE´s.

6. Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo.

7. La empresa nos ha pedido que busquemos el nombre de cliente, su teléfono y el número de pedidos que ha hecho cada 
uno de ellos.

8. Modifica la consulta anterior para obtener los mismos resultados pero con los pedidos por año que ha hecho cada cliente.

9. Modifica la cte del ejercicio anterior, úsala en una subconsulta para saber el nombre del cliente y su teléfono, 
para aquellos clientes que hayan hecho más de 6 pedidos en el año 1998.

10. Nos piden que obtengamos el importe total (teniendo en cuenta los descuentos) de cada pedido de la tabla 
orders y el customer_id asociado a cada pedido. */
