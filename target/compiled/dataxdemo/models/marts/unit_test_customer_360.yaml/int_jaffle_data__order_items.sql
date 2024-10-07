
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