

with all_values as (

    select
        product_type as value_field

    from `catalog_main`.`default`.`int_jaffle_data__order_items`
    

),
set_values as (

    select
        cast('jaffle' as string) as value_field
    union all
    select
        cast('beverage' as string) as value_field
    
    
),
validation_errors as (
    -- values from the model that are not in the set
    select
        v.value_field
    from
        all_values v
        left join
        set_values s on v.value_field = s.value_field
    where
        s.value_field is null

)

select *
from validation_errors

