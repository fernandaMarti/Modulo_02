-- Pair programming Union Tablas (Joins)

/* Nota: en estos ejercicios tenemos que poner en práctica todo lo aprendido hasta este momento. Además de tener que realizar 
uniones entre tablas, también tendrás que hacer agrupaciones de los datos y ordenarlos en base a alguna de sus columnas. 
Seguimos trabajando sobre la base de datos Northwind.Pista es importante observar detenidamente la tabla de ejemplo de 
los ejercicios, para poder saber qué tablas tenemos que unir para obtener un resultado similar. */

-- Ejercicios


/* 1. Pedidos por empresa en UK:

Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos 
conocer cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa 
y el número de pedidos.

Deberéis obtener una tabla similar a esta:

Nombre_empresa   Identificador  NumeroPedidos

*/

SELECT C.CompanyName,C.CustomerID,COUNT(O.OrderID)
FROM customers AS C
INNER JOIN orders AS O
ON C.CustomerID = O.CustomerID
WHERE O.ShipCountry ='UK'
GROUP BY C.customerID;


/* Productos pedidos por empresa en UK por año:

Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos 
una serie de consultas adicionales. La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos 
ha pedido cada empresa cliente de UK durante cada año. Nos piden concretamente conocer el nombre de la empresa, el año, 
y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.

El resultado será una tabla similar a esta:

NombreEmpresa   Año    NumObjetos */

SELECT customers.CompanyName, YEAR(orders.OrderDate), SUM(orderdetails.Quantity)
FROM customers
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID
INNER JOIN orderdetails
ON orderdetails.OrderID = orders.OrderID
WHERE customers.Country = 'UK'
GROUP BY customers.CompanyName, YEAR(orders.OrderDate);


/* Mejorad la query anterior:

Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que han pedido 
por esa cantidad de objetos, teniendo en cuenta los descuentos, etc. Ojo que los descuentos en nuestra tabla nos salen 
en porcentajes, 15% nos sale como 0.15.

La tabla resultante será:

NombreEmpresa  Año NumObjetos  DineroTotal */






/* BONUS: Pedidos que han realizado cada compañía y su fecha:

Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, desde la central 
nos han pedido una consulta que indique el nombre de cada compañia cliente junto con cada pedido que han realizado y su fecha.

El resultado deberá ser:

OrderID   CompanyName  OrdenDate  */





/* BONUS: Tipos de producto vendidos:

Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y 
el nombre del producto, y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).

Pista Necesitaréis usar 3 joins.

CategoriaID   CategoryName  ProductName   ProductSales  */









/* Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente, 
los ID de sus pedidos y las fechas.

Los resultados deberán similares a la siguiente tabla:

OrdenID  CompanyName  OrderDate  */







/* Pedidos por cliente de UK:

Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de pedidos que ha realizado cada 
cliente del propio Reino Unido de cara a conocerlos mejor y poder adaptarse al mercado actual. Especificamente nos piden 
el nombre de cada compañía cliente junto con el número de pedidos.

La tabla resultante será:

NombreCliente NumeroPedidos  */









/* Empresas de UK y sus pedidos:

También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino Unido (tengan pedidos o no) junto con los ID de todos los pedidos que han realizado y la fecha del pedido.

Los resultados de la query deberán ser:

OrderID  NombreCliente  FechaPedido   */









/* Empleadas que sean de la misma ciudad:

Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas 
las empleadas y sus supervisoras. Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de 
las jefas. Investiga el resultado, ¿sabes decir quién es el director?

La tabla resultado de la query deberá ser:

city NonbreEmpleado ApellidoEmpleado  city NombreJefe ApellidoJefe  */









/* BONUS: FULL OUTER JOIN

Pedidos y empresas con pedidos asociados o no:

Selecciona todos los pedidos, tengan empresa asociada o no, y todas las empresas tengan pedidos asociados o no. 
Muestra el ID del pedido, el nombre de la empresa y la fecha del pedido (si existe).

La tabla resultado deberá similar a:

OrderID NombreCliente FechaPedido */



