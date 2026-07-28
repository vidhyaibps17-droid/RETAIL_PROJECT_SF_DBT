{% macro paymentmethod_standard(column) %}
    case 
        when {{ column }} in ('Cash','cash','CASH') then 'CASH'
        when {{ column }} in ('Credit Card','credit card','CREDIT CARD') then 'CREDIT CARD'
        when {{ column }} in ('Debit Card','debit card','DEBIT CARD') then 'DEBIT CARD'
        when {{ column }} in ('Gift Card','gift card','UPI') then 'UPI'
        else 'OTHERS'
    end
{% endmacro %}
