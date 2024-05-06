WITH source_data AS (
    SELECT SUM(revenue) AS rev1
    FROM {{ ref('fct_sales_performance') }}
),

joined_data AS (
    SELECT SUM(daily_revenue) AS rev2
    FROM {{ ref('daily_spend') }}
)

SELECT
    rev1, rev2
FROM source_data, joined_data
where rev1 <> rev1