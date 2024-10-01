select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customer_id
from `catalog_develop`.`default`.`int_jaffle_data__order_items`
where customer_id is null



      
    ) dbt_internal_test