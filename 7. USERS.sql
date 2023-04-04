-- Creación de usuarios --

USE mysql;

DROP user if exists'readingUser'@'localhost';

-- Usuario solo lectura --
CREATE USER IF NOT EXISTS 'readingUser'@'localhost' IDENTIFIED BY 'nopassword';
-- Asignar derechos de lectura --
GRANT SELECT ON *.* TO 'readingUser'@'localhost';
REVOKE DELETE ON *.* FROM 'readingUser'@'localhost';

-- User with reading, insertion and modification grants creation-
CREATE USER IF NOT EXISTS 'managingUser'@'localhost' IDENTIFIED BY 'Icanedit';
-- Asignar a usuario los derechos de manejo de la base de datos y poder dar derechos --
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'managingUser'@'localhost' WITH GRANT OPTION;
REVOKE DELETE ON *.* FROM 'managingUser'@'localhost';

-- Ver derechos otorgados: --
/*
SHOW GRANTS FOR 'readingUser'@'localhost';
SHOW GRANTS FOR 'user_with_more_grants'@'localhost';
*/