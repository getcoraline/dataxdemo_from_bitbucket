create or replace view `catalog_main`.`default`.`stg_jaffle_data__products`
  
  
  
  as
    SELECT
    sku,
    name,
    type,
    price,
    COALESCE(NULLIF(description, ''), 'No description') AS description
FROM `jaffle_data`.`default`.`products`
