SET foreign_key_checks = 0;   
drop table if exists users;
SET foreign_key_checks = 1;     
  
CREATE TABLE users (
    user_id binary(16) default (uuid_to_bin(uuid())) primary key,
    user_alias VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    surname VARCHAR(100),
    phone CHAR(12) UNIQUE,
	friends INT DEFAULT 0,
    enemies INT DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    updated_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    INDEX idx_user_alias (user_alias),
    UNIQUE INDEX idx_full_name (first_name, surname)
    -- PRIMARY KEY (user_id)
);
    
desc users;

SET foreign_key_checks = 0;   
drop table if exists notes;
SET foreign_key_checks = 1;
  
CREATE TABLE notes (
    note_id BINARY(16) DEFAULT (UUID_TO_BIN(UUID())) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    is_important BOOLEAN DEFAULT FALSE,
    content TEXT,
    author_id BINARY(16) NOT NULL REFERENCES users(user_id),
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
	updated_at TIMESTAMP NOT NULL DEFAULT (NOW())
    -- PRIMARY KEY (note_id),
    -- FOREIGN KEY (author_id) REFERENCES users(user_id)
);
    
desc notes;

SET foreign_key_checks = 0;   
drop table if exists user_others ;
SET foreign_key_checks = 1;

  CREATE TABLE user_others (
    source_user_id BINARY(16) NOT NULL,
    target_user_id BINARY(16) NOT NULL,
    relation_type ENUM('friend', 'enemy'),
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
	updated_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    
    PRIMARY KEY (source_user_id, target_user_id),
    FOREIGN KEY(source_user_id) REFERENCES users(user_id),
    FOREIGN KEY(target_user_id) REFERENCES users(user_id),
    CONSTRAINT check_other_id CHECK (source_user_id != target_user_id)
    
  );
  
-- ALTER TABLE user_others
-- ADD CONSTRAINT check_other_id 
-- CHECK (source_user_id != target_user_id);
    
  
  desc user_others;
  
  set @uuid = uuid();
  
  insert into users (user_id, user_alias, email, first_name, surname, phone) values (
	UUID_TO_BIN(@uuid), 'a', 'a', 'a', 'a', 'a'
  );
  

-- insert into user_others (source_user_id, target_user_id, relation_type ) VALUES (
-- UUID_TO_BIN(@uuid), UUID_TO_BIN(@uuid), 'enemy'
-- );

select BIN_TO_UUID(target_user_id), BIN_TO_UUID(source_user_id), relation_type from user_others;

select u.first_name as nombre, u.surname as apellidos, n.title as titulo 
 from users u join notes n on u.user_id = n.author_id;