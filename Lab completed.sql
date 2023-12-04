USE sakila;

-- Challenge 1

-- 1.1

SELECT min(length) as 'min_duration', title FROM film;

SELECT max(length) as 'max_duration' from film;

-- 1.2

SELECT CONCAT(FLOOR(AVG(length) / 60), ' hours ', ROUND(AVG(length) % 60), ' min') as 'average_duration'
FROM film;

-- 2.1

SELECT DATEDIFF(
    (SELECT MIN(DATE(rental_date)) FROM rental),
    (SELECT MAX(DATE(return_date)) FROM rental)
) AS opening_since;

-- 2.2

SELECT *, 
    date_format(CONVERT(left(rental_date, 6), DATE), '%D') AS 'issued_day',
    date_format(CONVERT(left(rental_date, 6), DATE), '%M') AS 'issued_month'
FROM rental
LIMIT 20;

-- 3

SELECT title,IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;

-- Challenge 2

-- 1.1

SELECT count(film_id) FROM film;

-- 1.2

SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;

-- 1.3
SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC;

-- 2.1

SELECT rating, round(AVG(length),2) AS 'average' 
FROM film
GROUP BY rating
ORDER BY average DESC;

-- 2.2

SELECT rating
FROM film
GROUP BY rating
HAVING AVG(length) >= 120
ORDER BY AVG(length) DESC;


