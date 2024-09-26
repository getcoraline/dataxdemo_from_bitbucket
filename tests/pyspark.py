import pytest
from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql.types import *

@pytest.fixture(scope="module")
def spark():
    return SparkSession.builder.getOrCreate()

def test_customer_360_model(spark, dbt_adapter):
    # อ้างอิงโมเดลที่เราต้องการทดสอบ
    dbt = dbt_adapter.config()
    customer_360_model = dbt.ref("customer_360_model")
    
    # สร้าง DataFrame จากโมเดล
    df = spark.table(customer_360_model)
    
    # Test 1: ตรวจสอบว่าไม่มี total_orders ที่เป็นลบ
    negative_orders = df.filter(F.col("total_orders") < 0).count()
    assert negative_orders == 0, f"Found {negative_orders} customers with negative total orders"
    
    # Test 2: ตรวจสอบว่า loyal customers มีคุณสมบัติตรงตามเงื่อนไข
    invalid_loyal_customers = df.filter(
        (F.col("is_loyal_customer") == 'true') & 
        ((F.col("customer_lifetime_days") <= 180) | (F.col("total_orders") <= 10))
    ).count()
    assert invalid_loyal_customers == 0, f"Found {invalid_loyal_customers} invalid loyal customers"
    
    # Test 3: ตรวจสอบว่า unique_product_types_count ไม่มากกว่าจำนวน product types ที่ซื้อจริง
    df_with_product_count = df.withColumn(
        "actual_product_count", 
        F.size(F.split(F.col("product_types_purchased"), ", "))
    )
    invalid_product_counts = df_with_product_count.filter(
        F.col("unique_product_types_count") > F.col("actual_product_count")
    ).count()
    assert invalid_product_counts == 0, f"Found {invalid_product_counts} customers with invalid unique product type count"
    
    # Test 4: ตรวจสอบว่าทุก column ที่คาดหวังมีอยู่ใน DataFrame
    expected_columns = [
        "customer_id", "customer_name", "total_orders", "total_spent", 
        "avg_order_value", "first_order_date", "last_order_date", 
        "customer_lifetime_days", "customer_segment", "product_types_purchased", 
        "unique_product_types_count", "visited_store_ids", "unique_stores_visited", 
        "is_loyal_customer"
    ]
    for col in expected_columns:
        assert col in df.columns, f"Column {col} is missing from the DataFrame"
    
    # Test 5: ตรวจสอบว่าไม่มี null values ในคอลัมน์สำคัญ
    important_columns = ["customer_id", "customer_name", "total_orders", "total_spent"]
    for col in important_columns:
        null_count = df.filter(F.col(col).isNull()).count()
        assert null_count == 0, f"Found {null_count} null values in column {col}"

    print("All tests passed successfully!")