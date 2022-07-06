{{config(materialized='table',re_data_monitored=true,)}}

with ads_month_order_cal as (
    select 
        to_char(dod.order_time, 'YYYY-MM') AS year_month,
        COUNT(dod.sale_order_id) AS order_total_num,
        SUM(dod.order_total_amount) AS order_total_amount
    from {{ref('dws_order_detail')}} dod
    GROUP BY year_month
)

select * from ads_month_order_cal