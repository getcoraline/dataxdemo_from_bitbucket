-- ตรวจสอบเงื่อนไขของลูกค้าที่มีความจงรักภักดี (loyal customer)
WITH customer_validation AS (
    SELECT 
        is_loyal_customer,
        customer_lifetime_days,
        total_orders
    FROM `catalog_main`.`default`.`mart_jaffle_data__customer_360`
)
SELECT *
FROM customer_validation
WHERE is_loyal_customer = TRUE AND (customer_lifetime_days <= 180 OR total_orders <= 10)