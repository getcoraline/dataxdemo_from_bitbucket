create or replace view `catalog_main`.`default`.`stg_jaffle_data__customers`
  
  
  
  as
    SELECT
    id,
    name
FROM `jaffle_data`.`default`.`customers`
