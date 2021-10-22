/*Given film_actor and film tables from the DVD Rental sample database find all movies both Sidney Crowe (actor_id = 105) and Salma Nolte (actor_id = 122) cast in together and order the result set alphabetically.

film schema
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
title       | character varying(255)      | not null
film_id     | smallint                    | not null
film_actor schema
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | smallint                    | not null
film_id     | smallint                    | not null
last_update | timestamp without time zone | not null 
actor schema
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | integer                     | not null 
first_name  | character varying(45)       | not null
last_name   | character varying(45)       | not null
last_update | timestamp without time zone | not null 
The desired output:

title
-------------
Film Title 1
Film Title 2
...
title - Film title */

WITH Sidney as (SELECT 
fs.title
, fa.actor_id
, fa.film_id
FROM film_actor fa
JOIN film fs
ON fa.film_id = fs.film_id
WHERE actor_id = 105 
ORDER BY title asc)  
, Total AS (SELECT 
fs.title
, fa.actor_id
, fa.film_id
FROM film_actor fa
JOIN film fs
ON fa.film_id = fs.film_id
ORDER BY title asc) 
 SELECT t.title
FROM Total t
JOIN Sidney s
ON t.film_id = s.film_id
WHERE t.actor_id = 122;
