{{config(materialized='incremental',unique_key='OrderID')}}
with store_trans as (
    select * from {{ref('Brz_Product_Sales')}}
    {{incremental_filter('update_date')}}
),
--dedup 
dedup_store_trans as (
    select * from store_trans QUALIFY ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY update_date DESC) = 1
),
--data cleansing 

cleaned_data as (
select 
    Date,
    Region,
    {{ uppercase('CustomerType') }} as CustomerType,
    OrderID,  
    storelocation,
    CustomerNAME,
    {{ uppercase('Product') }} as Product,
    Quantity,
    UnitPrice,
    {{ paymentmethod_standard('PaymentMethod') }} as PaymentMethod,
    {{ remove_hyphen('Promotion') }} as Promotion,
        TotalPrice,
    {{ audit_columns() }}
from dedup_store_trans s
)
select a.*,p.payment_code from cleaned_data a
left join {{ref('payment_method')}} p
on a.PaymentMethod = p.Payment_Name