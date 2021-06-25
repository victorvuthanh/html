*
 * В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы 
 * данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
 * Используйте транзакции.
 */

DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
use sample;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	birthday_at DATE DEFAULT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

SELECT * FROM users;

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop7.users WHERE id = 1;
COMMIT;

SELECT * FROM users;

/*
 * Создайте представление, которое выводит название name товарной позиции из 
 * таблицы products и соответствующее название каталога name из таблицы catalogs.
 */

use shop7;
CREATE OR REPLACE VIEW prods_desc(prod_id, prod_name, cat_name) AS
SELECT p.id AS prod_id, p.name, cat.name
FROM products AS p
LEFT JOIN catalogs AS cat 
ON p.catalog_id = cat.id;

SELECT * FROM prods_desc;

/*
 * (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
 * Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя 
 * только 5 самых свежих записей.
*/


use shop7;
DROP TABLE IF EXISTS datetbl;
CREATE TABLE datetbl (
	created_at DATE
);

INSERT INTO datetbl VALUES
	('2018-08-01'),
	('2018-08-02'),
	('2018-08-04'),
	('2018-08-12'),
	('2018-08-14'),
	('2018-08-17'),
	('2018-08-23'),
	('2018-08-27'),
	('2018-08-29'),
	('2018-08-31');

SELECT * FROM datetbl ORDER BY created_at DESC;
-- Перед удалением выведем те строки которые мы собираемся удалить
SELECT created_at AS below_5 FROM datetbl
WHERE created_at NOT IN (
	SELECT *
	FROM (
		SELECT *
		FROM datetbl
		ORDER BY created_at DESC
		LIMIT 5
	) AS foo
) ORDER BY created_at DESC;

-- удаляем все что не входит в первую 5
DELETE FROM datetbl
WHERE created_at NOT IN (
	SELECT *
	FROM (
		SELECT *
		FROM datetbl
		ORDER BY created_at DESC
		LIMIT 5
	) AS foo
) ORDER BY created_at DESC;

SELECT * FROM datetbl ORDER BY created_at DESC;