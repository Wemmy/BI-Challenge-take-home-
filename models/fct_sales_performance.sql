{{ config(
    materialized='incremental',
    unique_key='hash_key',  
    incremental_strategy='merge'
) }}


select  
    date,
    rep_id,
    source,
    leads,
    opportunities,
    closed_won,
    revenue,
    md5(CONCAT_WS(',', date, rep_id, source)) AS hash_key
from 
    {{ ref('stg_sales_performance') }}

{% if is_incremental() %}
where date >= (SELECT COALESCE(MAX(date), '2018-01-01') FROM {{ this }})
{% endif %}