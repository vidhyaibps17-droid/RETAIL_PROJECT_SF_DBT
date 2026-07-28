{{ config(
    materialized='table'
) }}

select distinct
STORELOCATION,
REGION
from {{ ref('Slv_Sales_Ord') }}