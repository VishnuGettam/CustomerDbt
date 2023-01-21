{{ config(materialized="table") }}

with
    customer_demographics as (


        select
            cd_gender as gender,
            cd_marital_status as maritalstatus,
            cd_education_status as educationstatus,
            currentdemo_sk
        from {{ source('raw_schema', 'CUSTOMER_DEMOGRAPHICS') }} 
        
    )

select *
from customer_demographics
