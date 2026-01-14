with renamed_px as (
  select
    BriefID as brief_id,
    BriefNo as brief_no,
    BriefType as brief_type,
    ProjectName as project_name,
    BriefStatus as brief_status,
    ProjectStatus as project_status,
    ProjectID as project_id,
    Client as client,
    SAFE_CAST(BrandCode as FLOAT64) as brand_code,
    Brand as brand,
    CreatedDate as created_date,
    CountryNames as country_names,
  from 
    {{ source('px_source', 'px_data') }}
),
transformed_px as (
  select
    brief_id,
    brief_no,
    brief_type,
    project_name,
    brief_status,
    project_status,
    project_id,
    client,
    CASE
      when brand_code is null then 0
      else brand_code
    end as brand_code,
    brand,
    created_date,
    country_names,
  from
    renamed_px
)
select 
    * 
from 
    transformed_px
