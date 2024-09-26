-- ตรวจสอบว่าไม่มี customer_id ที่เป็น NULL
WITH customer_validation AS (
    SELECT 
        customer_id
    FROM {{ ref('mart_jaffle_data__customer_360') }}
)
SELECT *
FROM customer_validation
WHERE customer_id IS NULL