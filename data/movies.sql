
DROP DATABASE IF EXISTS movies_db;

CREATE DATABASE movies_db;

USE movies_db;

CREATE TABLE movies (
  movie_id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
  title VARCHAR(255) NOT NULL,
  release_year INT NOT NULL,
  director VARCHAR(255) NOT NULL,
  duration INT NOT NULL,
  poster TEXT,
  rate DECIMAL(2, 1) NOT NULL,
  created_at TIMESTAMP DEFAULT (NOW())
);

DELIMITER //

CREATE TRIGGER after_usuario_movie
AFTER INSERT ON movies
FOR EACH ROW
BEGIN
    SET @last_inserted_uuid = NEW.movie_id;
END //

DELIMITER ;


CREATE TABLE generes (
  genere_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT (NOW())
);

CREATE TABLE movies_generes (
  -- movie_id BINARY(16) NOT NULL,
  -- genre_id INT NOT NULL,
  -- FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  -- FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
  -- PRIMARY KEY (movie_id, genre_id),
  movie_id BINARY(16) NOT NULL REFERENCES movies(movie_id),
  genere_id INT NOT NULL REFERENCES generes(genere_id),
  PRIMARY KEY (movie_id, genere_id)
);

BEGIN;

INSERT INTO generes (name)
VALUES ('Action'),
        ('Comedy'),
        ('Drama'),
        ('Horror'),
        ('Crime'),
        ('Sci-Fi'),
        ('Adventure'),
        ('Fantasy'),
        ('Animation'),
        ('Thriller'),
        ('Romance'),
        ('History');


INSERT INTO movies (movie_id, title, release_year, director, duration, rate, poster)
VALUES
        ( UUID_TO_BIN(UUID()), 'The Shawshank Redemption', 1994, 'Frank Darabont', 142, 9.3, 'https://www.imdb.com/title/tt0111161/'),
        ( UUID_TO_BIN(UUID()), 'The Godfather', 1972, 'Francis Ford Coppola', 175, 9.2, 'https://www.imdb.com/title/tt0068646/'),
        ( UUID_TO_BIN(UUID()), 'The Dark Knight', 2008, 'Christopher Nolan', 152, 9.0, 'https://www.imdb.com/title/tt0468569/'),
        ( UUID_TO_BIN(UUID()), 'The Lord of the Rings: The Return of the King', 2003, 'Peter Jackson', 201, 8.9, 'https://www.imdb.com/title/tt0167260/'),
        ( UUID_TO_BIN(UUID()), 'Pulp Fiction', 1994, 'Quentin Tarantino', 154, 8.9, 'https://www.imdb.com/title/tt0110912/'),
        ( UUID_TO_BIN(UUID()), 'Schindler''s List', 1993, 'Steven Spielberg', 195, 8.9, 'https://www.imdb.com/title/tt0108052/'),
        ( UUID_TO_BIN(UUID()), 'The Lord of the Rings: The Fellowship of the Ring', 2001, 'Peter Jackson', 178, 8.8, 'https://www.imdb.com/title/tt0120737/'),
        ( UUID_TO_BIN(UUID()), 'Forrest Gump', 1994, 'Robert Zemeckis', 142, 8.8, 'https://www.imdb.com/title/tt0109830/'),
        ( UUID_TO_BIN(UUID()), 'Inception', 2010, 'Christopher Nolan', 148, 8.7, 'https://www.imdb.com/title/tt1375666/'),
        ( UUID_TO_BIN(UUID()), 'The Lord of the Rings: The Two Towers', 2002, 'Peter Jackson', 179, 8.7, 'https://www.imdb.com/title/tt0167261/'),
        ( UUID_TO_BIN(UUID()), 'The Matrix', 1999, 'Lana Wachowski, Lilly Wachowski', 136, 8.7, 'https://www.imdb.com/title/tt0133093/'),
        ( UUID_TO_BIN(UUID()), 'Goodfellas', 1990, 'Martin Scorsese', 146, 8.7, 'https://www.imdb.com/title/tt0099685/'),
        ( UUID_TO_BIN(UUID()), 'One Flew Over the Cuckoo''s Nest', 1975, 'Milos Forman', 133, 8.7, 'https://www.imdb.com/title/tt0073486/'),
        ( UUID_TO_BIN(UUID()), 'Seven', 1995, 'David Fincher', 127, 8.6, 'https://www.imdb.com/title/tt0114369/'),
        ( UUID_TO_BIN(UUID()), 'The Silence of the Lambs', 1991, 'Jonathan Demme', 118, 8.6, 'https://www.imdb.com/title/tt0102926/'),
        ( UUID_TO_BIN(UUID()), 'The Usual Suspects', 1995, 'Bryan Singer', 106, 8.5, 'https://www.imdb.com/title/tt0114814/'),
        ( UUID_TO_BIN(UUID()), 'Léon: The Professional', 1994, 'Luc Besson', 110, 8.5, 'https://www.imdb.com/title/tt0110413/'),
        ( UUID_TO_BIN(UUID()), 'The Lion King', 1994, 'Roger Allers, Rob Minkoff', 88, 8.5, 'https://www.imdb.com/title/tt0110357/'),
        ( UUID_TO_BIN(UUID()), 'Terminator 2: Judgment Day', 1991, 'James Cameron', 137, 8.5, 'https://www.imdb.com/title/tt0103064/'),
        ( UUID_TO_BIN(UUID()), 'Saving Private Ryan', 1998, 'Steven Spielberg', 169, 8.5, 'https://www.imdb.com/title/tt0120815/'),
        ( UUID_TO_BIN(UUID()), 'The Green Mile', 1999, 'Frank Darabont', 189, 8.5, 'https://www.imdb.com/title/tt0120689/'),
        ( UUID_TO_BIN(UUID()), 'Back to the Future', 1985, 'Robert Zemeckis', 116, 8.5, 'https://www.imdb.com/title/tt0088763/'),
        ( UUID_TO_BIN(UUID()), 'American History X', 1998, 'Tony Kaye', 119, 8.5, 'https://www.imdb.com/title/tt0120586/'),
        ( UUID_TO_BIN(UUID()), 'The Pianist', 2002, 'Roman Polanski', 150, 8.5, 'https://www.imdb.com/title/tt0253474/'),
        ( UUID_TO_BIN(UUID()), 'Gladiator', 2000, 'Ridley Scott', 155, 8.5, 'https://www.imdb.com/title/tt0172495/'),
        ( UUID_TO_BIN(UUID()), 'The Departed', 2006, 'Martin Scorsese', 151, 8.5, 'https://www.imdb.com/title/tt0407887/'),
        ( UUID_TO_BIN(UUID()), 'The Prestige', 2006, 'Christopher Nolan', 130, 8.5, 'https://www.imdb.com/title/tt0482571/'),
        ( UUID_TO_BIN(UUID()), 'The Intouchables', 2011, 'Olivier Nakache, Éric Toledano', 112, 8.5, 'https://www.imdb.com/title/tt1675434/');



INSERT INTO movies_generes (movie_id, genere_id)
VALUES
((SELECT movie_id FROM movies WHERE title = 'The Shawshank Redemption'),
 (SELECT genere_id FROM generes WHERE name = 'Drama')),

((SELECT movie_id FROM movies WHERE title = 'The Shawshank Redemption'),
  (SELECT genere_id FROM generes WHERE name = 'Crime')),

  ((SELECT movie_id FROM movies WHERE title = 'The Godfather'),
  (SELECT genere_id FROM generes WHERE name = 'Drama')),

  ((SELECT movie_id FROM movies WHERE title = 'The Godfather'),
  (SELECT genere_id FROM generes WHERE name = 'Crime')),

  ((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'),
  (SELECT genere_id FROM generes WHERE name = 'Action')),

  ((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'),
  (SELECT genere_id FROM generes WHERE name = 'Crime')),

  ((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Return of the King'),
  (SELECT genere_id FROM generes WHERE name = 'Adventure')),

  ((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Return of the King'),
  (SELECT genere_id FROM generes WHERE name = 'Fantasy')),

  ((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'),
  (SELECT genere_id FROM generes WHERE name = 'Crime')),

  ((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'),
  (SELECT genere_id FROM generes WHERE name = 'Drama')),

  ((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'),
  (SELECT genere_id FROM generes WHERE name = 'Thriller')),

  ((SELECT movie_id FROM movies WHERE title = 'Schindler''s List'),
  (SELECT genere_id FROM generes WHERE name = 'Drama')),

  ((SELECT movie_id FROM movies WHERE title = 'Schindler''s List'),
  (SELECT genere_id FROM generes WHERE name = 'History')),

  ((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Fellowship of the Ring'),
  (SELECT genere_id FROM generes WHERE name = 'Adventure')),

  ((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Fellowship of the Ring'),
  (SELECT genere_id FROM generes WHERE name = 'Fantasy')),

  ((SELECT movie_id FROM movies WHERE title = 'Forrest Gump'),
  (SELECT genere_id FROM generes WHERE name = 'Drama')),

  ((SELECT movie_id FROM movies WHERE title = 'Forrest Gump'),
  (SELECT genere_id FROM generes WHERE name = 'Romance')),
  
((SELECT movie_id FROM movies WHERE title = 'Inception'),
  (SELECT genere_id FROM generes WHERE name = 'Sci-Fi')),

((SELECT movie_id FROM movies WHERE title = 'Inception'),
  (SELECT genere_id FROM generes WHERE name = 'Thriller')),

((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Two Towers'),
  (SELECT genere_id FROM generes WHERE name = 'Fantasy')),

((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Two Towers'),
  (SELECT genere_id FROM generes WHERE name = 'Adventure')),

((SELECT movie_id FROM movies WHERE title = 'The Matrix'),
  (SELECT genere_id FROM generes WHERE name = 'Sci-Fi')),

((SELECT movie_id FROM movies WHERE title = 'The Matrix'),
  (SELECT genere_id FROM generes WHERE name = 'Action')),

((SELECT movie_id FROM movies WHERE title = 'Goodfellas'),
  (SELECT genere_id FROM generes WHERE name = 'Drama')),

((SELECT movie_id FROM movies WHERE title = 'Goodfellas'),
  (SELECT genere_id FROM generes WHERE name = 'Crime')),
  
((SELECT movie_id FROM movies WHERE title = 'One Flew Over the Cuckoo\'s Nest'),
  (SELECT genere_id FROM generes WHERE name = 'Drama')),

((SELECT movie_id FROM movies WHERE title = 'Seven'),
  (SELECT genere_id FROM generes WHERE name = 'Thriller')),

((SELECT movie_id FROM movies WHERE title = 'Seven'),
  (SELECT genere_id FROM generes WHERE name = 'Crime')),

((SELECT movie_id FROM movies WHERE title = 'The Silence of the Lambs'),
  (SELECT genere_id FROM generes WHERE name = 'Thriller')),

((SELECT movie_id FROM movies WHERE title = 'The Silence of the Lambs'),
  (SELECT genere_id FROM generes WHERE name = 'Crime')),

((SELECT movie_id FROM movies WHERE title = 'The Usual Suspects'),
  (SELECT genere_id FROM generes WHERE name = 'Crime')),

((SELECT movie_id FROM movies WHERE title = 'The Usual Suspects'),
  (SELECT genere_id FROM generes WHERE name = 'Comedy')),
  
((SELECT movie_id FROM movies WHERE title = 'Léon: The Professional'),
  (SELECT genere_id FROM generes WHERE name = 'Crime')),
  
((SELECT movie_id FROM movies WHERE title = 'The Lion King'),
  (SELECT genere_id FROM generes WHERE name = 'Animation')),

((SELECT movie_id FROM movies WHERE title = 'Terminator 2: Judgment Day'),
  (SELECT genere_id FROM generes WHERE name = 'Sci-Fi')),

((SELECT movie_id FROM movies WHERE title = 'Saving Private Ryan'),
  (SELECT genere_id FROM generes WHERE name = 'Action')),

((SELECT movie_id FROM movies WHERE title = 'Saving Private Ryan'),
  (SELECT genere_id FROM generes WHERE name = 'History')),

 ((SELECT movie_id FROM movies WHERE title = 'The Green Mile'),
  (SELECT genere_id FROM generes WHERE name = 'Drama')),
  
 ((SELECT movie_id FROM movies WHERE title = 'Back to the Future'),
  (SELECT genere_id FROM generes WHERE name = 'Sci-Fi')),
  
   ((SELECT movie_id FROM movies WHERE title = 'Back to the Future'),
  (SELECT genere_id FROM generes WHERE name = 'Comedy')),

 ((SELECT movie_id FROM movies WHERE title = 'American History X'),
  (SELECT genere_id FROM generes WHERE name = 'History')),

 ((SELECT movie_id FROM movies WHERE title = 'American History X'),
  (SELECT genere_id FROM generes WHERE name = 'Drama')),

 ((SELECT movie_id FROM movies WHERE title = 'The Pianist'),
  (SELECT genere_id FROM generes WHERE name = 'Drama')),

 ((SELECT movie_id FROM movies WHERE title = 'Gladiator'),
  (SELECT genere_id FROM generes WHERE name = 'Action')),

 ((SELECT movie_id FROM movies WHERE title = 'Gladiator'),
  (SELECT genere_id FROM generes WHERE name = 'History')),

((SELECT movie_id FROM movies WHERE title = 'The Departed'),
  (SELECT genere_id FROM generes WHERE name = 'Thriller')),

 ((SELECT movie_id FROM movies WHERE title = 'The Prestige'),
  (SELECT genere_id FROM generes WHERE name = 'Comedy')),

 ((SELECT movie_id FROM movies WHERE title = 'The Intouchables'),
  (SELECT genere_id FROM generes WHERE name = 'Crime'));
  
-- COMMIT
-- ROLLBACK;