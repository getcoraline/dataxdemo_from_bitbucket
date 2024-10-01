select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select price
from `catalog_develop`.`default`.`stg_jaffle_data__products`
where price is null



      
    ) dbt_internal_test