select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name
from `catalog_main`.`default`.`stg_jaffle_data__products`
where name is null



      
    ) dbt_internal_test