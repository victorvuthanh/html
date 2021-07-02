use videohub;



-- ----------------------------------- TITLES & COUNTRIES view

CREATE OR REPLACE VIEW titles_and_countries AS
	SELECT t.id AS t_id,
		   t.title,
		   c.id AS c_id,
		   c.country
	  FROM titles t
			   JOIN title_country tc ON t.id = tc.title_id
			   JOIN countries c ON tc.country_id = c.id
	 ORDER BY
		 t.id
		limit 10;

/*
 * +------+----------------------------+------+------------------------+
| t_id | title                      | c_id | country                |
+------+----------------------------+------+------------------------+
|    1 | Greenfelder Inc            |  148 | Namibia                |
|    1 | Greenfelder Inc            |  234 | Venezuela              |
|    2 | Waelchi, Reichel and Haley |   27 | Bosnia and Herzegovina |
|    2 | Waelchi, Reichel and Haley |  240 | Zimbabwe               |
|    3 | Roob, Dibbert and Ebert    |  114 | Korea                  |
|    3 | Roob, Dibbert and Ebert    |   45 | China                  |
|    4 | Mertz, Durgan and Heaney   |  223 | Tuvalu                 |
|    4 | Mertz, Durgan and Heaney   |  110 | Jordan                 |
|    5 | Wisozk Ltd                 |  101 | Iran                   |
|    5 | Wisozk Ltd                 |  140 | Moldova                |
+------+----------------------------+------+------------------------+
10 rows in set (0.00 sec)
 */
-- ----------------------------------- TITLES & PRODUCTION COMPANIES view
CREATE OR REPLACE VIEW titles_and_companies AS
	SELECT t.id AS t_id,
		   t.title,
		   c.id AS comp_id,
		   c.company
	  FROM titles t
			   JOIN title_company tc ON t.id = tc.title_id
			   JOIN studios c ON tc.company_id = c.id
	 ORDER BY
		 t.id
	 limit 10;
-- DROP VIEW IF EXISTS titles_and_companies;

	/*
+------+---------------------------------+---------+-----------------------+
| t_id | title                           | comp_id | company               |
+------+---------------------------------+---------+-----------------------+
|    1 | Greenfelder Inc                 |       3 | Alcon Entertainment   |
|    2 | Waelchi, Reichel and Haley      |      13 | Columbia Pictures     |
|    2 | Waelchi, Reichel and Haley      |       5 | Bad Robot Productions |
|    3 | Roob, Dibbert and Ebert         |      22 | Gaumont               |
|    4 | Mertz, Durgan and Heaney        |       6 | BBC Films             |
|    4 | Mertz, Durgan and Heaney        |       3 | Alcon Entertainment   |
|    4 | Mertz, Durgan and Heaney        |       6 | BBC Films             |
|    5 | Wisozk Ltd                      |       8 | Blue Sky Studios      |
|    5 | Wisozk Ltd                      |      23 | Happy Madison         |
|    6 | Stiedemann, Bernier and Ullrich |       8 | Blue Sky Studios      |
+------+---------------------------------+---------+-----------------------+
10 rows in set (0.00 sec)
	 */

-- ----------------------------------- TITLES & CREATORS view
CREATE OR REPLACE VIEW titles_and_cast AS
	SELECT t.id AS t_id,
		   t.title,
		   r.id AS r_id,
		   r.role,
		   cr.id AS cr_id,
		   concat_ws(' ', cr.first_name, cr.last_name) AS name,
		   ti.release_date
	  FROM creators cr
			   INNER JOIN cast_and_crew cac ON cr.id = cac.creator_id
			   INNER JOIN titles t ON cac.title_id = t.id
			   INNER JOIN roles r ON cac.role_id = r.id
			   INNER JOIN title_info ti ON t.id = ti.title_id
	 ORDER BY
		 t.id
	 limit 10;
-- DROP VIEW IF EXISTS titles_and_cast;
/*
+------+----------------------------+------+----------+-------+-----------------+--------------+
| t_id | title                      | r_id | role     | cr_id | name            | release_date |
+------+----------------------------+------+----------+-------+-----------------+--------------+
|    1 | Greenfelder Inc            |    3 | Director |    22 | Deion Zieme     | 2000-05-19   |
|    1 | Greenfelder Inc            |    2 | Producer |    41 | Nova Schuster   | 2000-05-19   |
|    1 | Greenfelder Inc            |    4 | Writer   |    25 | Ned Gutmann     | 2000-05-19   |
|    1 | Greenfelder Inc            |    5 | Star     |    59 | Lela Dooley     | 2000-05-19   |
|    1 | Greenfelder Inc            |    5 | Star     |    48 | Kyler Bechtelar | 2000-05-19   |
|    1 | Greenfelder Inc            |    5 | Star     |    75 | Nickolas Towne  | 2000-05-19   |
|    1 | Greenfelder Inc            |    5 | Star     |    84 | Sarina Stracke  | 2000-05-19   |
|    2 | Waelchi, Reichel and Haley |    3 | Director |    19 | Norene Jast     | 2002-04-13   |
|    2 | Waelchi, Reichel and Haley |    2 | Producer |    27 | Albina Corkery  | 2002-04-13   |
|    2 | Waelchi, Reichel and Haley |    4 | Writer   |    25 | Ned Gutmann     | 2002-04-13   |
+------+----------------------------+------+----------+-------+-----------------+--------------+
10 rows in set (0.00 sec)
 */

-- ---------------------------------------------------------
-- ----------------------- VIEWS WITH VOTES ----------------
-- ---------------------------------------------------------


-- ----------------------------------- GENRES GENERAL INFO view
CREATE OR REPLACE VIEW genres_info AS
	SELECT g.id AS g_id,
		   g.genre,
		   fg.c AS followers,
		   vog.c AS all_titles,
		   vog_r.c AS relevant_titles
	  FROM genres g
			   LEFT JOIN (SELECT count(user_id) AS c,
								 genre_id
							FROM follow_genre
						   GROUP BY genre_id
						 ) AS fg ON g.id = fg.genre_id
			   LEFT JOIN (SELECT count(title_id) AS c, -- All titles
								 genre_id
							FROM votes_on_genre
						   GROUP BY genre_id
						 ) AS vog ON g.id = vog.genre_id
			   LEFT JOIN (SELECT count(title_id) AS c,
								 genre_id
							FROM votes_on_genre
						   WHERE g_relevancy(title_id, genre_id) > 0
						   GROUP BY genre_id
						 ) AS vog_r ON g.id = vog_r.genre_id
	 ORDER BY
		 g.genre;
-- DROP VIEW IF EXISTS genres_info;
		
/*
 * 
+------+-------------+-----------+------------+-----------------+
| g_id | genre       | followers | all_titles | relevant_titles |
+------+-------------+-----------+------------+-----------------+
|    1 | Action      |        13 |         10 |               6 |
|    2 | Adventure   |        29 |         10 |               4 |
|    3 | Animation   |        18 |         10 |               4 |
|    4 | Biography   |        21 |         10 |               6 |
|    5 | Comedy      |        15 |         10 |               6 |
|    6 | Crime       |        17 |         10 |               6 |
|    7 | Documentary |        17 |         10 |               2 |
|    8 | Drama       |        14 |         55 |              23 |
|    9 | Family      |        17 |         10 |               8 |
|   10 | Fantasy     |        17 |         10 |               6 |
|   11 | Film Noir   |        18 |         10 |               6 |
|   12 | History     |        16 |         10 |               8 |
|   13 | Horror      |        17 |         63 |              26 |
|   14 | Music       |        15 |          8 |               4 |
|   15 | Musical     |        17 |          8 |               2 |
|   16 | Mystery     |        20 |          8 |               6 |
|   17 | Romance     |        16 |          8 |               4 |
|   18 | Sci-Fi      |        27 |          8 |               2 |
|   19 | Sport       |        30 |          8 |               2 |
|   20 | Superhero   |        16 |          8 |               2 |
|   21 | Thriller    |        13 |          8 |            NULL |
|   22 | Western     |        17 |          8 |               6 |
+------+-------------+-----------+------------+-----------------+
22 rows in set (0.10 sec)
 */		


-- ----------------------------------- TITLES & THEIR GENRES view
CREATE OR REPLACE VIEW titles_and_genres AS
	SELECT t.id AS t_id,
		   t.title,
		   g.id AS g_id,
		   g.genre,
		   g_relevancy(t.id, g.id) AS relevancy
	  FROM titles t
			   LEFT JOIN votes_on_genre vog ON t.id = vog.title_id
			   LEFT JOIN genres g ON vog.genre_id = g.id
	 GROUP BY
		 t.id, g.genre
	 ORDER BY
		 t.id, relevancy DESC;
-- DROP VIEW IF EXISTS titles_and_genres;


-- ----------------------------------- KEYWORDS GENERAL INFO view
CREATE OR REPLACE VIEW keywords_info AS
	SELECT ak.id AS k_id,
		   ak.keyword,
		   fk.c AS followers,
		   vok.c AS all_titles,
		   vok_r.c AS relevant_titles
	  FROM all_keywords ak
			   LEFT JOIN (SELECT count(user_id) AS c,
								 keyword_id
							FROM follow_keyword
						   GROUP BY keyword_id
						 ) AS fk ON ak.id = fk.keyword_id
			   LEFT JOIN (SELECT count(title_id) AS c, -- All titles
								 keyword_id
							FROM votes_on_keywords
						   GROUP BY keyword_id
						 ) AS vok ON ak.id = vok.keyword_id
			   LEFT JOIN (SELECT count(title_id) AS c, -- Relevant titles
								 keyword_id
							FROM votes_on_keywords
						   WHERE k_relevancy(title_id, keyword_id) > 0
						   GROUP BY keyword_id
						 ) AS vok_r ON ak.id = vok_r.keyword_id
	 ORDER BY
		 ak.id;
-- DROP VIEW IF EXISTS keywords_info;

/*
 * 
+------+--------------------+-----------+------------+-----------------+
| k_id | keyword            | followers | all_titles | relevant_titles |
+------+--------------------+-----------+------------+-----------------+
|    1 | vampire            |         3 |         19 |              15 |
|    2 | love               |         6 |         17 |              13 |
|    3 | dorama             |         8 |         29 |              15 |
|    4 | happy ending       |        13 |         20 |              10 |
|    5 | shapeshifters      |        10 |          9 |               3 |
|    6 | war                |         7 |          8 |               4 |
|    7 | angels             |        12 |         10 |               7 |
|    8 | cars               |        10 |          5 |               5 |
|    9 | racing             |         9 |          6 |               4 |
|   10 | hackers            |         6 |          4 |               2 |
|   11 | designers          |        11 |         17 |               8 |
|   12 | cooking            |         9 |          7 |               2 |
|   13 | doctors            |        11 |         10 |               7 |
|   14 | medicine           |        11 |         10 |               7 |
|   15 | firefighters       |         5 |          4 |               4 |
|   16 | apocalypse         |         6 |          3 |               1 |
|   17 | everyone dies      |         6 |          6 |               3 |
|   18 | blood              |         3 |         12 |               8 |
|   19 | slasher            |         9 |          7 |               4 |
|   20 | pets               |         6 |          5 |               4 |
|   21 | cats               |         8 |          7 |               2 |
|   22 | dogs               |        11 |          6 |               3 |
|   23 | cancer             |         3 |          9 |               5 |
|   24 | dancing            |         7 |          6 |               2 |
|   25 | baby               |        10 |          9 |               4 |
|   26 | mental health      |         5 |          5 |               5 |
|   27 | batman             |        10 |          6 |               5 |
|   28 | country life       |         8 |          5 |               5 |
|   29 | highschool         |        13 |          6 |               6 |
|   30 | teenagers          |         8 |          7 |               3 |
|   31 | dying              |         7 |          6 |               5 |
|   32 | dreams             |         8 |          5 |               2 |
|   33 | multiple realities |        14 |          8 |               5 |
|   34 | reverse harem      |        14 |          6 |               3 |
|   35 | sad                |         7 |          8 |               5 |
|   36 | traveling          |         9 |          7 |               4 |
|   37 | wild life          |         6 |          4 |            NULL |
|   38 | science            |         7 |          4 |               2 |
|   39 | geeks              |        11 |          6 |               1 |
|   40 | vikings            |         5 |          9 |               8 |
|   41 | mythology          |         6 |          8 |               5 |
|   42 | lacorn             |         4 |          4 |               4 |
|   43 | gamers             |        10 |          7 |               5 |
|   44 | anime              |         2 |          4 |               4 |
|   45 | law                |         8 |          7 |               3 |
|   46 | police             |        11 |          7 |               5 |
|   47 | gangs              |         3 |          6 |               5 |
|   48 | faith              |         6 |          5 |               4 |
|   49 | demons             |        10 |          7 |               4 |
|   50 | ghosts             |         8 |          8 |               4 |
+------+--------------------+-----------+------------+-----------------+
50 rows in set (0.07 sec)
 */




-- ----------------------------------- REVIEWS INFO view
CREATE OR REPLACE VIEW reviews_info AS
	SELECT r.title_id AS t_id,
		   t.title,
		   r.id AS rev_id,
		   r.body,
		   CASE (r.is_positive)
			   WHEN 1 THEN 'positive'
			   WHEN 0 THEN 'negative'
			   END AS mood,
		   review_rate(r.id) AS voted,
		   u.username
	  FROM reviews r
			   JOIN titles t ON r.title_id = t.id
			   JOIN users u ON r.user_id = u.id
	 ORDER BY
		 r.id;
-- DROP VIEW IF EXISTS reviews_info;


-- ---------------------------------------------------------
-- ----------------------- PROFILE VIEWS -------------------
-- ---------------------------------------------------------


-- ----------------------------------- TITLES PROFILES view
CREATE OR REPLACE VIEW t_profiles AS
	SELECT t.id AS t_id,
		   t.title,
		   tt.title_type,
		   r.avgr AS rating,
		   r.count AS r_votes,
		   seen.c AS was_seen,
		   to_w.c AS on_watchlist,
		   uli.c AS on_user_lists,
		   r2.c AS reviewed,
		   ti.release_date,
		   ti.rars,
		   t.original_title,
		   ti.poster,
		   ti.tagline,
		   ti.synopsis
	  FROM titles AS t
			   INNER JOIN title_info ti ON t.id = ti.title_id
			   INNER JOIN title_types tt ON tt.id = ti.title_type_id
			   LEFT JOIN (SELECT title_id,
								 round(avg(rating)) AS avgr,
								 count(rating) AS count
							FROM rating
						   GROUP BY title_id
						 ) AS r ON r.title_id = t.id
			   LEFT JOIN (SELECT count(is_seen) AS c,
								 title_id
							FROM watchlist
						   WHERE is_seen = 1
						   GROUP BY title_id
						 ) seen ON seen.title_id = t.id
			   LEFT JOIN (SELECT count(is_seen) AS c,
								 title_id
							FROM watchlist
						   WHERE is_seen = 0
						   GROUP BY title_id
						 ) to_w ON to_w.title_id = t.id
			   LEFT JOIN (SELECT count(list_id) AS c,
								 title_id
							FROM user_list_items
						   GROUP BY title_id
						 ) uli ON t.id = uli.title_id
			   LEFT JOIN (SELECT count(id) AS c,
								 title_id
							FROM reviews
						   GROUP BY title_id
						 ) r2 ON t.id = r2.title_id
	 ORDER BY
		 t.id;
-- DROP VIEW IF EXISTS t_profiles;


-- ----------------------------------- USERS PROFILES view
CREATE OR REPLACE VIEW u_profiles AS
	SELECT u.id AS u_id,
		   concat_ws(' ', up.first_name, up.last_name) AS name,
		   u.username,
		   u.phone_number,
		   u.email,
		   up.date_of_birth,
		   TIMESTAMPDIFF(YEAR, up.date_of_birth, NOW()) AS age,
		   CASE (up.gender)
			   WHEN 'm' THEN 'male'
			   WHEN 'f' THEN 'female'
			   WHEN 'nb' THEN 'non-binary'
			   WHEN 'ud' THEN 'undefined'
			   END AS gender,
		   CASE (up.is_private)
			   WHEN 1 THEN 'private'
			   WHEN 0 THEN 'public'
			   END AS account,
		   fu_t.c AS followers,
		   fu_f.c AS following,
		   to_w.c AS to_watch,
		   seen.c AS titles_seen,
		   ul.lists,
		   r.c AS reviews,
		   r2.c AS rated_titles,
		   r2.avg_rating,
		   c.country,
		   up.avatar,
		   up.about
	  FROM users u
			   LEFT JOIN user_profiles up ON u.id = up.user_id
			   LEFT JOIN countries c ON up.country_id = c.id
			   LEFT JOIN (SELECT count((id)) AS c, -- Number of followers
								 target_id
							FROM follow_user
						   GROUP BY target_id
						 ) fu_t ON u.id = fu_t.target_id
			   LEFT JOIN (SELECT count((id)) AS c, -- Number of users, he/she is following
								 follower_id
							FROM follow_user
						   GROUP BY follower_id
						 ) fu_f ON u.id = fu_f.follower_id
			   LEFT JOIN (SELECT user_id,
								 count(title_id) AS c
							FROM watchlist
						   WHERE is_seen = 0
						   GROUP BY user_id
						 ) to_w ON u.id = to_w.user_id
			   LEFT JOIN (SELECT user_id,
								 count(title_id) AS c
							FROM watchlist
						   WHERE is_seen = 1
						   GROUP BY user_id
						 ) seen ON u.id = seen.user_id
			   LEFT JOIN (SELECT count(list_name) AS lists,
								 user_id
							FROM user_lists
						   GROUP BY user_id
						 ) ul ON u.id = ul.user_id
			   LEFT JOIN (SELECT count(id) AS c,
								 user_id
							FROM reviews
						   GROUP BY user_id
						 ) r ON u.id = r.user_id
			   LEFT JOIN (SELECT count(id) AS c,
								 round(avg(rating)) AS avg_rating,
								 user_id
							FROM rating
						   GROUP BY user_id
						 ) r2 ON u.id = r2.user_id
	 ORDER BY
		 u.id
		limit 15;
-- DROP VIEW IF EXISTS u_profiles;

