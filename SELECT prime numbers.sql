/* Write a SELECT query which will return all prime numbers smaller than 100 in ascending order.

Your query should return one column named prime. */

SELECT num.a AS prime
  FROM generate_series(2, 100) AS num(a)
  WHERE NOT EXISTS (
    SELECT den.a
    FROM generate_series(2, num.a-1) AS den(a)
    WHERE num.a % den.a = 0
    ); 
