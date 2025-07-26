

{{ config(
    materialized='view',
    tags=['daily']
) }}


with CTE_investor as (
    select * 
    from {{ source('RAW_LAYER', 'investor_master') }}
)

select 
    cast(investor_id as string)       as investor_id,
    cast(name as string)              as name,
    cast(email as string)             as email,
    cast(phone as number)             as phone,
    cast(pan_number as string)        as pan,
    cast(created_date as date)        as created_date,
    cast(loading_date as date)        as loading_date,
    cast(file_name as string)         as file_name,
    cast(row_num as number)           as row_num
from CTE_investor  
