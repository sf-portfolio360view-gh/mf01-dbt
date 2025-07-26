{{config(
    materialized = 'view',
    tags =['daily']
)}}

with CTE_mf_transaction as (
select * from {{source ('RAW_LAYER', 'mutual_fund_transactions')}}
)


select 
    CAST(transaction_id AS STRING) AS transaction_id,
    CAST(investor_id AS STRING) AS investor_id,
    CAST(fund_name AS STRING) AS fund_name,
    CAST(scheme_code AS STRING) AS scheme_code,
    CAST(transaction_type AS STRING) AS transaction_type,
    CAST(amount AS FLOAT) AS amount,
    CAST(nav_at_time AS FLOAT) AS nav_at_time,
    CAST(units AS FLOAT) AS units,
    CAST(transaction_date AS DATE) AS transaction_date,
    CAST(loading_date AS date) AS loading_date,
    CAST(file_name AS STRING) AS file_name,
    CAST(row_num AS INTEGER) AS row_num
from CTE_mf_transaction
{% if is_incremental() %}
  WHERE transaction_date > (SELECT MAX(transaction_date) FROM {{ this }})
{% endif %}


