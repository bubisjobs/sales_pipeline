
select 
distinct customer_id, 
customer_name, 
customer_type, 
order_date, 
order_number, 
prod_name, 
prod_number from {{ source('orders', 'customer_orders') }}
where customer_id is not null