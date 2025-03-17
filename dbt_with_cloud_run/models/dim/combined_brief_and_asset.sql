With px as (
    select
        *
    from 
        {{ ref('px_cleansed') }}
),


ah as (
    select 
        *
    from 
        {{ ref('asset_history_cleansed') }}
)

select
    px.brief_id,
    px.brief_no,
    px.brief_type,
    px.brief_status,
    px.project_name,
    px.project_status,
    px.project_id,
    ah.asset_id,
    ah.asset_type,
    ah.asset_name,
    px.client,
    px.brand_code,
    px.created_date,
    px.country_names,
from 
    px 
inner join 
    ah 
on 
    px.project_id = ah.project_id
