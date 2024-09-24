WITH customer_info AS (
    SELECT
        c.id AS customer_id,
        c.name AS customer_name,
        coh.total_orders,
        coh.total_spent,
        coh.avg_order_value,
        coh.first_order_date,
        coh.last_order_date,
        coh.customer_lifetime_days,
        coh.customer_segment
    FROM {{ ref('stg_jaffle_data__customers') }} c
    LEFT JOIN {{ ref('int_jaffle_data__customer_order_history') }} coh
        ON c.id = coh.customer_id
),
customer_products AS (
    SELECT
        customer_id,
        array_join(collect_set(product_type), ', ') AS product_types_purchased,
        COUNT(DISTINCT product_type) AS unique_product_types_count
    FROM {{ ref('int_jaffle_data__order_items') }}
    GROUP BY 1
),
customer_stores AS (
    SELECT
        customer_id,
        array_join(collect_set(cast(store_id as string)), ', ') AS visited_store_ids,
        COUNT(DISTINCT store_id) AS unique_stores_visited
    FROM {{ ref('int_jaffle_data__order_items') }}
    GROUP BY 1
)

SELECT
    ci.*,
    cp.product_types_purchased,
    cp.unique_product_types_count,
    cs.visited_store_ids,
    cs.unique_stores_visited,
    CASE 
        WHEN ci.customer_lifetime_days > 180 AND ci.total_orders > 10 THEN TRUE
        ELSE FALSE
    END AS is_loyal_customer
FROM customer_info ci
LEFT JOIN customer_products cp ON ci.customer_id = cp.customer_id
LEFT JOIN customer_stores cs ON ci.customer_id = cs.customer_id