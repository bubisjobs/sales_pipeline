# Snowflake Data Pipeline with DBT and Airflow

This project demonstrates an end-to-end ELT (Extract, Load, Transform) data pipeline using **Snowflake**, **DBT**, and **Apache Airflow**. It processes sales order data for analytics use cases such as daily sales tracking, customer lifetime value, and employee performance.

---

## 🗂 Project Structure
```
project/
├── airflow/                     # DAGs and orchestration
│   └── dags/
│       └── sales_pipeline.py    # Airflow DAG definition
├── dbt/
│   └── sales_pipeline/          # DBT project folder
│       ├── dbt_project.yml
│       ├── models/
│       │   ├── staging/
│       │   │   ├── stg_orders.sql
│       │   │   └── sources.yml
│       │   └── marts/
│       │       ├── mart_daily_sales.sql
│       │       └── mart_employee_performance.sql
├── data/                        # Raw CSV files
│   └── orders.csv
```

---

## 🛠 Tech Stack
- **Snowflake** (Cloud Data Warehouse)
- **DBT** (Transformations and Testing)
- **Apache Airflow** (Workflow orchestration)
- **Pandas + Snowflake Connector** (Python CSV loading)

---

## 🚀 Pipeline Overview
1. **Extract** raw CSV data (`orders.csv`)
2. **Load** it into the Snowflake `RAW` schema using a Python script
3. **Transform** with DBT into clean staging models and KPIs (marts)
4. **Schedule** and run the pipeline using Airflow

---

## 📊 Key DBT Models
### Staging (`models/staging/`):
- `stg_orders.sql`: Cleans and standardizes raw order data

### Marts (`models/marts/`):
- `mart_daily_sales.sql`: Daily revenue and order metrics
- `mart_employee_performance.sql`: Orders and sales per employee
- `mart_category_revenue.sql`: This query aggregates total revenue by product name from the staging orders table.


---

## 📄 Author
Created by Bubacarr Jobarteh


