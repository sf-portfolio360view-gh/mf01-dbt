{{config(
    materialized='view',
    tags=['daily']
)}}

with CTE_fund_data as(
    select * from {{source('RAW_LAYER','fund_master')}}
)

select
cast(scheme_code as STRING ) as scheme_code,
cast(fund_name as STRING) as fund_name,
cast(category as STRING) as category,
cast(amc_name as STRING) as amc_name,
cast(benchmark_index as STRING) as benchmark_index ,
cast(loading_date as date) as loading_date,
cast(file_name as STRING ) as file_name,
cast(row_num as STRING) as row_num,
from CTE_fund_data
