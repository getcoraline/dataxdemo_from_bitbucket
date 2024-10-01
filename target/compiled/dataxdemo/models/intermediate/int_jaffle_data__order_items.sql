WITH order_items AS (
    SELECT
        o.id AS order_id,
        o.customer_id,
        o.ordered_at,
        o.store_id,
        i.sku,
        p.name AS product_name,
        p.type AS product_type,
        p.price AS product_price
    FROM `catalog_main`.`default`.`stg_jaffle_data__orders` o
    JOIN `catalog_main`.`default`.`stg_jaffle_data__items` i ON o.id = i.order_id
    JOIN `catalog_main`.`default`.`stg_jaffle_data__products` p ON i.sku = p.sku
)

SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY ordered_at) AS customer_order_seq,
    LAG(product_type) OVER (PARTITION BY customer_id ORDER BY ordered_at) AS previous_product_type
FROM order_items