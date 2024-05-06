WITH monthly_revenue AS (
    SELECT
        cast(EXTRACT(month from date) as integer) AS month,
        source,
        SUM(revenue) AS new_revenue,
        sum(closed_won) as new_clients
    FROM {{ ref('stg_sales_performance') }}  
    WHERE closed_won > 0 
    GROUP BY 1, 2
)

SELECT
    month,
    source,
    SUM(new_revenue) OVER (PARTITION BY source ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS mrr,
    SUM(new_clients) OVER (PARTITION BY source ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS number_clents  
FROM monthly_revenue