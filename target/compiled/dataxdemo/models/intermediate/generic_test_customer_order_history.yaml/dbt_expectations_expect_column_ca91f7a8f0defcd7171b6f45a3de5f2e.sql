






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and last_order_date >= '2017-01-08' and last_order_date <= current_timestamp()
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







