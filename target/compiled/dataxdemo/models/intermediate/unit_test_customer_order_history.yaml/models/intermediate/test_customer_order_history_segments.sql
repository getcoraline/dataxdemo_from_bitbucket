WITH  __dbt__cte__int_jaffle_data__order_items as (

-- Fixture for int_jaffle_data__order_items
select cast(101 as string)
 as order_id, cast(1 as string)
 as customer_id, cast('2023-01-10' as timestamp)
 as ordered_at, cast(null as string) as store_id, cast(null as string) as sku, cast(null as string) as product_name, cast(null as string) as product_type, cast(1500 as bigint)
 as product_price, cast(null as int) as customer_order_seq, cast(null as string) as previous_product_type
union all
select cast(102 as string)
 as order_id, cast(1 as string)
 as customer_id, cast('2023-02-15' as timestamp)
 as ordered_at, cast(null as string) as store_id, cast(null as string) as sku, cast(null as string) as product_name, cast(null as string) as product_type, cast(2000 as bigint)
 as product_price, cast(null as int) as customer_order_seq, cast(null as string) as previous_product_type
union all
select cast(201 as string)
 as order_id, cast(2 as string)
 as customer_id, cast('2023-03-10' as timestamp)
 as ordered_at, cast(null as string) as store_id, cast(null as string) as sku, cast(null as string) as product_name, cast(null as string) as product_type, cast(800 as bigint)
 as product_price, cast(null as int) as customer_order_seq, cast(null as string) as previous_product_type
), customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(product_price) AS total_spent,
        ROUND(AVG(product_price), 2) AS avg_order_value,
        MIN(ordered_at) AS first_order_date,
        MAX(ordered_at) AS last_order_date,
        DATEDIFF(DAY, MIN(ordered_at), MAX(ordered_at)) AS customer_lifetime_days
    FROM __dbt__cte__int_jaffle_data__order_items
    GROUP BY 1
)

SELECT
    *,
    CASE 
        WHEN total_orders >= 20 AND total_spent >= 5000 THEN 'VIP'
        WHEN total_orders >= 10 OR total_spent >= 1000 THEN 'Regular'
        ELSE 'New'
    END AS customer_segment
FROM customer_orders