select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

    with grouped_expression as (
    select
        
        
    
  
count(*) = 90183
 as expression


    from `catalog_main`.`default`.`int_jaffle_data__order_items`
    

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




      
    ) dbt_internal_test