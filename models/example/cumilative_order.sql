{{ config(materialized='table') }}
select 
    o_orderdate as date,
    sum(o_totalprice) as price 
    from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS 
group by 1