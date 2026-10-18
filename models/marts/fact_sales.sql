select
    f.sale_id,
    f.sale_date,
    d.date_key,
    p.product_key,
    c.customer_key,
    st.store_key,
    f.quantity,
    f.sales_amount

from {{ ref('stg_sales') }} f


join {{ ref('dim_date') }} d 
    on cast(date_format(f.sale_date, 'yyyyMMdd') as int) = d.date_key

join {{ ref('dim_product') }} p 
    on f.product_id = p.product_id

left join {{ ref('dim_customer') }} c 
    on f.customer_id = c.customer_id

left join {{ ref('dim_store') }} st 
    on f.store_id = st.store_id