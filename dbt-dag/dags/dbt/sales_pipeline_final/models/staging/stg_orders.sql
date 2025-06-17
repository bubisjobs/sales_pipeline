SELECT
  CAST(order_number AS INTEGER) AS order_id,
  CAST(order_date AS DATE) AS order_date,
  CAST(quantity AS INTEGER) AS quantity,
  price,
  CAST(order_total AS FLOAT) AS order_total,
  customer_id,
  prod_number 
  employee_id,
  prod_name,
FROM {{ source('orders', 'customer_orders') }}
WHERE order_number IS NOT NULL
