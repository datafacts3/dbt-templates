{{config(materialized='table',re_data_monitored=true,)}}

with dws_order_detail as (
    select
        dod.sale_order_id as sale_order_id,
        dod.sale_order_no as sale_order_no,
        dod.order_id as order_id,
        dod.order_no as order_no,
        dod.order_status as order_status,
        dod.order_type as order_type,
        dod.order_total_amount as order_total_amount,
        dod.order_time as order_time,
        dod.buyer_id as buyer_id,
        dod.buyer_phone as buyer_phone,
        dod.payment_no as payment_no,
        dod.payment_type as payment_type,
        dod.payment_status as payment_status,
        dod.payment_amount as payment_amount,
        dos.commodity_id as commodity_id,
        dos.commodity_code as commodity_code,
        dos.commodity_name as commodity_name,
        dos.commodity_unit as commodity_unit,
        dos.commodity_price as commodity_price,
        dos.commodity_num as commodity_num,
        dos.commodity_real_amount as commodity_real_amount,
        dos.commodity_picture as commodity_picture,
        dos.commodity_bar_code as commodity_bar_code,
        dos.commodity_category_name as commodity_category_name,
        dos.commodity_category_two_name as commodity_category_two_name,
        dos.commodity_category_three_name as commodity_category_three_name
    from {{ref('dwd_order_detail')}} dod
    left join {{ref('dwd_order_spu')}} dos on dos.sale_order_id = dod.sale_order_id
)

select * from dws_order_detail