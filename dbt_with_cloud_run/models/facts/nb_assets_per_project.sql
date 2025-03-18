{{
  config(
    materialized='table',
    schema='kpis_dataset',
    )
}}
-- Which clients have the highest total number of assets across all projects and what is the 95th percentile of their brand codes?
SELECT
  project_id,
  count(asset_id) as total_assets,
 
FROM {{ ref('combined_brief_and_asset') }}
  
GROUP BY
  project_id
ORDER BY
  total_assets DESC