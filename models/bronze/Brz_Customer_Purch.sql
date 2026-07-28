{{config(materialized='incremental',unique_key='customerid',incremental_strategy='merge')}}
select * from {{source('RAW','CUSTOMER_PURCHASES_TGT')}}
{% if is_incremental() %}
where update_date > (select max(update_date) from {{ this }})
{% endif %} 