

with all_values as (

    select
        customer_segment as value_field

    from `catalog_develop`.`default`.`mart_jaffle_data__customer_360`
    

),
set_values as (

    select
        cast('VIP' as string) as value_field
    union all
    select
        cast('Regular' as string) as value_field
    union all
    select
        cast('New' as string) as value_field
    
    
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

