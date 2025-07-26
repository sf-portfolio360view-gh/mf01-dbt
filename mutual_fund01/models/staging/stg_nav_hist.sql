{{config(materialized='view',
         TAG=['daily']
         )
}}

with cte_nav_history as (
    select * from {{source('RAW_LAYER','nav_history')}}
)

select 
    CAST(scheme_code AS STRING) AS scheme_code,
    CAST(fund_name AS STRING) AS fund_name,
    CAST(nav_date AS DATE) AS nav_date,
    CAST(nav_value AS FLOAT) AS nav_value,
    CAST(loading_date AS date) AS loading_date,
    CAST(file_name AS STRING) AS file_name,
    CAST(row_num AS INTEGER) AS row_num

from cte_nav_history