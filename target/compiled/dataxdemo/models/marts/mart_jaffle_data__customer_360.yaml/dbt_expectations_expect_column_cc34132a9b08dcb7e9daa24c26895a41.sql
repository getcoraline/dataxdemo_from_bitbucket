






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and first_order_date >= '2016-09-01' and first_order_date <= current_timestamp()
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







