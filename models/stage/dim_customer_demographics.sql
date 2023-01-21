{{ config(materialized="table") }}

with
    customer_demographics as (


        select
            cd_gender as gender,
            cd_marital_status as maritalstatus,
            cd_education_status as educationstatus,
            currentdemo_sk
        from customer_db.raw_schema.customer_demographics
    )

select *
from customer_demographics
