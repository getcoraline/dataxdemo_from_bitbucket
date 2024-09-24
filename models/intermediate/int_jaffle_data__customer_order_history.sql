WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(product_price) AS total_spent,
        ROUND(AVG(product_price), 2) AS avg_order_value,
        MIN(ordered_at) AS first_order_date,
        MAX(ordered_at) AS last_order_date,
        DATEDIFF(DAY, MIN(ordered_at), MAX(ordered_at)) AS customer_lifetime_days
    FROM {{ ref('int_jaffle_data__order_items') }}
    GROUP BY 1
)

SELECT
    *,
    CASE 
        WHEN total_orders >= 20 AND total_spent >= 5000 THEN 'VIP'
        WHEN total_orders >= 10 OR total_spent >= 1000 THEN 'Regular'
        ELSE 'New'
    END AS customer_segment
FROM customer_orders