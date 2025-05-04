--4. Part-to-Whole Analysis (proportional analysis)
-- which categories contribute the most to the overall sales
WITH sales_category AS (
SELECT
  category,
  SUM(sales_amount) total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY category
)
SELECT
  category,
  total_sales,
  SUM(total_sales) OVER() overal_sales,
  CONCAT(ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER())*100, 2), ' %') AS percentage_of_total
FROM sales_category 
ORDER BY total_sales DESC;
