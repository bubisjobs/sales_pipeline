import pandas as pd
import snowflake.connector

conn = snowflake.connector.connect(
    user='Bubisjobs',
    password='Mberrykamaso97@',
    account='jvrrwvk-qt99350',
    warehouse='dbt_wh',
    database='SALES_DB',
    schema='dev_schema'
)

cs = conn.cursor()

df = pd.read_csv("unique_customer_orders.csv")

# Create table in Snowflake
create_sql = """
CREATE OR REPLACE TABLE RAW.ORDERS (
    ORDER_NUMBER INTEGER,
    EMPLOYEE_ID INTEGER,
    EMPLOYEE_NAME_1 STRING,
    EMPLOYEE_NAME_2 STRING,
    EMPLOYEE_JOB_TITLE STRING,
    ORDER_DATE DATE,
    ORDER_TYPE STRING,
    CUSTOMER_TYPE STRING,
    CUSTOMER_ID INTEGER,
    CUSTOMER_NAME_1 STRING,
    CUSTOMER_NAME_2 STRING,
    PROD_CATEGORY STRING,
    PROD_NUMBER STRING,
    PROD_NAME STRING,
    QUANTITY INTEGER,
    PRICE FLOAT,
    ORDER_TOTAL FLOAT
)
"""
cs.execute(create_sql)

# Insert rows into Snowflake
for _, row in df.iterrows():
    cs.execute(
        "INSERT INTO RAW.ORDERS VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
        tuple(row)
    )

cs.close()
conn.close()
