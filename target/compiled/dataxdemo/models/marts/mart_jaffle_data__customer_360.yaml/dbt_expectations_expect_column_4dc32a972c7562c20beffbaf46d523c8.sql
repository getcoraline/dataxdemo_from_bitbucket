






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and total_orders >= 1
)
 as expression


    from `catalog_develop`.`default`.`mart_jaffle_data__customer_360`
    

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







