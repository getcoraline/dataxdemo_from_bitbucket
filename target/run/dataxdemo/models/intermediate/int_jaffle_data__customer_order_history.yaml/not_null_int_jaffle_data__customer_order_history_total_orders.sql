select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_orders
from `catalog_develop`.`default`.`int_jaffle_data__customer_order_history`
where total_orders is null



      
    ) dbt_internal_test