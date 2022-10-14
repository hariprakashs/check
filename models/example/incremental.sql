{{ config(materialized='incremental',unique_key='time') }}

select 
*,to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) as time 
from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.TIME_DIM
where time <= current_time



{% if is_incremental() %}

and time > ( select max(time) from {{ this }} )  -- date greater than max date in target table

{% endif %}
