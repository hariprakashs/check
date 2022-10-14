{{ config(materialized='table') }}

select c.c_custkey ,
    c.c_name as Name,
    c.c_nationkey as Nation,
    sum(o.o_totalprice) as Total_Price
    from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER c 
left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS o
on o.o_custkey=c.c_custkey
group by 1,2,3