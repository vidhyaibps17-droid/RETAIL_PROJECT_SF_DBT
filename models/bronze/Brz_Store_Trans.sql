{{config(materilized='incremental',unique_key='TransactionID')}}
select * from {{source('RAW','STORE_TRANSACTIONS_TGT')}}
{% if is_incremental() %}
where update_date > (select COALESCE(max(update_date), '1900-01-01') from {{ this }})
{% endif %}