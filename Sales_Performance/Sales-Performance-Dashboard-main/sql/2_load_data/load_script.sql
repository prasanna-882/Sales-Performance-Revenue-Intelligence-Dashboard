-- =========================================================
-- LOAD DATA INTO TEMP TABLE (temp_raw_sales)
-- =========================================================
-- This script imports data from CSV into the temporary table.
-- We use temp table first to handle data cleaning & conversion later.

-- NOTE:
-- 1) Ensure the CSV file is saved in the MySQL upload folder.
-- 2) File path must match the secure_file_priv folder.
-- 3) The CSV file should have a header row.

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/synthetic_ecommerce_sales_2025.csv"
INTO TABLE temp_raw_sales

-- Columns are separated by comma
FIELDS TERMINATED BY ','

-- Values may be enclosed by double quotes
ENCLOSED BY '"'

-- Each row ends with a new line
LINES TERMINATED BY '\n'

-- Ignore the header row (first row)
IGNORE 1 ROWS;

