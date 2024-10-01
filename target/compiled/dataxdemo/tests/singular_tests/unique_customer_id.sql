-- ตรวจสอบว่าไม่มี customer_id มากกว่า 1 record
SELECT *
FROM `catalog_main`.`default`.`int_jaffle_data__customer_order_history`
WHERE customer_id IN (
    SELECT customer_id
    FROM `catalog_main`.`default`.`int_jaffle_data__customer_order_history`
    GROUP BY customer_id
    HAVING COUNT(*) > 1
)