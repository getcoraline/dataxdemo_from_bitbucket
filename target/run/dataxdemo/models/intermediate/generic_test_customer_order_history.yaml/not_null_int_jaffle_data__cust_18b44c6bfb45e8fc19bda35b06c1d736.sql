select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select avg_order_value
from `catalog_main`.`default`.`int_jaffle_data__customer_order_history`
where avg_order_value is null



      
    ) dbt_internal_test