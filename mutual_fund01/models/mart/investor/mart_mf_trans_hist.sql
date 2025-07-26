{{config(
        materialized='incremental',
        unique_key='transaction_id',
        TAG=['daily']
)}}


with cte_stg_mf_trans as (
        select *
        from {{ref('stg_mf_trans')}}
)

select *
from cte_stg_mf_trans

{% if is_incremental()%}
  where transaction_date > (select max(transaction_date) from {{this}})
{% endif%}