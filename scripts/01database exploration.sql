--1. DATABASE EXPLORATION
--=====================================
-- Explore All Objects in the Database
SELECT * FROM INFORMATION_SCHEMA.TABLES;

GO
  
--Explore ALL Columns in the Database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_products';
