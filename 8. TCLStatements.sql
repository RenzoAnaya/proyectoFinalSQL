-- TCL Statements --


set autocommit=0;

select * from productosOrden;

start transaction;

savepoint inicio;

delete from productosOrden where idOrder in (1,3,5);
savepoint eliminar;


-- rollback to inicio;

-- commit;

start transaction;
insert into usuario (nombre, apellido, telefono, mail, direccion) values
("Pete", "Eren", "947855544","rerdfbgsee@gmail.com", "Avenida jose galan 1010"),
("Joan", "Arpin", "947867444","rerfdsfdee@gmail.com", "Avenida pimpinela 501"),
("Matias", "Isla", "947876544","rerefddgfde@gmail.com", "Avenida conquistador 101"),
("Marco", "Monte", "947832444","rerefdfgde@gmail.com", "Avenida arenales 2010") ;
savepoint userLot04;
insert into usuario (nombre, apellido, telefono, mail, direccion) values
("Mauricio", "guines", "944857999","mau@gmail.com", "Calle Salvador 768"),
("Roberto", "godines", "944857644","robert@gmail.com", "Calle Sargento 101"),
("Eugenio", "perez", "963544567","eu97@gmail.com", "Calle dali 890"),
("Joaquin", "salvo", "963547382","joqui@gmail.com", "Calle rodadoresa 201") ;
savepoint userLot08;

-- release savepoint userLot04;

-- commit;