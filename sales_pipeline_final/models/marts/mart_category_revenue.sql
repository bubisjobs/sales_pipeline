select 
distinct prod_name,
sum(order_total) as total_revenue
from {{ ref('stg_orders') }}
where prod_name is not null
GROUP BY prod_name
ORDER BY total_revenue DESC