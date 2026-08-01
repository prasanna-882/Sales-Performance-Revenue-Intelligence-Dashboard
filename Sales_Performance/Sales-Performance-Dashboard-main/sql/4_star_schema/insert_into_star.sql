-- Insert into dim_date
INSERT INTO dim_date (order_date, year, quarter, month, month_name, day, week)
SELECT DISTINCT
    order_date,
    YEAR(order_date),
    CONCAT('Q', QUARTER(order_date)),
    MONTH(order_date),
    MONTHNAME(order_date),
    DAY(order_date),
    WEEK(order_date)
FROM raw_sales_cleaned;


-- Insert into dim_product
INSERT INTO dim_product (product_category)
SELECT DISTINCT product_category
FROM raw_sales_cleaned;


-- Insert into dim_customer
INSERT INTO dim_customer (customer_id)
SELECT DISTINCT customer_id
FROM raw_sales_cleaned;

-- Insert into dim_region
INSERT INTO dim_region (region_name)
SELECT DISTINCT region
FROM raw_sales_cleaned;


-- Insert into dim_payment
INSERT INTO dim_payment (payment_method)
SELECT DISTINCT payment_method
FROM raw_sales_cleaned;


-- ============================================================
-- Insert into fact_sales
-- ============================================================

INSERT INTO fact_sales (
    date_id,
    product_id,
    customer_id,
    region_id,
    payment_id,
    quantity,
    product_price,
    discount_percent,
    revenue,
    delivery_days,
    is_returned,
    customer_rating
)
SELECT
    d.date_id,
    p.product_id,
    c.customer_id,
    r.region_id,
    pay.payment_id,
    rs.quantity,
    rs.product_price,
    rs.discount_percent,
    rs.revenue,
    rs.delivery_days,
    rs.is_returned,
    rs.customer_rating
FROM raw_sales_cleaned rs
JOIN dim_date d ON rs.order_date = d.order_date
JOIN dim_product p ON rs.product_category = p.product_category
JOIN dim_customer c ON rs.customer_id = c.customer_id
JOIN dim_region r ON rs.region = r.region_name
JOIN dim_payment pay ON rs.payment_method = pay.payment_method;

