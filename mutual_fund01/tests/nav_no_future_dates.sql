select 
    scheme_code,
    nav_date
from {{ref('stg_nav_hist')}}
where nav_date > current_date