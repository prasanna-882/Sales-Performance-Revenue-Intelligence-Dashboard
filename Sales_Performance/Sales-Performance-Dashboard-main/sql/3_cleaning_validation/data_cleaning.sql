-- Update for Manupulation 
SET SQL_SAFE_UPDATES = 0;

-- Remove records with NULL critical fields
DELETE FROM raw_sales_cleaned
WHERE order_id IS NULL
   OR customer_id IS NULL
   OR order_date IS NULL
   OR product_category IS NULL;

-- Remove records with invalid quantity or price
DELETE FROM raw_sales_cleaned
WHERE quantity <= 0
   OR product_price <= 0;

-- Ensure discount is between 0 and 100
UPDATE raw_sales_cleaned
SET discount_percent = 0
WHERE discount_percent < 0;

UPDATE raw_sales_cleaned
SET discount_percent = 100
WHERE discount_percent > 100;

-- Ensure customer rating is between 1 and 5
UPDATE raw_sales_cleaned
SET customer_rating = NULL
WHERE customer_rating < 1 OR customer_rating > 5;

-- Standardize product category text
UPDATE raw_sales_cleaned
SET product_category = TRIM(UPPER(product_category));

-- Standardize region names
UPDATE raw_sales_cleaned
SET region = TRIM(UPPER(region));

-- Standardize payment method
UPDATE raw_sales_cleaned
SET payment_method = TRIM(UPPER(payment_method));
