{{ config(
    materialized = 'table'
) }}

WITH customer_stg AS (

    SELECT
        c_customer_id AS customerid,
        c_first_name AS firstname,
        c_last_name AS lastname,
        c_email_address AS emailaddress,
        c_current_addr_sk AS currentaddress_sk,
        c_current_cdemo_sk AS currentdemo_sk
    FROM
        customer_db.raw_schema.customer
)
SELECT
    *
FROM
    customer_stg;
