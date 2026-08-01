-- =========================================================
-- 1. Create Database
-- =========================================================
CREATE DATABASE IF NOT EXISTS shop_ease_sales;
USE shop_ease_sales;


-- =========================================================
-- 2. Create Tem Raw Data Table
-- =========================================================

CREATE TABLE IF NOT EXISTS temp_raw_sales (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    product_category VARCHAR(100),
    product_price VARCHAR(20),
    quantity VARCHAR(10),
    order_date VARCHAR(20),
    region VARCHAR(50),
    payment_method VARCHAR(50),
    delivery_days VARCHAR(10),
    is_returned VARCHAR(10),
    customer_rating VARCHAR(10),
    discount_percent VARCHAR(10),
    revenue VARCHAR(20)
);

