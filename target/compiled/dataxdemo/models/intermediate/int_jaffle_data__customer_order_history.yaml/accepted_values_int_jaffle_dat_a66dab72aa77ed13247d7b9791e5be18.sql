
    
    

with all_values as (

    select
        customer_segment as value_field,
        count(*) as n_records

    from `catalog_develop`.`default`.`int_jaffle_data__customer_order_history`
    group by customer_segment

)

select *
from all_values
where value_field not in (
    'VIP','Regular','New'
)


