/* For this kata we will be using the DVD Rental database[https://www.postgresqltutorial.com/postgresql-sample-database/].

You are working for a company that wants to reward its top 10 customers with a free gift. You have been asked to generate a simple report that returns the top 10 customers by total amount spent ordered from highest to lowest. Total number of payments has also been requested.

The query should output the following columns:

customer_id [int4]
email [varchar]
payments_count [int]
total_amount [float]
and has the following requirements:

only returns the 10 top customers, ordered by total amount spent from highest to lowest */

SELECT p.customer_id
, c.email
, count(payment_id) as payments_count
, sum(amount)::FLOAT as total_amount
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY 1,2
ORDER BY total_amount desc
LIMIT 10SQL Basics: Top 10 customers by total payments amountSQL Basics: Top 10 customers by total payments amount
