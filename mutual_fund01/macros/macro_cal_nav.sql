{% macro cal_nav(nday) %}
(
  SELECT scheme_code,
         nav_value,
         nav_date
  FROM (
      SELECT scheme_code, 
            nav_value,
            nav_date,
            ROW_NUMBER() OVER (PARTITION BY scheme_code ORDER BY nav_date DESC) rn
      FROM {{ ref('stg_nav_hist') }}
  ) x
  WHERE rn = {{ nday + 1 }}
)
{% endmacro %}
