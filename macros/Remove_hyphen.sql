{% macro remove_hyphen(column) %}
    replace({{ column }}, '-', 'UNKNOWN')
{% endmacro %}