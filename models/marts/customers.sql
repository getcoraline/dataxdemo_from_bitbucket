with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

customer_orders as (

    select
        customer as customer_id,

        min(date(ordered_at)) as first_order_date,
        max(date(ordered_at)) as most_recent_order_date,
        count(id) as number_of_orders

    from orders

    group by 1

),

final as (

    select
        customers.id as customer_id,
        customers.name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders on customers.id = customer_orders.customer_id

)

select * from final