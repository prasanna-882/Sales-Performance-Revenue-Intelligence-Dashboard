CREATE OR REPLACE VIEW sales_summary_view AS
SELECT
    -- =========================
    -- Order & Date Attributes
    -- =========================
    d.order_date,
    d.year,
    d.quarter,
    d.month,
    d.month_name,
    d.week,

    -- =========================
    -- Dimensions
    -- =========================
    p.product_category,
    r.region_name AS region,
    pay.payment_method,
    c.customer_id,

    -- =========================
    -- Measures (Facts)
    -- =========================
    f.quantity,
    f.product_price,
    f.discount_percent,
    f.revenue,
    f.delivery_days,
    f.is_returned,
    f.customer_rating,

    -- =========================
    -- Derived Metrics
    -- =========================
    (f.product_price * f.quantity) AS gross_sales,
    (f.product_price * f.quantity) - f.revenue AS discount_amount,
    CASE
        WHEN f.is_returned = 1 THEN 'Returned'
        ELSE 'Not Returned'
    END AS return_status

FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_region r ON f.region_id = r.region_id
JOIN dim_payment pay ON f.payment_id = pay.payment_id
JOIN dim_customer c ON f.customer_id = c.customer_id;


SELECT * FROM sales_summary_view;