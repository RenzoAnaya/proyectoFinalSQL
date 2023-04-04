-- Create Stored Procedures --


-- Registro de pedidos pendientes --
drop procedure if exists pedidosPendientes;

DELIMITER //
create procedure pedidosPendientes()
begin
select * from orden WHERE idStatus = 1 ;
end;
//


-- Ordenar las órdenes según campo decidido en la tabla y forma de ordenamiento --
DROP procedure IF EXISTS ordenesOrdenadas;

DELIMITER //
create procedure ordenesOrdenadas(IN columnaAOrdenar VARCHAR(30), IN formaDeOrdenamiento VARCHAR(4))

begin
	IF columnaAOrdenar <> "" THEN
		SET @order_query = CONCAT_WS(" ", "ORDER BY", columnaAOrdenar, formaDeOrdenamiento); 
	ELSE
		SET @order_query = "";
	END IF;
    SET @result_query = CONCAT_WS(" ", "SELECT * FROM orden", @order_query);
    PREPARE resultadoObtenido FROM @result_query;
    EXECUTE resultadoObtenido; 
    DEALLOCATE PREPARE resultadoObtenido; 
END;
//

DROP procedure IF EXISTS EliminarAgregarProducto;

DELIMITER //

-- Agregar o eliminar productos a la orden --

CREATE PROCEDURE EliminarAgregarProducto (
	IN procesoAEjecutar VARCHAR(6),
	IN idOrder tinyint,
	IN idProduct tinyint)

procesoEtiquetado: BEGIN
	IF UPPER(procesoAEjecutar) LIKE "DELETE" THEN
		-- DELETE 
		SET @result_query = CONCAT_WS(" ", "DELETE FROM productosOrden WHERE idOrder =", idOrder, "AND idProduct =", idProduct);
	ELSEIF UPPER(procesoAEjecutar) LIKE "INSERT" THEN
		-- INSERT 
		SET @result_query = CONCAT_WS(" ", "INSERT INTO productosOrden VALUES (", idCategoria, ",", id_book, ")");
	ELSE
		-- NULL 
		LEAVE procesoEtiquetado;
	END IF;

    PREPARE resultStatement FROM @result_query;
    EXECUTE resultStatement; 
    DEALLOCATE PREPARE resultStatement; 
END;
//