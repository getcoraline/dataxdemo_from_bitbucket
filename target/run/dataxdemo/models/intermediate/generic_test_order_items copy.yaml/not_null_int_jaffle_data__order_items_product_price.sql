select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_price
from `catalog_develop`.`default`.`int_jaffle_data__order_items`
where product_price is null



      
    ) dbt_internal_test