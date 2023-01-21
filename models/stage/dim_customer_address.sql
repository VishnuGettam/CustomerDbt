{{ config(materialized="table") }}

with
    customer_address_stg as (

        select
            currentaddress_sk,
            concat(
                ca_street_number,
                ' ',
                ca_country,
                ' ',
                ca_street_name,
                ' ',
                ca_street_type,
                ' ',
                ca_suite_number,
                ' ',
                ca_city,
                ' ',
                ca_state,
                ' ',
                ca_county,
                ' ',
                ca_zip,
                ' .'
            ) as completeaddress
        from customer_db.raw_schema.customer_address
    )
select *
from customer_address_stg
