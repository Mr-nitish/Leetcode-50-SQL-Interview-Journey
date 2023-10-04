WITH cte as  
(SELECT *,DATE_ADD(recordDate , interval-1 DAY)
AS yesterday_DATE , LAG(recordDate) over(ORDER BY recordDate)
As prev_recordDate , LAG(temperature)
OVER(ORDER BY recordDate) AS prev_temp
FROM weather) 

SELECT id
FROM CTE
WHERE yesterday_DATE = prev_recordDate
and temperature > prev_temp ;
