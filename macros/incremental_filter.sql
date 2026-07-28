{% macro incremental_filter(column) %}
    {% if is_incremental() %}
        where {{ column }} > (select COALESCE(max({{ column }}), '1900-01-01') from {{ this }})
    {% endif %}
{% endmacro %}