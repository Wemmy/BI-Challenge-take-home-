WITH daily_spend AS (
    SELECT
        date,
        a.source,
        sum(revenue) as daily_revenue,
        SUM(daily_spend) as daily_spend
    FROM {{ ref('stg_sales_performance') }} a
    join {{ ref('stg_sources') }} b
    on a.source = b.source
    GROUP BY 1, 2
)
select * from daily_spend