{% snapshot Sales_Snapshot %}
{{config(
    unique_key='OrderID',
    strategy='timestamp',
    updated_at='update_date'
) }}
select * from {{ref('Slv_Sales_Ord')}}
{% endsnapshot %}