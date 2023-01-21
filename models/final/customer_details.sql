{{ config(materialized="view") }}

with
    customer as (select * from {{ ref("dim_customer") }}),
    customer_address as (select * from {{ ref("dim_customer_address") }}),
    customer_demographics as (select * from {{ ref("dim_customer_demographics") }})
select
    customer.customerid as customer_id,
    customer.firstname as first_name,
    customer.lastname as last_name,
    customer.emailaddress as emailaddress,
    customer_address.completeaddress as customer_address,
    customer_demographics.gender,
    customer_demographics.maritalstatus,
    customer_demographics.educationstatus
from customer
inner join
    customer_address on customer_address.currentaddress_sk = customer.currentaddress_sk
inner join
    customer_demographics
    on customer.currentdemo_sk = customer_demographics.currentdemo_sk
;
