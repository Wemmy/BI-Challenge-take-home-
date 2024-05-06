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
    {{ ref('sales_performance') }}