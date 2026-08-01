-- =========================
-- Date Dimension
-- =========================
CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE UNIQUE,
    year INT,
    quarter VARCHAR(2),
    month INT,
    month_name VARCHAR(15),
    day INT,
    week INT
);

-- =========================
-- Product Dimension
-- =========================
CREATE TABLE dim_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_category VARCHAR(100) UNIQUE
);

-- =========================
-- Customer Dimension
-- =========================
CREATE TABLE dim_customer (
    customer_id VARCHAR(50) PRIMARY KEY
);

-- =========================
-- Region Dimension
-- =========================
CREATE TABLE dim_region (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(50) UNIQUE
);

-- =========================
-- Payment Dimension
-- =========================
CREATE TABLE dim_payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_method VARCHAR(50) UNIQUE
);
