






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and tax_paid >= 0
)
 as expression


    from `catalog_main`.`default`.`stg_jaffle_data__orders`
    

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







