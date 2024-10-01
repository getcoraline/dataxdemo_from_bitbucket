






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and total_spent >= 0
)
 as expression


    from `catalog_main`.`default`.`int_jaffle_data__customer_order_history`
    

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







