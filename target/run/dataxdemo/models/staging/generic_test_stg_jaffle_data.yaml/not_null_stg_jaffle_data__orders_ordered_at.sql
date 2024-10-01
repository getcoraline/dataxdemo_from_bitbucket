select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ordered_at
from `catalog_main`.`default`.`stg_jaffle_data__orders`
where ordered_at is null



      
    ) dbt_internal_test