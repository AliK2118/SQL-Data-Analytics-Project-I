--2. DIMENSION EXPLORATION
--======================================
--explore All countries the customers come from.
SELECT DISTINCT country FROM gold.dim_customers;

GO
  
-- explore all categories "The Major DIvisions"
SELECT DISTINCT category, subcategory, product_name 
FROM gold.dim_products
ORDER BY 1,2,3;
