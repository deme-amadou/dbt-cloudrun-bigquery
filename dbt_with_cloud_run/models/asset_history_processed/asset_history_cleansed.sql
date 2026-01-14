with source as (
        select * from {{ source('asset_history_source', 'asset_history') }}
  ),
  renamed as (
      select
        `Asset ID` as asset_id,
        `Asset type` as asset_type,
        AssetName as asset_name,
        Brief_No as brief_no,
        Brief_Status as brief_status,
        CASE
          when Brand is null Then 0
          else Brand
        end as brand_code,
        Project_ID as project_id,
        Created_On as created_date


      from source
  )
  select * from renamed
    