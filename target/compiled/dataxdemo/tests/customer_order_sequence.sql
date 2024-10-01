-- ตรวจสอบว่า customer_order_seq ถูกต้องตามลำดับเวลาของคำสั่งซื้อ
WITH order_validation AS (
    SELECT 
        customer_id,
        order_id,
        customer_order_seq,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY ordered_at) AS calculated_order_seq
    FROM `catalog_develop`.`default`.`int_jaffle_data__order_items`
)
SELECT *
FROM order_validation
WHERE customer_order_seq != calculated_order_seq