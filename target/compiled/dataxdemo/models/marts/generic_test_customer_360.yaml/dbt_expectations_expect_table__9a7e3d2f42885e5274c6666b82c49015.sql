

    with grouped_expression as (
    select
        
        
    
  
count(*) = 930
 as expression


    from `catalog_main`.`default`.`mart_jaffle_data__customer_360`
    

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



