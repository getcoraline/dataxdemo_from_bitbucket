select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sku
from `catalog_develop`.`default`.`stg_jaffle_data__items`
where sku is null



      
    ) dbt_internal_test