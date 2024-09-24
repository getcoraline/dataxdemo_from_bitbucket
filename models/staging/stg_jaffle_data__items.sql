SELECT
    id,
    order_id,
    sku
FROM {{ source('jaffle_data_default', 'items') }}