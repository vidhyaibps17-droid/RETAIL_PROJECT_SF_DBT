{{config(materialized='incremental',unique_key='productid')}}
select * from {{source('RAW','PRODUCT_INVENTORY_TGT')}}
{% if is_incremental() %}
where UPDATE_DATE > (select COALESCE(max(UPDATE_DATE), '1900-01-01') from {{ this }})
{% endif %}