-- Pair Programming 

/*En esta sesión crearemos una nueva BBDD desde 0 💪🏽! Supongamos que tenemos una tienda de zapatillas y que 
durante mucho tiempo hemos ido recopilando mucha información sobre nuestros empleados, las zapatillas que tenemos, 
los clientes y todas las facturas que hemos emitido. Nuestra información puede que este un poco desordenada y empieza 
a ser un poco complicado gestionar toda esa información, por lo que hemos decidido crearnos una BBDD en SQL. 
Para ello crearemos 4 tablas en la BBDD: Empleados, Clientes, Facturas,Zapatillas

La tabla Facturas tiene una relación con la tabla Empleados y la tabla Clientes y la tabla Zapatillas. 
Estas tres últimas no tienen ninguna relación entre ellas.

Tabla Zapatillas: tiene 3 columnas: id_zapatilla, modelo, color con las siguientes características:
	- id_zapatilla: es una clave primaria de tipo int, autoincremental y no nula.
	- modelo: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- color: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.

Tabla Clientes: tiene 9 columnas id_cliente, nombre, numero_telefono, email, direccion, ciudad, provincia, pais, codigo_postal con las siguientes características:
	- id_cliente: es una clave primaria de tipo int, autoincremental y no nula.
	- nombre: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- numero_telefono: es integer, no nula.
	- email: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- direccion: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- ciudad: es una cadena de caracteres de longitud máxima de 45 caracteres, puede ser nula.
	- provincia: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- pais: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- codigo_postal: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.

Tabla Empleados: tiene 5 columnas id_empleado, nombre, tienda, salario, fecha_incorporacion con las siguientes características:
	- id_empleado: es una clave primaria de tipo int, autoincremental y no nula.
	- nombre: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- tienda: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- salario: es int, puede ser nula.
	- fecha_incorporacion: es una columna de tipo date, no nula.

Tabla Facturas: tiene 6 columnas id_factura ,numero de factura, fecha, id_empleado, id_cliente, id_zapatilla, con las siguientes características:
	- id_factura: es una clave primaria de tipo int, autoincremental y no nula.
	- numero_factura: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- fecha: es una columna de tipo date, no nula.
	- id_zapatilla: es una clave foránea de tipo int, no nula
	- id_empleado: es una clave foránea de tipo int, no nula.
	- id_cliente: es una clave foránea de tipo int, no nula.

📌 NOTA En esta última tabla tendremos que incluir todos los CONSTRAINT necesarios para establecer 
los relaciones entre las tablas, donde tendremos que especificar: Foreign Key References

📌 NOTA Este ejercicio es incremental, es decir, cada día vamos a ir añadiendo las nuevas funcionalidades que hemos aprendido. */

CREATE SCHEMA `tienda_zapatillas`;

USE `tienda_zapatillas`;

/* 1) Tabla Zapatillas: tiene 3 columnas: id_zapatilla, modelo, color con las siguientes características: 
	- id_zapatilla: es una clave primaria de tipo int, autoincremental y no nula.
    - modelo: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- color: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula. */
    
    CREATE TABLE zapatillas (
    id_zapatilla INT AUTO_INCREMENT,
    modelo VARCHAR (45) NOT NULL,
    color VARCHAR (45) NOT NULL,
    PRIMARY KEY (id_zapatilla)
	);
    
      
/* 2) Tabla Clientes: tiene 9 columnas id_cliente, nombre, numero_telefono, email, direccion, ciudad, provincia, pais, codigo_postal con las siguientes características:
	- id_cliente: es una clave primaria de tipo int, autoincremental y no nula.
	- nombre: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- numero_telefono: es integer, no nula.
	- email: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- direccion: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- ciudad: es una cadena de caracteres de longitud máxima de 45 caracteres, puede ser nula.
	- provincia: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- pais: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- codigo_postal: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.*/
    
    CREATE TABLE clientes (
    
    id_cliente INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_cliente)
    
    );

/* 3) Tabla Empleados: tiene 5 columnas id_empleado, nombre, tienda, salario, fecha_incorporacion con las siguientes características:
	- id_empleado: es una clave primaria de tipo int, autoincremental y no nula.
	- nombre: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- tienda: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- salario: es int, puede ser nula.
	- fecha_incorporacion: es una columna de tipo date, no nula.*/
    
    CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY (id_empleado)
          
    );

/* Tabla Facturas: tiene 6 columnas id_factura ,numero de factura, fecha, id_empleado, id_cliente, id_zapatilla, con las siguientes características:
	- id_factura: es una clave primaria de tipo int, autoincremental y no nula.
	- numero_factura: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	- fecha: es una columna de tipo date, no nula.
	- id_zapatilla: es una clave foránea de tipo int, no nula
	- id_empleado: es una clave foránea de tipo int, no nula.
	- id_cliente: es una clave foránea de tipo int, no nula. */
    
    CREATE TABLE facturas (
    id_factura INT AUTO_INCREMENT NOT NULL,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla_fact INT NOT NULL,
    id_empleado_fact INT NOT NULL,
    id_cliente_fact INT NOT NULL,
    PRIMARY KEY (id_factura),
    CONSTRAINT FK_id_zapatilla FOREIGN KEY (id_zapatilla_fact) REFERENCES zapatillas (id_zapatilla),
    CONSTRAINT FK_id_empleado FOREIGN KEY (id_empleado_fact) REFERENCES empleados (id_empleado),
    CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente_fact) REFERENCES clientes (id_cliente)
        
    );
   

    