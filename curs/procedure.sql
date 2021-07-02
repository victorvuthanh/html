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

-- ---------------------------------------------------------
-- ------------ Similar titles on a title page -------------
-- ------------ for any user ------------------------------


DROP PROCEDURE IF EXISTS similar_titles;
DELIMITER //
CREATE PROCEDURE similar_titles(IN for_title_id INT)
BEGIN

	-- Titles of the same genre
	SELECT t.title, rtg.avg_r
	  FROM titles t
			   JOIN votes_on_genre vog ON t.id = vog.title_id
			   JOIN (SELECT round(avg(rating)) AS avg_r,
							title_id
					   FROM rating
					  GROUP BY title_id
					) rtg ON rtg.title_id = t.id
	 WHERE t.id <> for_title_id
	   AND vog.genre_id IN (SELECT genre_id
							  FROM votes_on_genre
							 WHERE title_id = for_title_id
						   )
	   AND g_relevancy(vog.title_id, vog.genre_id) > 0

	 UNION

-- Titles with the same keywords
	SELECT t.title, rtg.avg_r
	  FROM titles t
			   JOIN votes_on_keywords vok ON t.id = vok.title_id
			   JOIN (SELECT round(avg(rating)) AS avg_r,
							title_id
					   FROM rating
					  GROUP BY title_id
					) rtg ON rtg.title_id = t.id
	 WHERE t.id <> for_title_id
	   AND keyword_id IN (SELECT keyword_id
							FROM votes_on_keywords
						   WHERE title_id = for_title_id
						 )
	   AND k_relevancy(vok.title_id, vok.keyword_id) > 0

	 UNION

-- Titles of the same type produced in the same country
	SELECT t.title, rtg.avg_r
	  FROM titles t
			   JOIN title_info ti ON ti.title_id = t.id
			   JOIN title_country tc ON tc.title_id = t.id
			   JOIN (SELECT round(avg(rating)) AS avg_r,
							title_id
					   FROM rating
					  GROUP BY title_id
					) rtg ON rtg.title_id = t.id
	 WHERE t.id <> for_title_id
	   AND ti.title_type_id IN (SELECT title_type_id
								  FROM title_info
								 WHERE title_id = for_title_id
							   )
	   AND tc.country_id IN (SELECT country_id
							   FROM title_country
							  WHERE title_id = for_title_id
							)

	 UNION

-- Titles of the same type directed by the same person
	SELECT t.title, rtg.avg_r
	  FROM titles t
			   JOIN title_info ti ON ti.title_id = t.id
			   JOIN cast_and_crew cac ON cac.title_id = t.id
			   JOIN (SELECT round(avg(rating)) AS avg_r,
							title_id
					   FROM rating
					  GROUP BY title_id
					) rtg ON rtg.title_id = t.id
	 WHERE t.id <> for_title_id
	   AND ti.title_type_id IN (SELECT title_type_id
								  FROM title_info
								 WHERE title_id = for_title_id
							   )
	   AND cac.role_id = 3
	   AND cac.creator_id IN (SELECT creator_id
								FROM cast_and_crew
							   WHERE title_id = for_title_id
							 )

	 UNION

-- Titles of the same type produced by the same companies
	SELECT t.title, rtg.avg_r
	  FROM titles t
			   JOIN title_info ti ON ti.title_id = t.id
			   JOIN title_company tc ON t.id = tc.title_id
			   JOIN (SELECT round(avg(rating)) AS avg_r,
							title_id
					   FROM rating
					  GROUP BY title_id
					) rtg ON rtg.title_id = t.id
	 WHERE t.id <> for_title_id
	   AND ti.title_type_id IN (SELECT title_type_id
								  FROM title_info
								 WHERE title_id = for_title_id
							   )
	   AND tc.company_id IN (SELECT company_id
							   FROM title_company
							  WHERE title_id = for_title_id
							)

	 ORDER BY
		 rand()
	 LIMIT 5;

END //
DELIMITER ;


CALL similar_titles(5);

/*
+-------------------+-------+
| title             | avg_r |
+-------------------+-------+
| Armstrong-Pollich |     5 |
| O'Hara-Ziemann    |     6 |
| Stokes-Beier      |     5 |
| Beer-Cruickshank  |     7 |
| Lakin-Lang        |     9 |
+-------------------+-------+
5 rows in set (0.05 sec)

*/
