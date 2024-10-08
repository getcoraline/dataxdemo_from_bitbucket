select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with all_values as (

    select
        is_loyal_customer as value_field

    from `catalog_develop`.`default`.`mart_jaffle_data__customer_360`
    

),
set_values as (

    select
        cast('true' as string) as value_field
    union all
    select
        cast('false' as string) as value_field
    
    
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


      
    ) dbt_internal_test