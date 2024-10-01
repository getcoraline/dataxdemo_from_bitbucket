select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select last_order_date
from `catalog_main`.`default`.`int_jaffle_data__customer_order_history`
where last_order_date is null



      
    ) dbt_internal_test