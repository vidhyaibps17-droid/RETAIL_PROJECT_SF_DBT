{{config(materialized='incremental',unique_key='orderid')}}
select * from {{source('RAW','PRODUCT_SALES_ORDERS_TGT')}}
{% if is_incremental()%}
where UPDATE_DATE > (select COALESCE(max(UPDATE_DATE), '1900-01-01') from {{ this }})
{% endif %}