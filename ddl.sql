create database if not exists sakila; 

use sakila;

CREATE TABLE pais (
  id_pais INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ciudad (
  id_cuidad INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  id_pais INT,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE direccion (
  id_direccion INT PRIMARY KEY AUTO_INCREMENT,
  direccion VARCHAR(50) ,
  direccion2 VARCHAR(50),
  distrito  VARCHAR(20) ,
  id_cuidad INT,
  codigo_postal  VARCHAR(10) ,
  telefono  VARCHAR(20) ,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_cuidad) REFERENCES ciudad(id_cuidad)
);

CREATE TABLE empleado (
  id_empleado INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(40) ,
  apellidos VARCHAR(45),
  id_direccion  int ,
  imagen blob,
  email  VARCHAR(50) ,
  id_almacen  int,
  activo int,
  username VARCHAR(16) ,
  password VARCHAR(40) ,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

CREATE TABLE almacen (
  id_almacen INT PRIMARY KEY AUTO_INCREMENT,
  id_empleado_jefe INT,
  id_direccion  INT ,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_empleado_jefe) REFERENCES empleado(id_empleado)
);

CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  id_almacen INT ,
  nombre VARCHAR(45),
  apellidos VARCHAR(45),
  email  VARCHAR(50) ,
  id_direccion INT,
  activo INT,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen),
  FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

CREATE TABLE idioma (
  id_idioma INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE pelicula (
  id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(255),
  descripcion TEXT,
  anyo_lanzamiento  YEAR,
  id_idioma INT,
  id_idioma_original INT,
  duracion_alquiler INT,
  rental_rate decimal (4,2),
  duracion INT,
  replacement_cost decimal (5,2),
  clasificacion enum("G", "PG","PG-13","R", "NC-17"),
  caracteristicas_especiales set("Trailers", "Commentaries", "Deleted Scenes", "Behind the Scenes"),
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_idioma) REFERENCES idioma(id_idioma),
  FOREIGN KEY (id_idioma_original) REFERENCES idioma(id_idioma)
);

CREATE TABLE inventario (
  id_inventario INT PRIMARY KEY AUTO_INCREMENT,
  id_pelicula INT,
  id_almacen  INT ,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
  FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen)
);

CREATE TABLE actor (
  id_actor INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(45) ,
  apellidos  VARCHAR(45),
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pelicula_actor (
  id_actor INT,
  id_pelicula INT,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_actor, id_pelicula),
  FOREIGN KEY (id_actor) REFERENCES actor(id_actor),
  FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
);

CREATE TABLE categoria (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(45),
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pelicula_categoria (
  id_categoria INT,
  id_pelicula INT,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_categoria, id_pelicula),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
  FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
);

CREATE TABLE alquiler (
  id_alquiler INT PRIMARY KEY AUTO_INCREMENT,
  fecha_alquiler TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_inventario int,
  id_cliente int,
  fecha_devolucion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_empleado int,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_inventario) REFERENCES inventario(id_inventario),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE pago (
  id_pago INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente int,
  id_empleado int,
  id_alquiler int,
  total decimal(10,2),
  fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
  FOREIGN KEY (id_alquiler) REFERENCES alquiler(id_alquiler)
);

CREATE TABLE film_text (
	film_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255),
	description text
);

















