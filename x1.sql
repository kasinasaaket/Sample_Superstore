-- =========================
-- x1.sql - Data Analysis for online_sales
-- =========================

-- Step 0: Switch to the correct database
USE superstore_db;

-- Step 1: Check available tables
SHOW TABLES;

-- Step 2: Preview first 2 rows
SELECT * FROM online_sales LIMIT 2;

-- Step 3: Monthly Revenue and Order Volume using DATE_FORMAT
SELECT
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS YearMonth,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    COUNT(DISTINCT `Order ID`) AS Order_Volume
FROM online_sales
GROUP BY YearMonth
ORDER BY YearMonth;

-- Step 4: Monthly Revenue and Order Volume using EXTRACT
SELECT
    EXTRACT(YEAR FROM STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
    EXTRACT(MONTH FROM STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    COUNT(DISTINCT `Order ID`) AS Order_Volume
FROM online_sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- =========================
-- Optional: Query another table example
-- Uncomment and edit if needed
-- =========================
-- USE your_user_db;  -- replace with actual DB containing COCUBE
-- SELECT * FROM COCUBE WHERE `Name` = 'Kasina Saaket';
