{% macro audit_columns(load_column='load_Date') %}
    {{load_column}},
    cast(update_date as timestamp_ntz) as update_date,
    current_timestamp as DBT_update,
    current_user() as update_user
{% endmacro %}