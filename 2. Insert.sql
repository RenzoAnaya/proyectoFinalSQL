-- Insertado de data a tablas --

insert into usuario (nombre, apellido, telefono, mail, direccion) values
("Juan", "Dominguez", "947888444","reree@gmail.com", "Avenida Juan chavez 543"),
("Juana", "Martinez", "987654622","dfdfdf@gmail.com", "Jiron calua 333"),
("Elsa", "Bordelmar", "987654322","sdsdsd@gmail.com", "Calle gamarra 1010"),
("Jaime", "Perez", "987654623","hola@gmail.com", "Calle humberto cienaga 870"),
("Raul", "Lopez", "987654323","gfgdsf@gmail.com", "Avenida San Cristobal 2010");

insert into tamano (idTamano, descripcionTamano) values
(1, "Pequeño"),
(2, "Mediano"),
(3, "Grande");

insert into presentacion (idPresentacion, descripcionPresentacion) values
(1, "1 kilo"),
(2, "500gr"),
(3, "250gr"),
(4, "100gr");

insert into madurez (idMadurez, descripcionMadurez) values
(1, "Por madurar"),
(2, "Madura");

insert into estacionalidad (idEstacionalidad, descripcionEstacionalidad) values
(1, "Sí está en temporada"),
(2, "No está en temporada");

insert into categoria (idCategoria, descripcionCategoria) values
(1, "Fruta"),
(2, "Verdura"),
(3, "Fruto Seco");

insert into producto (idProduct, nombreProducto, imagenProducto, precioProducto, costoProducto, idCategoria, idEstacionalidad, idPresentacion) values
(1, "Fresa", "fkjdsnfkljsdhflk32497h","10","5","1", "2","2"),
(2, "Melón", "fdkjnsf987423nklj","10","4","2", "1","1"),
(3, "Camote", "dnmsa9d93whndojkw","2","1","2", "1","1"),
(4, "Palta", "dnsaidnas8dnlanm","17","10","1", "1","1"),
(5, "Maní", "dñasmd9swdsja9sdn","20","13","3", "1","4");

insert into stock (idStock, idProduct, numeroStock) values
(1, "1", "5"),
(2, "2", "7"),
(3, "3", "4"),
(4, "4", "5"),
(5, "5", "3");

insert into delivery (idDelivery, deliveryDate) values
(1, "2023-02-08"),
(2, "2023-02-09"),
(3, "2023-02-10");

insert into estado (idStatus, descripcionStatus) values
(1,"pendiente"),
(2,"terminado"),
(3,"con problemas");

insert into orden (idOrder, idUsuario, idDelivery, idStatus) values
(1, "2","1",1),
(2, "1","1",2),
(3, "3","2",3),
(4, "4","2",3),
(5, "5","2",2),
(6, "3","2",2),
(7, "3","2",3),
(8, "4","2",2),
(9, "4","2",1),
(10, "2","2",2);

insert into productosOrden (idOrder, idProduct, idTamano, idMadurez, cantidad) values
("1","1", null, null, "1"),
("1","2", "2", null, "2"),
("1","3", null, null, "6"),
("1","4", "2", "1", "5"),
("2","1", null, null, "1"),
("2","3", null, null, "4"),
("2","4", "3", "2", "1"),
("3","2", "1", null, "3"),
("3","1", null, null, "1"),
("4","3", null, null, "2"),
("4","5", null, null, "1");