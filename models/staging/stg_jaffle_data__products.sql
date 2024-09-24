SELECT
    sku,
    name,
    type,
    price,
    COALESCE(NULLIF(description, ''), 'No description') AS description
FROM {{ source('jaffle_data_default', 'products') }}