select distinct customer_id, 
order_number,
employee_id, 
employee_job_title, 
employee_name, 
order_total, 
order_date, 
prod_number
from {{ source('orders', 'customer_orders') }}