-- Create Trigger --


-- Confirmación de formato de correo --
DELIMITER //
create trigger checkMail
before insert on usuario
for each row
begin
	if new.mail not like '%@%.%' then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Correo inválido";
    end if;

end;
//

-- Confirmación de existencia de correo o correo ya usado --
DELIMITER //
create trigger checkSimilarMail
before insert on usuario
for each row
begin
	if new.mail IN(select mail from usuario) then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Correo ya existente";
    end if;

end;
//

-- Confirmación de validez de número de teléfono válido en Perú --
DELIMITER //
create trigger checkPhoneNum
before insert on usuario
for each row
begin
	if new.telefono < 900000000 then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Número inválido";
    end if;
end;
//

-- Segunda confirmación de validez de número de teléfono válido en Perú --
DELIMITER //
create trigger validPhone
before insert on usuario
for each row
begin
	if new.telefono not like '9%' then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Número no válido en Perú";
    end if;
end;
//

-- Confirmación de número de teléfono ya usado --
DELIMITER //
create trigger checkPhone
before insert on usuario
for each row
begin
	if new.telefono IN(select telefono from usuario) then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Número ya registrado";
    end if;

end;
//