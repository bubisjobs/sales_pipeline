select
  order_date,
  SUM(order_total) AS total_daily_sales,
    COUNT(DISTINCT order_id) AS Number_of_total_orders,
    avg(order_total) AS avg_order_sales
from {{ ref('stg_orders') }}
group by order_date
order by order_date 
