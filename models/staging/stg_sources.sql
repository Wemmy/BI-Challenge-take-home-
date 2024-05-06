
select  
    source,
    daily_spend,
    SPLIT_PART(source, '/', 1) AS source_platform,
    SPLIT_PART(source, '/', 2) AS source_type
from 
    {{ ref('sources') }}
