{{ config(materialized="table") }}

with
    customer_stg as (

        select
            c_customer_id as customerid,
            c_first_name as firstname,
            c_last_name as lastname,
            c_email_address as emailaddress,
            c_current_addr_sk as currentaddress_sk,
            c_current_cdemo_sk as currentdemo_sk
        from  {{ source('raw_schema', 'CUSTOMERS') }} 
   
    )
select *
from customer_stg
