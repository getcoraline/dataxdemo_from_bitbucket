select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- ตรวจสอบว่า previous_product_type เป็น NULL สำหรับคำสั่งซื้อแรกของลูกค้าเท่านั้น
-- ตรวจสอบว่า previous_product_type ไม่เป็น NULL สำหรับคำสั่งซื้อที่ไม่ใช่คำสั่งซื้อแรกของลูกค้า
WITH order_validation AS (
    SELECT 
        customer_id,
        order_id,
        customer_order_seq,
        previous_product_type
    FROM `catalog_develop`.`default`.`int_jaffle_data__order_items`
)
SELECT *
FROM order_validation
WHERE (previous_product_type IS NULL AND customer_order_seq != 1)
   OR (previous_product_type IS NOT NULL AND customer_order_seq = 1)
      
    ) dbt_internal_test