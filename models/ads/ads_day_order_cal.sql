{{config(materialized='table',re_data_monitored=true,)}}

with ads_day_order_cal as (
    select 
        to_char(dod.order_time, 'YYYY-MM-DD') AS year_month_day,
        COUNT(dod.sale_order_id) AS order_total_num,
        SUM(dod.order_total_amount) AS order_total_amount
    from {{ref('dws_order_detail')}} dod
    GROUP BY year_month_day
)

select * from ads_day_order_cal