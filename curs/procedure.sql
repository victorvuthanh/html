-- ----------------------------------- Filmography
DROP PROCEDURE IF EXISTS filmography;
DELIMITER //
CREATE PROCEDURE filmography(IN for_person_id INT)
BEGIN

	SELECT name, title, role, release_date
	  FROM titles_and_cast
	 WHERE cr_id = for_person_id
	 ORDER BY role, release_date DESC;
END//

DELIMITER ;

CALL filmography(5);

/*

+---------------+--------------------------+----------+--------------+
| name          | title                    | role     | release_date |
+---------------+--------------------------+----------+--------------+
| Elsie Corkery | Kemmer Group             | Director | 2019-09-16   |
| Elsie Corkery | Kozey, Walter and Cremin | Director | 2013-01-31   |
| Elsie Corkery | Lehner LLC               | Director | 1986-07-13   |
| Elsie Corkery | Robel, Mayer and Jast    | Director | 1972-12-29   |
+---------------+--------------------------+----------+--------------+
4 rows in set (0.01 sec)
*/



-- ----------------------------------- Combination of genre and title type query
DROP PROCEDURE IF EXISTS genre_and_type_combo;
DELIMITER //
CREATE PROCEDURE genre_and_type_combo(IN for_type VARCHAR(100),
									  IN for_genre VARCHAR(100))
BEGIN
	SELECT tp.title, tp.rating
	  FROM t_profiles tp
			   JOIN titles_and_genres tag ON tp.t_id = tag.t_id
	 WHERE tp.title_type = for_type
	   AND tag.relevancy > 0
	   AND tag.genre = for_genre
	 ORDER BY
		 tp.rating DESC, tag.relevancy DESC;
END //
DELIMITER ;

CALL genre_and_type_combo('TV Series', 'Drama');

/*
+----------------+--------+
| title          | rating |
+----------------+--------+
| Blanda Inc     |      7 |
| O'Hara-Ziemann |      6 |
+----------------+--------+
2 rows in set (0.03 sec)
 */

-- ----------------------------------- Some good titles for kids
DROP PROCEDURE IF EXISTS titles_for_kids;
DELIMITER //
CREATE PROCEDURE titles_for_kids(IN how_many INT)
BEGIN

	SELECT title,
		   title_type,
		   rars
	  FROM t_profiles
	 WHERE (rars = '0+' OR rars = '6+') AND rars != 'NR' AND rating >= 6
	 ORDER BY
		 rand()
	 LIMIT how_many;

END //
DELIMITER ;

CALL titles_for_kids(10);

/*
+--------------------------------+--------------+------+
| title                          | title_type   | rars |
+--------------------------------+--------------+------+
| Stoltenberg-Witting            | TV Movie     | 0+   |
| Leuschke, Kertzmann and Schoen | TV Series    | 6+   |
| Blanda, Mueller and Lockman    | Feature Film | 6+   |
| O'Hara-Ziemann                 | TV Series    | 6+   |
| Cole-Rosenbaum                 | Feature Film | 0+   |
| Cremin LLC                     | Mini-Series  | 6+   |
| Schaden and Sons               | TV Movie     | 0+   |
| Grady LLC                      | Animation    | 6+   |
| Jacobs, Waelchi and West       | TV Series    | 0+   |
| Dicki, Wehner and Stokes       | Mini-Series  | 6+   |
+--------------------------------+--------------+------+
10 rows in set (0.01 sec)
*/