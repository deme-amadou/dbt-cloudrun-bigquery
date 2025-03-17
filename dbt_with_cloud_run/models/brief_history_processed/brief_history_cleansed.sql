with source_cte as (
        select * from {{ source('brief_history_source', 'brief_history') }}
  ),
  renamed as (
      select
          {{ adapter.quote("Brief_History_ID") }} as brief_id,
          {{ adapter.quote("Brief_No") }} as brief_no,
          {{ adapter.quote("Brief_Status") }} as brief_status,
          CASE 
            when Brand is null then 0
            else Brand
          end as brand_code,
          {{ adapter.quote("Created_On_2") }} as created_date,
          {{ adapter.quote("Source") }} as source

      from 
        source_cte
  )
  select * from renamed
    