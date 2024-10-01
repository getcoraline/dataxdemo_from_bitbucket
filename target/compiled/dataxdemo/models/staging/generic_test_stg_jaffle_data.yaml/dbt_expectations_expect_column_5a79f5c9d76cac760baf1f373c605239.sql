




    with grouped_expression as (
    select
        
        
    
  name is not null as expression


    from `catalog_main`.`default`.`stg_jaffle_data__customers`
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors



