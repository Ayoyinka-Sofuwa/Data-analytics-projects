

-- new extraction syntax: table_name.* (all columns) or table_name.specific column
select orders.*, accounts.* from parch_data.orders 
join parch_data.accounts
on orders.account_id = accounts.id


select * from parch_data.web_events w
join parch_data.orders o
on orders.account_id = web_events.account_id
where channel <> "direct" and 