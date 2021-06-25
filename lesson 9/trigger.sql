/*
 * Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
 * в зависимости от текущего времени суток. 
 * С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
 * с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
 * с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
 */


DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN
			SELECT 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN
			SELECT 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND '00:00:00' THEN
			SELECT 'Добрый вечер';
		ELSE
			SELECT 'Доброй ночи';
	END CASE;
END //
delimiter ;

CALL hello();


/*
 * В таблице products есть два текстовых поля: name с названием товара и 
 * description с его описанием. Допустимо присутствие обоих полей или одно 
 * из них. Ситуация, когда оба поля принимают неопределенное значение NULL 
 * неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей 
 * или оба поля были заполнены. При попытке присвоить полям NULL-значение 
 * необходимо отменить операцию.
 */


DELIMITER //
CREATE TRIGGER correct_name_description BEFORE INSERT ON products
FOR EACH ROW BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000'
		SET message_text = 'Поля name и description = NULL';
	END IF;
END//

INSERT INTO products
	(name, description, price, catalog_id)
VALUES
	(NULL, NULL, 1000, 1)//

SHOW TRIGGERS;
DROP TRIGGER correct_name_description;

-- При попытке присвоить полям NULL-значение необходимо отменить операцию
DELIMITER //

CREATE TRIGGER correct_name_description BEFORE UPDATE ON products
FOR EACH ROW BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000'
		SET message_text = 'Поля name и description = NULL';
	END IF;
END//