/*
 * Создайте двух пользователей которые имеют доступ к базе данных shop. 
 * Первому пользователю shop_read должны быть доступны только запросы на 
 * чтение данных, второму пользователю shop — любые операции в пределах 
 * базы данных shop.
 */

DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY 'pagdfg@sS144452435';
GRANT SELECT ON shop7.* TO 'shop_reader'@'localhost';


INSERT INTO catalogs(name)

VALUES('New catalog');

SELECT * FROM catalogs;

-- shop - доступны любые операции в пределах базы данных shop
DROP USER IF EXISTS 'shop'@'localhost';
CREATE USER 'shop'@'localhost' IDENTIFIED WITH sha256_password BY 'pagdfg@sS144452435';
GRANT ALL ON shop7.* TO 'shop'@'localhost';
GRANT GRANT OPTION ON shop7.* TO 'shop'@'localhost';


INSERT INTO catalogs(name)
VALUES('New catalog');
SELECT * FROM catalogs;


/*
 * (по желанию) Пусть имеется таблица accounts содержащая три столбца id, 
 * name, password, содержащие первичный ключ, имя пользователя и его пароль. 
 * Создайте представление username таблицы accounts, предоставляющий доступ 
 * к столбца id и name. Создайте пользователя user_read, который бы не 
 * имел доступа к таблице accounts, однако, мог бы извлекать записи из 
 * представления username.
 */

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(45),
	password VARCHAR(45)
);

INSERT INTO accounts VALUES
	(NULL, 'bob', '123'),
	(NULL, 'jack', '123'),
	(NULL, 'ron', '123');


CREATE OR REPLACE VIEW username(user_id, user_name) AS 
	SELECT id, name FROM accounts;


SELECT * FROM accounts;
SELECT * FROM username;


-- Создаем пользователя 'shop_reader'@'localhost' с доступом только к одному,
-- ограниченному по столбцам, представлению username;
DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY 'pagdfg@sS144452435';
GRANT SELECT ON shop7.username TO 'shop_reader'@'localhost';

-- логинимся под shop_reader
 -- access denied
SELECT * FROM catalogs;
 -- success
SELECT * FROM username;
