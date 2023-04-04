-- Create views --


-- Ver productos en estación --
CREATE OR REPLACE VIEW productosEstacionales AS (
    SELECT
		T1.nombreProducto,
        T2.descripcionEstacionalidad
	FROM estacionalidad T2
	inner join producto T1
		ON T1.idEstacionalidad = T2.idEstacionalidad
	WHERE T1.idEstacionalidad = 1
    ORDER BY 1 ASC
);

-- Ver productos en Stock --
CREATE OR REPLACE VIEW productosDisponibles AS (
    SELECT
		T1.nombreProducto,
        T2.numeroStock
	FROM producto T1
	left join stock T2
		ON T1.idProduct = T2.idProduct
	WHERE numeroStock > 0
    GROUP BY 1
    ORDER BY 1 ASC
);

-- Ver pedidos con problemas de entrega --
CREATE OR REPLACE VIEW pedidosConProblemas AS (
    SELECT
		CONCAT(T1.nombre, " ", T1.apellido) AS usuario,
		T4.idOrder,
        T2.deliveryDate,
        T3.descripcionStatus,
        T1.telefono
    FROM orden T4
    left JOIN usuario T1
		ON T1.idUsuario = T4.idUsuario
    left JOIN delivery T2
		ON T2.idDelivery = T4.idDelivery
    left JOIN estado T3
        ON T3.idStatus = T4.idStatus
    WHERE T3.idStatus = 3
    ORDER BY T2.deliveryDate ASC
);

-- Ver clientes en orden de mayor cantidad de veces pedidas --
create or replace view clientesDestacados as(
select 
T1.nombre,
T2.idOrder,
T1.telefono, 
COUNT(T2.idOrder) as totalPedidos
from usuario T1
left join orden T2
on T1.idUsuario = T2.idUsuario
group by 1
order by 4 desc
);

-- Ver productos en orden de veces que han sido ordenados --
create or replace view productosMasComprados as(
select 
T1.idProduct,
T1.nombreProducto, 
SUM(T2.cantidad) cantidadPedidaTotal
from producto T1
left join productosOrden T2
on T1.idProduct = T2.idProduct
group by 1
order by cantidad desc
);