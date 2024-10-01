
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