{{
  config(
    materialized='table',
    schema='kpis_dataset',
    )
}}
-- Which clients have the highest total number of assets across all projects and what is the 95th percentile of their brand codes?jg
SELECT
  project_id,
  project_name,
  count(asset_id) as total_assets
 
FROM {{ ref('combined_brief_and_asset') }}
  
GROUP BY
  all
ORDER BY
  total_assets DESC