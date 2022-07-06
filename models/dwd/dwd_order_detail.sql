{{config(materialized='table',re_data_monitored=true,)}}

with dwd_order_detail as (
    select
        o.id as sale_order_id,
        o.sale_order_no as sale_order_no,
        oc.id as order_id,
        oc.sale_order_child_no as order_no,
        oc.sale_order_child_status as order_status,
        oc.sale_order_child_type as order_type,
        oc.order_total_amount as order_total_amount,
        oc.sale_time as order_time,
        oc.buyer_id as buyer_id,
        oc.buyer_phone as buyer_phone,
        opi.pay_no as payment_no,
        opi.pay_type as payment_type,
        opi.pay_status as payment_status,
        opi.amount as payment_amount
    from {{source('dbt_demo', 'retail_sale_order')}} o
    left join {{source('dbt_demo', 'retail_sale_order_child')}} oc on oc.sale_order_id = o.id
    left join {{source('dbt_demo', 'retail_sale_order_detail')}} od on od.sale_order_child_id = oc.id
    left join {{source('dbt_demo', 'retail_sale_order_pay_info')}} opi on opi.sale_order_child_id = oc.id
)

select * from dwd_order_detail