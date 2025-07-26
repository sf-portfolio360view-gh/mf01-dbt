{{config(
        materialized='view'
)}}

with cte_return as (
select investor_id,
       sum(nav_at_time * units) as invested_amount,
       sum(current_nav * units) as current_amount,
       sum(current_nav * units) - sum(nav_at_time * units) as profit,
       min (invested_tm) as invested_tm 
 from {{ref('fct_mf_trans')}}
 group by investor_id
 )

select  name as investor_name,
        invested_amount,
        current_amount,
        profit,
        ((current_amount-invested_amount)/current_amount)*100 as absolute_return,
        (POWER(current_amount / invested_amount, 365/ invested_tm) -1) *100 as CAGR       
              
from cte_return cr
inner join {{ref('stg_investor_master')}} inv 
on cr.investor_id = inv.investor_id