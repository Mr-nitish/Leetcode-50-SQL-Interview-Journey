# Write your MySQL query statement below

SELECT t1.machine_id machine_id , round(avg(diff),3) as processing_time
FROM (
SELECT a.machine_id , a.process_id , abs(a.timestamp - b.timestamp) as diff

FROM Activity a INNER JOIN  Activity b
ON a.machine_id = b.machine_id
and a.process_id = b.process_id
and a.activity_type = 'start' and b.activity_type = 'end') t1
GROUP BY t1.machine_id ;
