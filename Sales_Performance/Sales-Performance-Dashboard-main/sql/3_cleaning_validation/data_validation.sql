-- ==================================================
-- Perform Data Validation
-- ==================================================

-- 1. Check total record count
SELECT
	COUNT(*) AS Total_Records
FROM raw_sales_cleaned;


-- 2. Check duplicate order IDs
SELECT
	order_id,
    COUNT(*) AS Duplicate_Order
FROM raw_sales_cleaned
GROUP BY order_id
HAVING COUNT(*) > 1;


-- 3. Check NULL values
SELECT
    SUM(order_id IS NULL)            AS null_order_id,
    SUM(customer_id IS NULL)         AS null_customer_id,
    SUM(product_category IS NULL)    AS null_product_category,
    SUM(product_price IS NULL)       AS null_product_price,
    SUM(quantity IS NULL)            AS null_quantity,
    SUM(order_date IS NULL)          AS null_order_date,
    SUM(region IS NULL)              AS null_region,
    SUM(payment_method IS NULL)      AS null_payment_method,
    SUM(delivery_days IS NULL)       AS null_delivery_days,
    SUM(is_returned IS NULL)         AS null_is_returned,
    SUM(customer_rating IS NULL)     AS null_customer_rating,
    SUM(discount_percent IS NULL)    AS null_discount_percent,
    SUM(revenue IS NULL)             AS null_revenue
FROM raw_sales_cleaned;


-- 4. Validate revenue calculation
-- --------------------------------------
-- Revenue Formula
-- (product_price×quantity)−discount
-- --------------------------------------
SELECT
    order_id,
    product_price,
    quantity,
    discount_percent,
    revenue,
    ROUND(
        product_price * quantity * (1 - discount_percent / 100),
        2
    ) AS calculated_revenue
FROM raw_sales_cleaned
WHERE ROUND(
        product_price * quantity * (1 - discount_percent / 100),
        2
    ) <> revenue;


-- 5. Check invalid delivery days
SELECT *
FROM raw_sales_cleaned
WHERE delivery_days < 0 OR delivery_days > 60;


-- 6. Returned orders validation
SELECT *
FROM raw_sales_cleaned
WHERE is_returned NOT IN (0, 1);


-- 7. Date range check
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM raw_sales_cleaned;


-- 8. Region-wise sales sanity check
SELECT
    region,
    COUNT(*) AS total_orders,
    SUM(revenue) AS total_revenue
FROM raw_sales_cleaned
GROUP BY region
ORDER BY total_revenue DESC;