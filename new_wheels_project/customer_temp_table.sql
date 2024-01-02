SELECT cus.customer_id, order_id, credit_card_type, order_table.discount FROM newninja.customer_t cus
join (select customer_id, order_id, discount from newninja.order_t) as order_table 
on cus.customer_id = order_table.customer_id;