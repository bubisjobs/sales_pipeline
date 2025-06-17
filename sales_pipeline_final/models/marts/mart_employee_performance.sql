SELECT
  employee_id,
  employee_name,
  employee_job_title,
  SUM(order_total) AS total_sales,
  COUNT(DISTINCT order_number) AS total_orders
FROM {{ ref('stg_employees') }}
WHERE employee_id IS NOT NULL
GROUP BY
  employee_id,
  employee_name,
  employee_job_title
ORDER BY total_sales DESC
