SELECT
    id,
    name
FROM {{ source('jaffle_data_default', 'customers') }}