select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customer_order_seq
from `catalog_main`.`default`.`int_jaffle_data__order_items`
where customer_order_seq is null



      
    ) dbt_internal_test