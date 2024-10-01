
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