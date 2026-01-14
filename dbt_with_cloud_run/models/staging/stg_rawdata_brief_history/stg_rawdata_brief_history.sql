with brief_history AS (
    select  
        *
    from 
        {{source("dwh","brief_history")}}
)

select 
    Brand as brand,
    Brief_History_ID as brief_history_id,
    Brief_No as brief_no,
    Brief_Status as brief_status,
    Created_On as creation_date,
    Created_On_2 as creation_timestamp
from brief_history