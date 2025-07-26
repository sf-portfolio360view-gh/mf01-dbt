{{config(
    materialized='table',
)}}

with cte_current_nav as (
    select 
            scheme_code,
            nav_date,
            nav_value as current_nav
    from {{cal_nav(0)}}  {# macro to calculate - 0 means current day#}
),

invested_time as (
select investor_id, 
scheme_code, 
datediff('day', min(transaction_date), current_date) as invested_tm
from  {{ref('mart_mf_trans_hist')}}
group by investor_id, scheme_code
)

select 
    {{ dbt_utils.generate_surrogate_key(['th.investor_id', 'th.scheme_code']) }} as SGT_KEY,
    cnav.nav_date as AS_OF_DATE,
    th.investor_id, 
    th.scheme_code, 
    th.nav_at_time, 
    cnav.current_nav, 
    th.units,
    it.invested_tm
    
from {{ref('mart_mf_trans_hist')}} th
inner join cte_current_nav cnav
on th.scheme_code=cnav.scheme_code
inner join invested_time it 
on th.scheme_code=it.scheme_code
and th.investor_id=it.investor_id

