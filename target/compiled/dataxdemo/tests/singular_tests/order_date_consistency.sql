-- ตรวจสอบว่าวันที่สั่งซื้อของลูกค้าแต่ละคน ไม่เกิดขึ้นก่อนวันที่สั่งซื้อครั้งก่อนหน้า
WITH order_validation AS (
    SELECT 
        customer_id,
        order_id,
        ordered_at,
        LAG(ordered_at) OVER (PARTITION BY customer_id ORDER BY ordered_at) AS prev_order_date
    FROM `catalog_main`.`default`.`int_jaffle_data__order_items`
)
SELECT *
FROM order_validation
WHERE prev_order_date IS NOT NULL AND ordered_at < prev_order_date