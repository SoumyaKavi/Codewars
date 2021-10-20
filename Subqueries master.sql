/* The objective of this Kata is to show that you are proficient at string manipulation (and perhaps that you can use extensively subqueries).

You will use people table but will focus solely on the name column

name
Greyson Tate Lebsack Jr.
Elmore Clementina O'Conner
you will be provided with a full name and you have to return the name in columns as follows.

name	first_lastname	second_lastname
Greyson Tate	Lebsack	Jr.
Elmore	Clementina	O'Conner
Note: Don't forget to remove spaces around names in your result. Note: Due to multicultural context, if full name has more than 3 words, consider first 2 as name

*/

SELECT 
       CASE WHEN test1 = '' and test2 = '' THEN name
             WHEN test1 != '' and test2 = '' THEN concat(name, ' ',first_lastname)
              ELSE concat(name, ' ',first_lastname, ' ', second_lastname) end as name
  ,     CASE WHEN test1 = '' and test2 = '' THEN first_lastname
              WHEN test1 != '' and test2 = '' THEN second_lastname
               ELSE  test1 end as first_lastname
  ,     CASE WHEN test1 = '' and test2 = '' THEN second_lastname
              WHEN test1 != '' and test2 = '' THEN test1
               ELSE test2 end as second_lastname
     FROM
          (SELECT 
                  split_part(name,' ',1) as name
                , split_part(name,' ',2) as first_lastname
                , split_part(name,' ',3) as second_lastname
                , split_part(name,' ',4) as test1
                , split_part(name,' ',5) as test2
              --, split_part(name,' ',6) as test3 Note: This is to check if any of the names had five parts. None have 5 parts
           FROM people) as name_parts
