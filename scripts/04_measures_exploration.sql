--4. MEASURES EXPLORATION
--=========================================
-- find the total sales
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales;
GO
  
-- find how many items are sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales;
GO
  
-- find the average selling price
SELECT AVG(price) AS avg_price FROM gold.fact_sales;
GO

-- find the total number of orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales;
GO
SELECT COUNT(DISTINCT order_number) AS total_order FROM gold.fact_sales;
GO

-- find the total number of products
SELECT COUNT(DISTINCT product_key) AS total_products FROM gold.dim_products;
GO
SELECT COUNT(product_key) AS total_products FROM gold.dim_products;
GO
---- find the total number of customers
SELECT COUNT(customer_key) AS total_number_of_customers FROM gold.dim_customers;
GO
---- find the total number of customers that have placed an order
SELECT COUNT(customer_key) AS total_customers_with_orders FROM gold.fact_sales;
GO
SELECT COUNT(DISTINCT customer_key) AS total_customers_with_orders FROM gold.fact_sales;
GO
-- Generate a report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total No. Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total No. Products', COUNT(product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total No. Customers', COUNT(DISTINCT customer_key) FROM gold.dim_customers;
