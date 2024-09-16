-- select date(occurred_at) as extracted_date, total_amt_usd from parch_data.orders

-- sum of orders year on year
-- select year(occurred_at) as extracted_year, count(id) as total_orders, sum(total_amt_usd) total_orders_usd from parch_data.orders
-- group by 1
-- order by 1 desc

-- total accounts 
-- select count(id), count(name) from parch_data.accounts


-- top performing sales reps
-- with sales_person as (select a.id account_id, a.name company_name, sales_rep_id, s.name sales_person_name, s.region_id, r.name as region_name, o.id orders_id,
-- o.account_id orders_account, o.occurred_at, o.total, o.total_amt_usd from parch_data.accounts a
-- join parch_data.sales_reps s
-- on a.sales_rep_id = s.id
-- join parch_data.region r
-- on s.region_id = r.id
-- join  (select id, account_id, occurred_at,total, total_amt_usd from parch_data.orders) o
-- on a.id = o.account_id)

-- select sales_person_name, year(occurred_at) year, region_name, sum(total) total_sales , sum(total_amt_usd) total_sales_usd from sales_person
-- where year(occurred_at)= 2016 
-- group by 1, 2, 3
-- order by 4 desc, 5 desc

-- lifetime top sales reps
-- select sales_person_name, sum(total) total_sales , sum(total_amt_usd) total_sales_usd from sales_person
-- group by 1
-- order by 2 desc, 3 desc

-- w/o grouping the year, this data shows that DAwna makes the most sales in a day (quantity and amount)
-- in the years this data was collected but isn't necessarily the top performing sales rep generally, grouping or extracting the year shows us dawna's and others
-- overall performance for the year. We can also check other datapoints such as top performing sales rep in different regions, such as the northeast etc

-- what regions did the highest orders occur in 2016
-- select region_name, sum(total), sum(total_amt_usd), year(occurred_at) year from sales_person
-- where year(occurred_at) = 2016
-- group by 1, 4
-- order by 4 desc, 3 desc

-- Location data
-- select a.id, latitude, longitude, sr.region_id, r.name from parch_data.accounts a
-- join parch_data.sales_reps sr
-- on a.sales_rep_id = sr.id
-- join parch_data.region r
-- on r.id = sr.region_id

-- accounts that purchased the other items - std qty, gloss qty, poster qty
-- select orders.*, a.name, a.primary_poc from parch_data.orders
-- join parch_data.accounts a
-- on a.id = orders.account_id
-- where standard_qty != 0 and gloss_qty != 0 and poster_qty != 0

-- showing year on year increase, what percentage of the total is the standard quantity amount
-- select year(occurred_at) year, (sum(standard_amt_usd)/sum(total_amt_usd)) * 100 standard_quantity from parch_data.orders
-- group by 1
-- order by 1 desc

-- showing year on year increase, what percentage of the total are the different quantity revenues
-- select year(occurred_at) year, (sum(standard_amt_usd)/sum(total_amt_usd)) * 100 standard_quantity, 
--  (sum(gloss_amt_usd)/sum(total_amt_usd)) * 100 gloss_quantity, 
--  (sum(poster_amt_usd)/sum(total_amt_usd)) * 100 poster_quantity 
--  from parch_data.orders
-- group by 1
-- order by 1 desc


-- sort users order by price and qty to observe top customers 
-- select account_id, occurred_at, count(id), sum(total_amt_usd) from parch_data.orders
-- group by 1,2
-- order by 3 desc

-- 	exploring webevents table
-- with joined_data as (select web_events.*, accounts.*, orders.* from parch_data.web_events
-- 						join parch_data.accounts
-- 							on accounts.id = web_events.account_id
-- 						join parch_data.orders
--                         on orders.occurred_at = web_events.occurred_at)

-- select * from joined_data

select w.channel, 
-- year(o.occurred_at),
 sum(o.total_amt_usd) from parch_data.web_events w
join parch_data.orders o
on o.account_id = w.account_id
where channel <> "direct"
group by 1
order by 2 desc


