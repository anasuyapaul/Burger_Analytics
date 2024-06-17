create database Burger_Analytics
use Burger_Analytics
  
select * from `burger runner orders`
select * from `burger name`
select * from `burger runner`

Questions:
  
1. Retrieve all orders that were not canceled:
  
select * from `burger runner orders` where cancellation is null

2. Delete all records of orders that were canceled:
  
delete from `burger runner orders` where cancellation is not null

SET SQL_SAFE_UPDATES = 0;

3.Count the number of orders each runner has completed, grouping by runner_id:
  
SELECT runner_id, COUNT(order_id) AS completed_orders
FROM `burger runner orders`
WHERE cancellation IS NULL
GROUP BY runner_id;

4. Combine all runner IDs from the orders and runners tables to find all unique runner IDs:
  
select runner_id from `burger runner orders` 
union 
select runner_id from `burger runner`

5. Retrieve each order with the corresponding runner's registration date:

SELECT bro.order_id, bro.runner_id, bro.pickup_time, bro.distance, bro.duration, bro.cancellation, br.registration_date
FROM `burger runner orders` AS bro
JOIN `burger runner` AS br ON bro.runner_id = br.runner_id;

6. Get the names of burgers ordered along with their respective order IDs:
  
select bro.order_id, bn.burger_name
From `burger runner orders` AS bro
Left Join `burger name` As bn ON bro.order_id= bn.burger_id

7. Find the total number of orders and the average distance covered by each runner:
  
SELECT bro.runner_id,
       COUNT(bro.order_id) AS `Total orders`,
       AVG(bro.distance) AS `average_distance`
FROM `burger runner orders` AS bro
JOIN `burger runner` AS br ON bro.runner_id = br.runner_id
GROUP BY bro.runner_id;

8. List all orders along with the runner's registration date and distance greater than 5 km:
  
select bro.runner_id, 
SELECT bro.order_id, bro.runner_id, bro.pickup_time, bro.distance, br.registration_date
FROM `burger runner orders` AS bro
JOIN `burger runner` AS br ON bro.runner_id = br.runner_id
WHERE bro.distance > 5;

9.Get the list of runners who have not canceled any orders along with their registration dates:

SELECT DISTINCT br.runner_id, br.registration_date
FROM `burger runner` AS br
JOIN `burger runner orders` AS bro ON br.runner_id = bro.runner_id
WHERE bro.cancellation IS NULL;
