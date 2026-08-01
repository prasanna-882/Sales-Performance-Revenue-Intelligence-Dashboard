-- Create a cleaned sales table to store validated and transformed data
CREATE TABLE IF NOT EXISTS raw_sales_cleaned (
    order_id VARCHAR(50),              -- Unique order identifier
    customer_id VARCHAR(50),           -- Unique customer identifier
    product_category VARCHAR(100),     -- Category of the product
    product_price DECIMAL(10,2),       -- Price per unit of product
    quantity INT,                      -- Number of units purchased
    order_date DATE,                   -- Converted order date
    region VARCHAR(50),                -- Sales region
    payment_method VARCHAR(50),        -- Mode of payment (Card, UPI, etc.)
    delivery_days INT,                 -- Days taken for delivery
    is_returned TINYINT(1),            -- Return flag (1 = Returned, 0 = Not Returned)
    customer_rating DECIMAL(3,1),      -- Customer rating (e.g., 4.5)
    discount_percent DECIMAL(5,2),     -- Discount percentage applied
    revenue DECIMAL(12,2)              -- Final revenue after discount
);

-- Insert cleaned and transformed data from the raw staging table
INSERT INTO raw_sales_cleaned (
    order_id,
    customer_id,
    product_category,
    product_price,
    quantity,
    order_date,
    region,
    payment_method,
    delivery_days,
    is_returned,
    customer_rating,
    discount_percent,
    revenue
)
SELECT
    order_id,                                      -- Order ID from raw data
    customer_id,                                   -- Customer ID from raw data
    product_category,                              -- Product category
    CAST(product_price AS DECIMAL(10,2)),          -- Convert price to decimal format
    CAST(quantity AS SIGNED),                      -- Convert quantity to integer
    STR_TO_DATE(order_date, '%d-%m-%Y'),           -- Convert string date to DATE format
    region,                                        -- Region information
    payment_method,                                -- Payment method
    CAST(delivery_days AS SIGNED),                 -- Convert delivery days to integer
    CAST(is_returned AS BINARY),                   -- Convert return flag to boolean-like value
    CAST(customer_rating AS DECIMAL(3,1)),         -- Convert rating to decimal
    CAST(discount_percent AS DECIMAL(5,2)),        -- Convert discount to percentage
    CAST(revenue AS DECIMAL(12,2))                 -- Convert revenue to decimal
FROM temp_raw_sales;                               -- Source raw/staging table
