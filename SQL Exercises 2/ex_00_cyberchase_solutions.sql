-- 1. List all the tables in the database with a dot-command

.tables

-- one table named "episodes"

SELECT * FROM episodes LIMIT 1;

-- Columns:
-- id, season, episode_in_season, title, topic, air_date, production_code

-- 2. Write a SQL query to list the titles of all episodes in Cyberchase’s original season, Season 1.

SELECT title FROM episodes WHERE season=1;

-- 3. List the season and title of the first episode of every season.

SELECT season, title FROM episodes WHERE episode_in_season=1;

-- 4. Find the production code for the episode “Hackerized!”.

SELECT production_code FROM episodes WHERE title='Hackerized!';

-- production code: CYB091

-- 5. Write a query to find the titles of episodes that do not yet have a listed topic.

SELECT title FROM episodes WHERE topic IS NULL;

-- 6. Find the title of the holiday episode that aired on December 31st, 2004.

SELECT title FROM episodes WHERE air_date = '2004-12-31';

-- title: Starlight Night

-- 7. List the titles of episodes from season 6 (2008) that were released early, in 2007.

SELECT title FROM episodes WHERE season=6 AND air_date LIKE '2007%';

-- 8. Write a SQL query to list the titles and topics of all episodes teaching fractions.

SELECT title, topic FROM episodes WHERE topic LIKE '%fractions%';

-- 9. Write a query that counts the number of episodes released from 2018 to 2023, inclusive.
--      You might find it helpful to know you can use BETWEEN with dates, such as BETWEEN '2000-01-01' AND '2000-12-31'.

SELECT COUNT(*) FROM episodes WHERE air_date BETWEEN '2018-01-01' AND '2023-12-31';

-- Number of episodes: 31

-- 10. Write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.

SELECT COUNT(*) FROM episodes WHERE air_date BETWEEN '2002-01-01' AND '2007-12-31';

-- Number of episodes: 74

-- 11. Write a SQL query to list the ids, titles, and production codes of all episodes. Order the results by production code, from earliest to latest.

SELECT id, title, production_code, air_date FROM episodes ORDER BY production_code, air_date;

-- 12. List the titles of episodes from season 5, in reverse alphabetical order.

SELECT title FROM episodes ORDER BY title DESC;

-- 13. Count the number of unique episode titles.

SELECT COUNT(DISTINCT title) FROM episodes;

-- Number of unique titles: 136
