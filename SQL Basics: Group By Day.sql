/* There is an events table used to track different key activities taken on a website. For this task you need to filter the name field to only show "trained" events. Events should be grouped by the day they happened and the grouping count. The description field is used to distinguish which items the events happened on.

"events" Table Schema
id
name (String)
created_at (DateTime)
description (String)
When running tests, the expected results is provided so that you can see what the expected output is supposed to look like. Your "actual" output needs to match the expected output. You can run tests now with the starting code to get a better idea of what the expected results and schema are.

*/

 SELECT 
   CAST(created_at as date) as day
 , description
 , count(id) as count
  FROM events 
 WHERE name = 'trained'
 GROUP BY 1,2;
