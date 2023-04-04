-- Creación de BD --

drop schema if exists Compra;
create schema IF NOT EXISTS Compra;
use Compra;

drop table if exists  categoria;
drop table if exists  delivery;
drop table if exists  estacionalidad;
drop table if exists  estado;
drop table if exists  madurez;
drop table if exists  orden;
drop table if exists  presentacion;
drop table if exists  producto;
drop table if exists  productosorden;
drop table if exists  stock;
drop table if exists  tamano;
drop table if exists  usuario;



create table IF NOT EXISTS usuario (
idUsuario INT auto_increment not null primary key,
nombre VARCHAR(40) not null,
apellido VARCHAR(40) not null,
telefono numeric not null,
mail VARCHAR(70) not null,
direccion VARCHAR(70) not null
);

create table IF NOT EXISTS tamano (
idTamano INT auto_increment not null primary key,
descripcionTamano VARCHAR(40)
);

create table IF NOT EXISTS presentacion (
idPresentacion INT auto_increment not null primary key,
descripcionPresentacion VARCHAR(40)
);

create table IF NOT EXISTS madurez (
idMadurez INT auto_increment not null primary key,
descripcionMadurez VARCHAR(40)
);

create table IF NOT EXISTS estacionalidad (
idEstacionalidad INT auto_increment not null primary key,
descripcionEstacionalidad VARCHAR(40)
);

create table IF NOT EXISTS categoria (
idCategoria INT auto_increment not null primary key,
descripcionCategoria VARCHAR(40)
);

create table IF NOT EXISTS producto (
idProduct INT auto_increment not null primary key,
nombreProducto VARCHAR(40) not null,
imagenProducto VARCHAR(500) not null,
precioProducto numeric (10,2) not null,
costoProducto numeric (10,2) not null,
idCategoria INT not null,
idEstacionalidad INT not null,
idPresentacion INT not null,
foreign key (idCategoria) references categoria(idCategoria),
foreign key (idEstacionalidad) references estacionalidad(idEstacionalidad),
foreign key (idPresentacion) references presentacion(idPresentacion)
);

create table IF NOT EXISTS stock (
idStock INT auto_increment not null primary key,
idProduct INT not null,
numeroStock numeric,
foreign key (idProduct) references producto(idProduct)
);

create table IF NOT EXISTS delivery (
idDelivery INT auto_increment not null primary key,
deliveryDate DATE not null
);

create table IF NOT EXISTS estado (
idStatus INT auto_increment not null primary key,
descripcionStatus varchar(40) not null
);

create table IF NOT EXISTS orden (
idOrder INT auto_increment not null primary key,
idUsuario INT not null,
idDelivery INT not null,
idStatus INT not null,
foreign key (idUsuario) references usuario(idUsuario),
foreign key (idDelivery) references delivery(idDelivery),
foreign key(idStatus) references estado(idStatus)
);

create table IF NOT EXISTS productosOrden (
idProductosOrden INT auto_increment not null primary key,
idOrder INT not null,
idProduct INT not null,
idTamano INT,
idMadurez INT,
cantidad numeric not null,
foreign key (idOrder) references orden(idOrder),
foreign key (idProduct) references producto(idProduct),
foreign key (idTamano) references tamano(idTamano),
foreign key (idMadurez) references madurez(idMadurez)
);