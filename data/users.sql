
DROP DATABASE IF EXISTS users_db;

CREATE DATABASE users_db;

USE users_db;

DROP TABLE IF EXISTS users; 

CREATE TABLE users (
  user_id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
  user_handle VARCHAR(50) NOT NULL UNIQUE,
  passwd VARCHAR(50) NOT NULL DEFAULT '',
  email VARCHAR(50) NOT NULL UNIQUE,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  phone VARCHAR(20), 
  role enum('admin', 'pro', 'user') NOT NULL DEFAULT 'user',
  is_alive BOOL NOT NULL DEFAULT '1',
  created_at TIMESTAMP DEFAULT (NOW())
);

DELIMITER //

CREATE TRIGGER after_usuario_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    SET @last_inserted_uuid = NEW.user_id;
END //

DELIMITER ;

INSERT INTO users (user_handle, email, first_name, last_name, phone)
VALUES ('@pepe', 'pepe@sample.com', 'Pepe', 'Pérez', '674576345'),
        ('@erni', 'erni@acme.com', 'Ernestina', 'García', '626351347'),
        ('@luis', 'luis@demo.com', 'Luis', 'Llanes', '684375465'),
        ('@rose','rose@acme.com', 'Rosa', 'Ángelina', '687463213');

        
SELECT 
	BIN_TO_UUID(user_id) as id,
	user_handle as userName,
	email,
    first_name as firstName,
	last_name as surname,
    role,
    is_alive as isAlive
FROM users;

-- SET @last_inserted_id = (SELECT user_id FROM users ORDER BY user_id DESC LIMIT 1);

-- Recuperar la fila insertada usando el UUID almacenado
-- SELECT * FROM users WHERE user_id = @last_inserted_id;

SELECT
        BIN_TO_UUID(user_id) as id,
        user_handle as userName,
        email,
        first_name as firstName,
        last_name as surname,
        role,
        is_alive as isAlive
      FROM users WHERE user_handle = '@jon';

SELECT BIN_TO_UUID(@last_inserted_uuid) as id;

DELETE from users where user_id = UUID_TO_BIN('0e7293c9-ecaa-11ef-af3e-6845f1d9ea02');