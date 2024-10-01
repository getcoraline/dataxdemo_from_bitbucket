create or replace view `catalog_main`.`default`.`stg_jaffle_data__orders`
  
  
  
  as
    SELECT
    id,
    customer as customer_id,
    ordered_at,
    store_id,
    subtotal,
    tax_paid,
    order_total
FROM `jaffle_data`.`default`.`orders`
