/* Given the the schema presented below find two actors who cast together the most and list titles of only those movies they were casting together. Order the result set alphabetically by the movie title.

Table film_actor
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | smallint                    | not null
film_id     | smallint                    | not null
...
Table actor
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | integer                     | not null 
first_name  | character varying(45)       | not null
last_name   | character varying(45)       | not null
...
Table film
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
film_id     | integer                     | not null
title       | character varying(255)      | not null
...
The desired output:
first_actor | second_actor | title
------------+--------------+--------------------
John Doe    | Jane Doe     | The Best Movie Ever
...
first_actor - Full name (First name + Last name separated by a space)
second_actor - Full name (First name + Last name separated by a space)
title - Movie title
Note: actor_id of the first_actor should be lower then actor_id of the second_actor */

WITH act_together as 
(SELECT a.actor_id as first_actor_id
 , b.actor_id as second_actor_id
 , a.film_id
 FROM film_actor a
 JOIN film_actor b
 ON a.film_id = b.film_id and a.actor_id <> b.actor_id
),
count_films as
(SELECT first_actor_id,second_actor_id, COUNT(distinct film_id) as count_movies
FROM act_together
GROUP BY 1,2
ORDER BY count_movies desc
LIMIT 1)
SELECT CONCAT(a1.first_name,' ', a1.last_name)  AS first_actor
, CONCAT(a2.first_name, ' ', a2.last_name)  AS second_actor
, t.title
FROM act_together at
JOIN count_films cf
ON at.first_actor_id = cf.first_actor_id AND at.second_actor_id = cf.second_actor_id
JOIN  film t
ON at.film_id = t.film_id
JOIN actor a1
ON at.first_actor_id = a1.actor_id
JOIN actor a2
ON at.second_actor_id = a2.actor_id
