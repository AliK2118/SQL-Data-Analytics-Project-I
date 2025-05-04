--- 2. Cumulative Analysis
/*
Calculating the total sales per month and the running total of sales over time
*/
SELECT
  order_date,
  total_sales,
  SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total_sales,
  AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
SELECT
  DATETRUNC(year, order_date) AS order_date,
  SUM(sales_amount) AS total_sales,
  AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
) t

  GO
-------------------------------------------------------------------------
--Alternatively using CTE
-------------------------------------------------------------------------

WITH yearly_sales AS (
SELECT
  DATETRUNC(month, order_date) AS order_date,
  SUM(sales_amount) AS total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
)
SELECT
  order_date,
  total_sales,
  SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales
FROM yearly_sales;
