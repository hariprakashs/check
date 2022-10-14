{{ config(materialized='table',schema='NEW_CHECK',pre_hook=[" grant select on {{this}} to role accountadmin"]) }}
select * 
from 
{{ source('sample','customer') }}