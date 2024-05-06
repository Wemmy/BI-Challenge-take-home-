WITH monthly_leads AS (
    SELECT
        cast(EXTRACT(month from date) as integer) AS month, 
        source,
        SUM(leads) AS total_leads
    FROM {{ ref('stg_sales_performance') }}
    GROUP BY 1,2
),

leads_with_previous_month AS (
    SELECT
        month,
        source,
        total_leads,
        LAG(total_leads) OVER (partition by source ORDER BY month) AS previous_month_leads
    FROM monthly_leads
)

SELECT
    month,
    source,
    total_leads,
    previous_month_leads
FROM leads_with_previous_month