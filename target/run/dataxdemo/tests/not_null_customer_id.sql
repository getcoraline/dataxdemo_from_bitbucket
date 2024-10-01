select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- ตรวจสอบว่าไม่มี customer_id ที่เป็น NULL
WITH customer_validation AS (
    SELECT 
        customer_id
    FROM `catalog_develop`.`default`.`mart_jaffle_data__customer_360`
)
SELECT *
FROM customer_validation
WHERE customer_id IS NULL
      
    ) dbt_internal_test