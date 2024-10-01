-- Build actual result given inputs
with dbt_internal_unit_test_actual as (
  select
    order_id,customer_id,ordered_at,store_id,product_price, 'actual' as `actual_or_expected`
  from (
    WITH  __dbt__cte__stg_jaffle_data__orders as (

-- Fixture for stg_jaffle_data__orders
select cast(101 as string)
 as id, cast(1 as string)
 as customer_id, cast('2023-01-10' as timestamp)
 as ordered_at, cast(1 as string)
 as store_id, cast(null as bigint) as subtotal, cast(null as bigint) as tax_paid, cast(null as bigint) as order_total
union all
select cast(102 as string)
 as id, cast(1 as string)
 as customer_id, cast('2023-02-15' as timestamp)
 as ordered_at, cast(1 as string)
 as store_id, cast(null as bigint) as subtotal, cast(null as bigint) as tax_paid, cast(null as bigint) as order_total
union all
select cast(201 as string)
 as id, cast(2 as string)
 as customer_id, cast('2023-03-10' as timestamp)
 as ordered_at, cast(2 as string)
 as store_id, cast(null as bigint) as subtotal, cast(null as bigint) as tax_paid, cast(null as bigint) as order_total
),  __dbt__cte__stg_jaffle_data__items as (

-- Fixture for stg_jaffle_data__items
select cast(null as string) as id, cast(101 as string)
 as order_id, cast('SKU001' as string)
 as sku
union all
select cast(null as string) as id, cast(102 as string)
 as order_id, cast('SKU002' as string)
 as sku
union all
select cast(null as string) as id, cast(201 as string)
 as order_id, cast('SKU003' as string)
 as sku
),  __dbt__cte__stg_jaffle_data__products as (

-- Fixture for stg_jaffle_data__products
select cast('SKU001' as string)
 as sku, cast('Product A' as string)
 as name, cast('Type A' as string)
 as type, cast(1500 as bigint)
 as price, cast(null as string) as description
union all
select cast('SKU002' as string)
 as sku, cast('Product B' as string)
 as name, cast('Type B' as string)
 as type, cast(2000 as bigint)
 as price, cast(null as string) as description
union all
select cast('SKU003' as string)
 as sku, cast('Product C' as string)
 as name, cast('Type C' as string)
 as type, cast(800 as bigint)
 as price, cast(null as string) as description
), order_items AS (
    SELECT
        o.id AS order_id,
        o.customer_id,
        o.ordered_at,
        o.store_id,
        i.sku,
        p.name AS product_name,
        p.type AS product_type,
        p.price AS product_price
    FROM __dbt__cte__stg_jaffle_data__orders o
    JOIN __dbt__cte__stg_jaffle_data__items i ON o.id = i.order_id
    JOIN __dbt__cte__stg_jaffle_data__products p ON i.sku = p.sku
)

SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY ordered_at) AS customer_order_seq,
    LAG(product_type) OVER (PARTITION BY customer_id ORDER BY ordered_at) AS previous_product_type
FROM order_items
  ) _dbt_internal_unit_test_actual
),
-- Build expected result
dbt_internal_unit_test_expected as (
  select
    order_id, customer_id, ordered_at, store_id, product_price, 'expected' as `actual_or_expected`
  from (
    select cast(101 as string)
 as order_id, cast(1 as string)
 as customer_id, cast('2023-01-10' as timestamp)
 as ordered_at, cast(1 as string)
 as store_id, cast(1500 as bigint)
 as product_price
union all
select cast(102 as string)
 as order_id, cast(1 as string)
 as customer_id, cast('2023-02-15' as timestamp)
 as ordered_at, cast(1 as string)
 as store_id, cast(2000 as bigint)
 as product_price
union all
select cast(201 as string)
 as order_id, cast(2 as string)
 as customer_id, cast('2023-03-10' as timestamp)
 as ordered_at, cast(2 as string)
 as store_id, cast(800 as bigint)
 as product_price
  ) _dbt_internal_unit_test_expected
)
-- Union actual and expected results
select * from dbt_internal_unit_test_actual
union all
select * from dbt_internal_unit_test_expected