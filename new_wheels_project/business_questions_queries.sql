-- top vehicle makers by number of customers
select p.vehicle_maker, count(o.customer_id) as no_of_customers
from newninja.order_t o
join product_t p
on p.product_id = o.product_id
group by 1
order by 2 desc
limit 10


-- most preferred vehicle by state
WITH details AS (
    SELECT p.vehicle_maker, p.product_id, p.vehicle_model_year, o.order_id,
           o.customer_id, o.vehicle_price, c.state
    FROM newninja.product_t AS p
    JOIN (
        SELECT order_id, customer_id, vehicle_price, product_id
        FROM newninja.order_t
    ) AS o ON o.product_id = p.product_id
    JOIN (
        SELECT customer_id, state
        FROM newninja.customer_t
    ) AS c ON o.customer_id = c.customer_id
)


SELECT state, vehicle_maker, order_count
FROM (
    SELECT state, vehicle_maker, COUNT(order_id) AS order_count,
           ROW_NUMBER() OVER (PARTITION BY state ORDER BY COUNT(order_id) DESC) AS ranking
    FROM details
    GROUP BY state, vehicle_maker
) AS ranked_data
WHERE ranking = 1;

-- Trend of purchases by quarter
select quarter_number, sum(vehicle_price), count(order_id)
from order_t
group by 1
order by 1 asc;


-- Avg discount offered by credit card type
with customer_details as (
SELECT cus.customer_id, order_table.order_id, cus.credit_card_type, order_table.discount as discount FROM newninja.customer_t cus
join (select customer_id, order_id, discount from newninja.order_t) as order_table 
on cus.customer_id = order_table.customer_id)

select credit_card_type, avg(discount) avg_discount
from customer_details
group by 1;


-- Time taken to ship orders by quarter
-- Avg days to ship
SELECT  quarter_number, AVG(DATEDIFF(ship_date, order_date)) AS average_days_to_ship
FROM newninja.order_t
group by 1
order by 1;

-- average days to ship
select avg(datediff(ship_date, order_date)) from test.order_t;

-- last quarter revenue
select sum(vehicle_price)
from order_t
where  quarter_number = 4;

-- average rating
with ratings as (
select CASE
            WHEN LOWER(customer_feedback) = "very good" THEN 5
            WHEN LOWER(customer_feedback) = "good" THEN 4
            WHEN LOWER(customer_feedback) = "okay" THEN 3
            WHEN LOWER(customer_feedback) = "bad" THEN 2
            ELSE 1
        END AS 'rating' 
from newninja.order_t)

select avg(rating) from ratings;


-- percentage of good feedback
SELECT
COUNT(*) AS total_orders,
COUNT(CASE WHEN lower(customer_feedback) = 'very good' THEN 1 END) AS verygood_customers,
COUNT(CASE WHEN lower(customer_feedback) = 'good' THEN 1 END) AS good_customers,
COUNT(CASE WHEN lower(customer_feedback) = 'okay' THEN 1 END) AS okay_customers,
(COUNT(CASE WHEN lower(customer_feedback) = 'very good' THEN 1 END) + 
COUNT(CASE WHEN lower(customer_feedback) = 'good' THEN 1 END) + 
COUNT(CASE WHEN lower(customer_feedback) = 'okay' THEN 1 END) ) / COUNT(*) * 100 AS percentage_of_good_feedback
FROM newninja.order_t;

-- top 5 states with the most customers
select state, count(customer_id)
from customer_t
group by state
order by count(customer_id) desc
limit 5;

with ratings as (
select quarter_number, CASE
            WHEN LOWER(customer_feedback) = "very good" THEN 5
            WHEN LOWER(customer_feedback) = "good" THEN 4
            WHEN LOWER(customer_feedback) = "okay" THEN 3
            WHEN LOWER(customer_feedback) = "bad" THEN 2
            ELSE 1
        END AS 'rating' 
from newninja.order_t)

select avg(rating) as average_rating, quarter_number
from ratings
group by quarter_number
order by quarter_number;






