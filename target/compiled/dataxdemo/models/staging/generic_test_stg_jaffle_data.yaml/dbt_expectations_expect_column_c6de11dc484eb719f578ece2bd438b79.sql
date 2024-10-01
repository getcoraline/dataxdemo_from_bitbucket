






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and price > 0
)
 as expression


    from `catalog_main`.`default`.`stg_jaffle_data__products`
    

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







