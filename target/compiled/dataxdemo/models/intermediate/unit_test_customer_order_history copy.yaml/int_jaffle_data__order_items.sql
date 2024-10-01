
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