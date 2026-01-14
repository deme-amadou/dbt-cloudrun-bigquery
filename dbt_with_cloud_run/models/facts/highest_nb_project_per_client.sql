{{
  config(
    materialized='table',
    schema='kpis_dataset',
    )
}}
-- Which clients have the highest total number of assets across all projects and what is the 95th percentile of their brand codes?
SELECT
  client,
  SUM(asset_count) AS total_assets,
  APPROX_QUANTILES(brand_code, 100)[
OFFSET
  (95)] AS percentile_95_brand_code
FROM (
  SELECT
    client,
    COUNT(*) AS asset_count,
    AVG(brand_code) AS brand_code
  FROM
    {{ref('combined_brief_and_asset')}}
  WHERE
    created_date BETWEEN '2023-01-01'
    AND '2025-12-31'
  GROUP BY
    client,
    project_id)
GROUP BY
  client
ORDER BY
  total_assets DESC