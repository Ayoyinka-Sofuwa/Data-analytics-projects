-- with details as (SELECT p.vehicle_maker, p.product_id, p.vehicle_model_year, o.order_id, 
-- o.customer_id, o.vehicle_price, c.state FROM newninja.product_t as p
-- join (select order_id, customer_id, vehicle_price, product_id from newninja.order_t) as o
-- on o.product_id = p.product_id 
-- join (select customer_id, state from newninja.customer_t) c 
-- on o.customer_id = c.customer_id)

-- -- -- top vehicle per state
-- -- select state, vehicle_maker, count(vehicle_maker) as count,
-- --  rank() over (partition by state order by count(state) desc) as state_rank  from details
-- -- GROUP BY state, vehicle_maker
-- -- ORDER BY 3 desc -- 

-- select state, vehicle_maker, count(order_id) as order_count from details
-- group by state, vehicle_maker
-- having count(order_id) = max(count(order_id))



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
