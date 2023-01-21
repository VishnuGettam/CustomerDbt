{{ config(
    materialized = 'table'
) }}

WITH customer_address_stg AS (

    SELECT
        ca_address_sk AS currentaddress_sk,
        CONCAT(
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
        ) AS completeaddress
    FROM
        customer_address
)
SELECT
    *
FROM
    customer_address_stg
