WITH ratings AS (
    SELECT
        vehicle_price,
        customer_id,
        order_id,
        quarter_number,
        customer_feedback,
        ship_date,
        order_date,
        product_id,
        LAG(vehicle_price, 1) OVER (ORDER BY quarter_number) AS previous_revenue,
        CASE
            WHEN LOWER(customer_feedback) = "very good" THEN 5
            WHEN LOWER(customer_feedback) = "good" THEN 4
            WHEN LOWER(customer_feedback) = "okay" THEN 3
            WHEN LOWER(customer_feedback) = "bad" THEN 2
            ELSE 1
        END AS 'rating' 
    FROM
        newninja.order_t
)

SELECT
    quarter_number,
    SUM(vehicle_price) AS total_revenue,
    SUM(previous_revenue) AS previous_total_revenue,
    (SUM(vehicle_price) - SUM(previous_revenue)) / SUM(previous_revenue) * 100 AS percentage_change
FROM
    ratings
GROUP BY
    quarter_number
ORDER BY
    quarter_number;





























-- with ratings as (
-- select vehicle_price, customer_id, order_id, quarter_number, customer_feedback, ship_date, order_date, product_id,
-- LAG(vehicle_price, 1) OVER (ORDER BY quarter_number) AS previous_revenue,
-- case when lower(customer_feedback) = "very good" then 5
-- when lower(customer_feedback) = "good" then 4
-- when lower(customer_feedback) = "okay" then 3
-- when lower(customer_feedback) = "bad" then 2
-- else 1
-- end as 'rating' 
-- from newninja.order_t)


-- -- customer ratings by quarter
-- select customer_id, quarter_number, rating, customer_feedback,order_id, vehicle_price, 
-- ship_date, order_date, product_id, previous_revenue,
--   (vehicle_price - previous_revenue) / previous_revenue * 100 AS percentage_change
-- from ratings


-- select quarter_number, sum( (vehicle_price - previous_revenue) / previous_revenue * 100) AS percentage_change
-- from ratings
-- group by 1

-- with prev_revenue as ( select quarter_number, vehicle_price, LAG(vehicle_price, 1) OVER (ORDER BY quarter_number) AS previous_revenue from newninja.order_t)



-- SELECT  sum(vehicle_price) as last_quarter_revenue, count(distinct customer_id) as total_customers, 
-- count(order_id) as total_orders, avg(rating) as average_rating
-- FROM ratings
-- where quarter_number = 4

-- Avg days to ship
-- SELECT  order_id, ship_date, order_date
-- -- AVG(DATEDIFF(ship_date, order_date)) AS average_days_to_ship
-- FROM newninja.order_t;

-- SELECT
-- COUNT(*) AS total_orders,
-- COUNT(CASE WHEN lower(customer_feedback) = 'very good' THEN 1 END) AS verygood_customers,
-- COUNT(CASE WHEN lower(customer_feedback) = 'good' THEN 1 END) AS good_customers,
-- COUNT(CASE WHEN lower(customer_feedback) = 'okay' THEN 1 END) AS okay_customers,
-- (COUNT(CASE WHEN lower(customer_feedback) = 'very good' THEN 1 END) + 
--COUNT(CASE WHEN lower(customer_feedback) = 'good' THEN 1 END) + 
-- COUNT(CASE WHEN lower(customer_feedback) = 'okay' THEN 1 END) ) / COUNT(*) * 100 AS percentage
-- FROM newninja.order_t;










-- select * from newninja.order_t
-- with ratings as (select customer_id, product_id, customer_feedback, ship_date,
--  dense_rank() over (partition by customer_feedback order by ship_date desc) as 'rank' from newninja.order_t)
