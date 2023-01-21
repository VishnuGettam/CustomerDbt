{{
    config(materialized = 'table')
}}

with customer_demographics AS
(

    
select 
CD_GENDER as Gender,
CD_MARITAL_STATUS as maritalstatus,
CD_EDUCATION_STATUS as educationstatus,
CD_DEMO_SK as currentdemo_sk
from customer_demographics
)

select * from customer_demographics 