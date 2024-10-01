select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and first_order_date >= '2016-09-01' and first_order_date <= current_timestamp()
)
 as expression


    from `catalog_develop`.`default`.`int_jaffle_data__customer_order_history`
    

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