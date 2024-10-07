
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