with px_data AS (
    select * from {{source("dwh","px_data")}}
)

select
    BriefID as brief_id,
    BriefNo as brief_no,
    BriefType as brief_type,
    ProjectType as project_type,
    ProjectName as project_name,
    ProjectID as project_id,
    BriefStatus as brief_status,
    ProjectStatus as project_status,
    Client as client,
    Brand as brand,
    Budget as budget,
    Currency as currency,
    CreatedDate as creation_timestamp,
    CreatedBy as created_by,
    ModifiedDate as modified_timestamp,
    CountryNames as countries

from px_data