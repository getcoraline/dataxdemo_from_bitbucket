create or replace view `catalog_main`.`default`.`stg_jaffle_data__items`
  
  
  
  as
    SELECT
    id,
    order_id,
    sku
FROM `jaffle_data`.`default`.`items`
