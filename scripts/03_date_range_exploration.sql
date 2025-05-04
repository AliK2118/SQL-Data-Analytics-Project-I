--3. DATE EXPLORATION
--=======================================
-- Find the date of the first and the last order
-- how many years of sales are available
SELECT 
MIN(order_date) first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(month, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales;

GO

-- Find the youngest and the oldest customers
SELECT 
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS Oldest_age,
MAX(birthdate) AS youngest,
DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;
