select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customer_id
from `catalog_develop`.`default`.`mart_jaffle_data__customer_360`
where customer_id is null



      
    ) dbt_internal_test