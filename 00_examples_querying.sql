-- Use .mode to format the output on the command line in an easier to read way
.mode box

-- SELECT

SELECT * FROM longlist;

SELECT title FROM longlist;

SELECT title, author FROM longlist;

-- LIMIT

SELECT title, author FROM longlist LIMIT 3;

SELECT title, author FROM longlist LIMIT 10;

-- WHERE

SELECT title, author, year FROM longlist WHERE year=2023;

SELECT title, author, year FROM longlist WHERE year!=2023;

SELECT title, author, year FROM longlist WHERE year<>2023;

-- WHERE (text)

SELECT title, format FROM longlist WHERE format = 'hardcover';

SELECT title, format FROM longlist WHERE format != 'hardcover';

SELECT title, format FROM longlist WHERE format <> 'hardcover';

-- NOT

SELECT title, format FROM longlist WHERE NOT format = 'hardcover';

-- WHERE (compound conditions)

SELECT title, year FROM longlist WHERE year = 2022 OR year = 2023;

-- Finds hardcover books nominated in 2022 or 2023
SELECT title, year FROM longlist WHERE (year = 2022 OR year = 2023) AND format = 'hardcover';

-- NULL

-- Finds books without a translator
SELECT title, translator FROM longlist WHERE translator IS NULL;

-- Finds books with a translator
SELECT title, translator FROM longlist WHERE translator IS NOT NULL;


-- LIKE

SELECT title from longlist where title = 'whale';
SELECT title from longlist where title LIKE 'whale';
SELECT title from longlist where title LIKE 'whale%';
SELECT title from longlist where title LIKE 'whale_';


-- Finds all books with love in the title
SELECT title FROM longlist WHERE title LIKE '%love%';

-- Finds all books that begin with The (includes There, etc.)
SELECT title FROM longlist WHERE title LIKE 'The%';

-- Finds all books that begin with The
SELECT title FROM longlist WHERE title LIKE 'The %';

-- Finds a book whose title unsure how to spell
SELECT title FROM longlist WHERE title LIKE 'P_re';

-- RANGES & BETWEEN

-- Find all books nominated between 2019 and 2022 using many ORs, inefficient and tedious
SELECT title, year FROM longlist
WHERE year = 2019 OR year = 2020 OR year = 2021 OR year = 2022;

-- Find all books nominated between 2019 and 2022 with a range condition
SELECT title, year FROM longlist WHERE year >= 2019 AND year <= 2022;

-- Find all books nominated between 2019 and 2022 with BETWEEN
SELECT title, year FROM longlist WHERE year BETWEEN 2019 AND 2022;

-- Selects books with a rating above 4.0
SELECT title, rating FROM longlist WHERE rating > 4.0;

-- Selects books with a rating above 4.0 and at least 1000 votes
SELECT title, rating FROM longlist WHERE rating > 4.0 AND votes > 1000;

-- Selects books with fewer than 300 pages
SELECT title, pages FROM longlist WHERE pages < 300;


-- ORDER BY

-- Finds top 10 books by rating (incorrectly)
SELECT title, rating FROM longlist ORDER BY rating LIMIT 10;

-- Finds top 10 books by rating (correctly)
SELECT title, rating FROM longlist ORDER BY rating DESC LIMIT 10;

-- Sorts by more than one column
SELECT title, rating, votes FROM longlist
ORDER BY rating DESC, votes DESC
LIMIT 10;

-- Sorts with a condition
SELECT title, rating FROM longlist
WHERE votes > 10000 ORDER BY rating DESC
LIMIT 10;

-- AGGREGATE FUNCTIONS

-- Finds the average rating of all longlisted books
SELECT AVG(rating) FROM longlist;

-- Rounds the result
SELECT ROUND(AVG(rating), 2) FROM longlist;

-- Renames column with AS
SELECT ROUND(AVG(rating), 2) AS "Average Rating" FROM longlist;

-- ROUND is NOT an aggregate function and can also be applied to row-level values

SELECT ROUND(rating, 2) AS "Rounded Rating" FROM longlist;

-- Finds maximum rating
SELECT MAX(rating) FROM longlist;

-- Finds minimum rating
SELECT MIN(rating) FROM longlist;

-- Finds total number of votes
SELECT SUM(votes) FROM longlist;

-- Finds total number of books
SELECT COUNT(*) FROM longlist;

-- Finds total number of translators
SELECT COUNT(translator) FROM longlist;

-- Incorrectly counts publishers
SELECT COUNT(publisher) FROM longlist;

-- Correctly counts publishers
SELECT COUNT(DISTINCT publisher) FROM longlist;