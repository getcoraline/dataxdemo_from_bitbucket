select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select id
from `catalog_main`.`default`.`stg_jaffle_data__items`
where id is null



      
    ) dbt_internal_test