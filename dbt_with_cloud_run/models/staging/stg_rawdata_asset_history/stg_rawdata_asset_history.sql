with asset_history AS(

    select * from {{source('dwh', 'asset_history')}}
)

select  
    `Asset ID` as asset_id,
    `Asset type` as asset_type,
    AssetName as asset_name,
    Brand as brand,
    Brief_No as brief_no,
    Brief_status as brief_status,
    Created_Date as creation_date,
    Created_On as creation_timestamp,
    Last_Updated_Date as last_updated_date,
    Project_ID as project_id

from asset_history