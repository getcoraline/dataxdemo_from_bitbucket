select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- ตรวจสอบว่า VIP customers มีคำสั่งซื้อมากกว่าหรือเท่ากับ 20 ครั้ง และใช้จ่ายมากกว่าหรือเท่ากับ 5000
-- ตรวจสอบว่า Regular customers มีคำสั่งซื้อมากกว่าหรือเท่ากับ 10 ครั้ง หรือใช้จ่ายมากกว่าหรือเท่ากับ 1000
-- ตรวจสอบว่า New customers มีคำสั่งซื้อน้อยกว่า 10 ครั้ง และใช้จ่ายน้อยกว่า 1000
WITH customer_validation AS (
    SELECT 
        customer_segment,
        total_orders,
        total_spent
    FROM `catalog_main`.`default`.`mart_jaffle_data__customer_360`
)
SELECT *
FROM customer_validation
WHERE (customer_segment = 'VIP' AND (total_orders < 20 OR total_spent < 5000))
   OR (customer_segment = 'Regular' AND (total_orders < 10 AND total_spent < 1000))
   OR (customer_segment = 'New' AND (total_orders >= 10 OR total_spent >= 1000))
      
    ) dbt_internal_test