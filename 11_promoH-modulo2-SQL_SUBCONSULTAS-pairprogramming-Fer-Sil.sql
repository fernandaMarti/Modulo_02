
/*1. Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. 
Para eso nos pide que lo hagamos con una query correlacionada.*/
SELECT MAX(order_date)
FROM orders;

SELECT DISTINC(customer_number), MAX(order_date)
FROM orders;



/*2. Extraed el precio unitario máximo (unit_price) de cada producto vendido.
Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. 
De nuevo lo tendréis que hacer con queries correlacionadas.*/
SELECT * FROM northwind.order_details;
SELECT DISTINCT(product_id), unit_price
FROM order_details AS Od1
WHERE Od1.unit_price = (SELECT MAX(unit_price)
						FROM order_details AS Od2
						WHERE Od1.product_id = Od2.product_id);
/*3. Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". 
Devuelve el ID del producto, el nombre del producto y su ID de categoría.*/

/*4. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países
 para buscar proveedores adicionales.*/
 /*5. Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" 
(ProductID 6) en un solo pedido.*/
/*6. Extraed los 10 productos más caros
Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.*/
/*7.Qué producto es más popular
Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró.*/

