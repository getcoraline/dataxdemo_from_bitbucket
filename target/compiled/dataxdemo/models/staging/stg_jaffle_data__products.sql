SELECT
    sku,
    name,
    type,
    price,
    COALESCE(NULLIF(description, ''), 'No description') AS description
FROM `jaffle_data`.`default`.`products`