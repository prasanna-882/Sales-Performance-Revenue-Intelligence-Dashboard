CREATE TABLE fact_sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,

    date_id INT,
    product_id INT,
    customer_id VARCHAR(50),
    region_id INT,
    payment_id INT,

    quantity INT,
    product_price DECIMAL(10,2),
    discount_percent DECIMAL(5,2),
    revenue DECIMAL(12,2),
    delivery_days INT,
    is_returned TINYINT(1),
    customer_rating DECIMAL(3,1),

    -- Foreign Keys
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (region_id) REFERENCES dim_region(region_id),
    FOREIGN KEY (payment_id) REFERENCES dim_payment(payment_id)
);
