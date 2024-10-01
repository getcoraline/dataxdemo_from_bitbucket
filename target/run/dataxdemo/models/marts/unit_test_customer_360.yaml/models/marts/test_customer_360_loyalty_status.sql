-- Build actual result given inputs
with dbt_internal_unit_test_actual as (
  select
    customer_id,is_loyal_customer, 'actual' as `actual_or_expected`
  from (
    WITH  __dbt__cte__stg_jaffle_data__customers as (

-- Fixture for stg_jaffle_data__customers
select cast(1 as string)
 as id, cast('Alice' as string)
 as name
union all
select cast(2 as string)
 as id, cast('Bob' as string)
 as name
),  __dbt__cte__int_jaffle_data__customer_order_history as (

-- Fixture for int_jaffle_data__customer_order_history
select cast(1 as string)
 as customer_id, cast(15 as bigint)
 as total_orders, cast(1500 as bigint)
 as total_spent, cast(100 as double)
 as avg_order_value, cast('2023-01-01' as timestamp)
 as first_order_date, cast('2023-07-20' as timestamp)
 as last_order_date, cast(200 as bigint)
 as customer_lifetime_days, cast('Regular' as string)
 as customer_segment
union all
select cast(2 as string)
 as customer_id, cast(5 as bigint)
 as total_orders, cast(500 as bigint)
 as total_spent, cast(100 as double)
 as avg_order_value, cast('2023-05-01' as timestamp)
 as first_order_date, cast('2023-07-10' as timestamp)
 as last_order_date, cast(100 as bigint)
 as customer_lifetime_days, cast('New' as string)
 as customer_segment
),  __dbt__cte__int_jaffle_data__order_items as (

-- Fixture for int_jaffle_data__order_items
select cast(null as string) as order_id, cast(1 as string)
 as customer_id, cast(null as timestamp) as ordered_at, cast(1 as string)
 as store_id, cast(null as string) as sku, cast(null as string) as product_name, cast('SKU001' as string)
 as product_type, cast(null as bigint) as product_price, cast(null as int) as customer_order_seq, cast(null as string) as previous_product_type
union all
select cast(null as string) as order_id, cast(1 as string)
 as customer_id, cast(null as timestamp) as ordered_at, cast(2 as string)
 as store_id, cast(null as string) as sku, cast(null as string) as product_name, cast('SKU002' as string)
 as product_type, cast(null as bigint) as product_price, cast(null as int) as customer_order_seq, cast(null as string) as previous_product_type
union all
select cast(null as string) as order_id, cast(2 as string)
 as customer_id, cast(null as timestamp) as ordered_at, cast(1 as string)
 as store_id, cast(null as string) as sku, cast(null as string) as product_name, cast('SKU003' as string)
 as product_type, cast(null as bigint) as product_price, cast(null as int) as customer_order_seq, cast(null as string) as previous_product_type
), customer_info AS (
    SELECT
        c.id AS customer_id,
        c.name AS customer_name,
        coh.total_orders,
        coh.total_spent,
        coh.avg_order_value,
        coh.first_order_date,
        coh.last_order_date,
        coh.customer_lifetime_days,
        coh.customer_segment
    FROM __dbt__cte__stg_jaffle_data__customers c
    LEFT JOIN __dbt__cte__int_jaffle_data__customer_order_history coh
        ON c.id = coh.customer_id
),
customer_products AS (
    SELECT
        customer_id,
        array_join(collect_set(product_type), ', ') AS product_types_purchased,
        COUNT(DISTINCT product_type) AS unique_product_types_count
    FROM __dbt__cte__int_jaffle_data__order_items
    GROUP BY 1
),
customer_stores AS (
    SELECT
        customer_id,
        array_join(collect_set(cast(store_id as string)), ', ') AS visited_store_ids,
        COUNT(DISTINCT store_id) AS unique_stores_visited
    FROM __dbt__cte__int_jaffle_data__order_items
    GROUP BY 1
)

SELECT
    ci.*,
    cp.product_types_purchased,
    cp.unique_product_types_count,
    cs.visited_store_ids,
    cs.unique_stores_visited,
    CASE 
        WHEN ci.customer_lifetime_days > 180 AND ci.total_orders > 10 THEN 'true'
        ELSE 'false'
    END AS is_loyal_customer
FROM customer_info ci
LEFT JOIN customer_products cp ON ci.customer_id = cp.customer_id
LEFT JOIN customer_stores cs ON ci.customer_id = cs.customer_id
  ) _dbt_internal_unit_test_actual
),
-- Build expected result
dbt_internal_unit_test_expected as (
  select
    customer_id, is_loyal_customer, 'expected' as `actual_or_expected`
  from (
    select cast(1 as string)
 as customer_id, cast('true' as string)
 as is_loyal_customer
union all
select cast(2 as string)
 as customer_id, cast('false' as string)
 as is_loyal_customer
  ) _dbt_internal_unit_test_expected
)
-- Union actual and expected results
select * from dbt_internal_unit_test_actual
union all
select * from dbt_internal_unit_test_expected