




    with grouped_expression as (
    select
        
        
    
  previous_product_type is null as expression


    from `catalog_develop`.`default`.`int_jaffle_data__order_items`
    where
        customer_order_seq = 1
    
    

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



