-- show databases;  
drop database if exists demo2;
create database demo2; 
use demo2;
create table animals (
	id char(18) primary key default (uuid()),
     -- movie_id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
	name varchar(255) NOT null unique,
	englishName varchar(255) NOT null unique,
    sciName VARCHAR(255) NOT NULL,
    diet VARCHAR(255) NOT NULL,
    lifestyle VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    slogan text,
    group_ VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT (NOW()), 
    updated_at TIMESTAMP DEFAULT (NOW())
)

-- release_year INT NOT NULL,
-- duration INT NOT NULL,
-- rate DECIMAL(2, 1) NOT NULL,
         