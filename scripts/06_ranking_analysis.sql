--6. RANKINGS
--==========================================
--Which 5 products generate the highest revenue?
SELECT TOP 5 p.product_name, SUM(sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_sales DESC;
GO

-- what are the 5 worst performing products in terms of sales?
SELECT TOP 5 p.product_name, SUM(sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_sales;

GO

--Alternatively using window functions
SELECT p.product_name, SUM(f.sales_amount) AS total_revenue, 
ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS product_rank
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name;
GO

--Which 5 products generate the highest revenue?
SELECT * 
FROM (
	SELECT p.product_name, SUM(f.sales_amount) AS total_revenue, 
	ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS product_rank
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON f.product_key = p.product_key
	GROUP BY p.product_name) t
WHERE product_rank <= 5;

GO

-- find the Top-10 customers that have generated the highest revenue
-- and 3 customers withthe fewest orders placed

SELECT TOP 10
c.customer_key,
c.first_name,
c.last_name,
SUM(f.sales_amount) AS total_revenue
--ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS customer_ranking
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c 
ON c.customer_key = f.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_revenue DESC;
GO
--------------------------------------------------------------
SELECT TOP 3
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT order_number) AS total_orders
--ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS customer_ranking
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c 
ON c.customer_key = f.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_orders;
