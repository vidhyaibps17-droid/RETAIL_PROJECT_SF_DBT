{% macro uppercase(column) %}
    COALESCE(UPPER(TRIM({{ column }})),'UNKNOWN')
{% endmacro %}