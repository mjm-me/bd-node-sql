DELIMITER //

CREATE TRIGGER after_insert_movie
AFTER INSERT ON movies
FOR EACH ROW
BEGIN
    SET @last_inserted_uuid = NEW.movie_id;
END //

DELIMITER 