{% snapshot snap_investor_master%}
{{
    config(
        unique_key ='investor_id',
        strategy = 'check',
        check_cols=['name','email','phone']
    )

}}

select 
    INVESTOR_ID, 
    NAME, 
    EMAIL, 
    PHONE,
    PAN, 
    CREATED_DATE, 
    LOADING_DATE, 
    FILE_NAME, 
    ROW_NUM
from {{ref('stg_investor_master')}}


{% endsnapshot %}