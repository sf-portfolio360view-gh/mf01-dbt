

{% macro generate_schema_name(custom_schema_name, node) -%}
  {%- if node.resource_type == 'snapshot' -%}
    snapshots
  {%- elif node.resource_type == 'seed' -%}
    seeds
  {%- elif custom_schema_name is not none -%}
    {{ custom_schema_name | trim }}
  {%- else -%}
    {{ target.schema }}
  {%- endif -%}
{%- endmacro %}

		
		

--------------my version-------

{% macro generate_schema_name(node) -%}
  {%- if node.resource_type == 'snapshot' -%}
    snapshots
  {%- elif node.resource_type == 'seed' -%}
    seeds
  {%- elif node.resource_type == 'model' and 'staging' in node.fqn -%}   -- fqn means fully qualified name
    staging
  {%- elif node.resource_type == 'model' and 'mart' in node.fqn -%}
    mart
  {%- else -%}
    {{ target.schema }}
  {%- endif -%}
{%- endmacro %}

