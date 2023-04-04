-- Create function --


-- Fórmula que hallará la diferencia entre el costo de producto y el precio de venta --
DELIMITER //
create function diferenciaPrecio(costo numeric(10,2), precio numeric(10,2)) returns numeric(10,2)
deterministic
begin
declare dif numeric(10,2);
SET dif = precio-costo;

return dif;
end;
//

-- Fórmula que determinará si un producto está con suficiente stock o si se deberá comprar más --
DELIMITER //
create function actualizarStock(num numeric(10)) returns varchar(20)
deterministic
begin
declare a numeric(10);
declare mensaje varchar(20);
declare min numeric(10);
set min = 3;
set a = num-min;

IF a>0
THEN
set mensaje = "Stock suficiente" ;
ELSE
set mensaje = "Comprar más" ;
END IF;
return mensaje;
end;
//