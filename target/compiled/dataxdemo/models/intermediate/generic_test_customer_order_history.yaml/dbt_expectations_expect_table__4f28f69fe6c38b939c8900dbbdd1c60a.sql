

    with grouped_expression as (
    select
        
        
    
  
count(*) = 930
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



