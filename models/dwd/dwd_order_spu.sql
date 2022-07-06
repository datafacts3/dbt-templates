{{config(materialized='table',re_data_monitored=true,)}}

with dwd_order_spu as (
    select
        sod.sale_order_id as sale_order_id,
        sod.sale_order_no as sale_order_no,
        sod.sale_order_child_id as order_id,
        sod.sale_order_child_no as order_no,
        sod.commodity_id as commodity_id,
        sod.commodity_code as commodity_code,
        sod.commodity_name as commodity_name,
        sod.commodity_unit as commodity_unit,
        sod.price as commodity_price,
        sod.sale_num as commodity_num,
        sod.real_pay_amount as commodity_real_amount,
        cs.major_picture as commodity_picture,
        cs.bar_code as commodity_bar_code,
        cs.category_name as commodity_category_name,
        cs.category_two_name as commodity_category_two_name,
        cs.category_three_name as commodity_category_three_name
    from {{source('public', 'retail_sale_order_detail')}} sod
    inner join {{source('public', 'retail_commodity_sku')}} cs on cs.id = sod.commodity_id
)

select * from dwd_order_spu